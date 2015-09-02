/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
var dir = require('node-dir');
var path = require('path');
var temp = require('temp').track();
var fs = require('fs-extra');
var sax = require('sax');
var svgPathParser = require('svg-path-parser');
var Q = require('q');
var colorUtil = require('../util/color');
var utilString = require('../util/string');

var GLOBAL_CONFIG;
var CONFIG = {
  IOS_COLOR_FACTORY_TEMPLATE_NAME:'SLDSColorMsgTemplate',
  IOS_COLOR_FACTORY_NAME:'SLDSColorMsg',
  COLORS_FILE_NAME:'messaging.json'
};


var readColors = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.FORCE_BASE_TOKENS_DIR,CONFIG.COLORS_FILE_NAME);

  var colors = {};
  var colorEnum = [];
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      var colors = JSON.parse(src).props;
      Object.keys(colors).map(function(name){
        var color = colors[name];

        if(color.category && color.category.indexOf('color')>-1){
          var rgb = {};
          var alias;
          if(color.value.indexOf('{!')===0){
            alias = 'SFDS_ALIAS_'+color.value.replace('{!','').replace('}','');
          }
          else{
            console.log('!!! MSG COLOR FORMAT ISSUE: ',color.value);
            alias = 'SFDS_ALIAS_NOTFOUND';
          }
          var enumName = utilString.camelCase(name).replace('Color','SLDSColorMsg');
          colors[enumName] = alias;
          colorEnum.push(enumName);
        }
      });

      opts.colors = colors;
      opts.colorEnum = colorEnum;

      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};

var readTemplateClass = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_COLOR_FACTORY_TEMPLATE_NAME+'.m');
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      if(!opts.template){
        opts.template = {};
      }
      opts.template.classSrc = src;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};

var readTemplateHeader = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_COLOR_FACTORY_TEMPLATE_NAME+'.h');
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      if(!opts.template){
        opts.template = {};
      }
      opts.template.headerSrc = src;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};


var replaceHeaderTokens = function(opts){

  var deferred = Q.defer();

  if(!opts.template || !opts.template.headerSrc){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.originHeader" not found'));
  }

  if(!opts.colorEnum || !opts.colors){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.classNames" not found'));
  }


  opts.headerSrc = opts.template.headerSrc.replace(new RegExp(CONFIG.IOS_COLOR_FACTORY_TEMPLATE_NAME,"g"), CONFIG.IOS_COLOR_FACTORY_NAME)
    .replace('SLDS_COLOR_MSG_NOTFOUND,','')
    .replace('/*COLOR_ENUM_VALUES*/',opts.colorEnum.join(',\n\t'));

  deferred.resolve(opts);
  return deferred.promise;
};

var replaceClassTokens = function(opts){
  var deferred = Q.defer();


  if(!opts.template || !opts.template.classSrc){
    return deferred.reject(new Error('replaceClassTokens: "opts.originHeader" not found'));
  }

  if(!opts.colorEnum || !opts.colors){
    return deferred.reject(new Error('replaceClassTokens: "opts.classNames" not found'));
  }

  var enumItemNames = opts.colorEnum.map(function(enamName){
    return '@"'+enamName+'"';
  });

  var colorCases = opts.colorEnum.map(function(name){
    var body = [];
    var alias = opts.colors[name];
    body.push('\tcase '+name+':{');
      body.push('\t\t\taliasColor = [SLDSColorAlias sldsColor:'+alias+'];');
      body.push('\t\t\tbreak;}');
    return body.join('\n');
  });

  var colorAliases = opts.colorEnum.map(function(name){
    return opts.colors[name];
  });

  opts.classSrc = opts.template.classSrc.replace(new RegExp(CONFIG.IOS_COLOR_FACTORY_TEMPLATE_NAME,"g"), CONFIG.IOS_COLOR_FACTORY_NAME)
    .replace('/*COLOR_ENUM_STRING_VALUES*/',enumItemNames.join(',\\\n'))
      .replace('/*COLOR_ALIAS_VALUES*/',colorAliases.join(',\n'));
  deferred.resolve(opts);
  return deferred.promise;
};


var saveHeader = function(opts){
  var deferred = Q.defer();
  if(!opts.headerSrc){
    return deferred.reject(new Error('saveHeader: "opts.header" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.IOS_COLOR_FACTORY_NAME+'.h');
  fs.outputFile(fileName, opts.headerSrc, function(err){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

var saveClass = function(opts){
  var deferred = Q.defer();
  if(!opts.classSrc){
    return deferred.reject(new Error('saveClass: "opts.header" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.IOS_COLOR_FACTORY_NAME+'.m');
  fs.outputFile(fileName, opts.classSrc, function(err){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

module.exports = function(config){
  GLOBAL_CONFIG = config;
  return {
    run: function(opts){
      return readColors({tempDir:opts.tempDir})
        .then(readTemplateClass)
        .then(readTemplateHeader)
        .then(replaceHeaderTokens)
        .then(replaceClassTokens)
        .then(saveHeader)
        .then(saveClass)
    }
  }
};