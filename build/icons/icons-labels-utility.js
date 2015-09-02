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
var Q = require('q');
var cssParse = require('css-parse');
var utilString = require('../util/string');

var GLOBAL_CONFIG;
var CONFIG = {
  IOS_ICON_FACTORY_TEMPLATE_NAME:'SLDSIconLabelUtilityTemplate',
  IOS_ICON_FACTORY_NAME:'SLDSIconLabelUtility',
  CSS_FILE_NAME:'SalesforceDesignSystemIconsUtility.css'
};


var readIconCSS = function(opts){

  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.DIST_CSS,CONFIG.CSS_FILE_NAME);
  var icons = {};
  var iconEnum = [];
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      var css = cssParse(src);
      css.stylesheet.rules.map(function(rule){
        if(rule && rule.selectors && rule.declarations){
          var selector = rule.selectors[0];
          var name = selector.substring(selector.lastIndexOf('-')+1,selector.indexOf(':'));
          var declaration = rule.declarations[0];
          if(declaration && declaration.property && declaration.property === 'content'){
            var value = declaration.value;
            if(name && value){
              var enumName = 'SLDSIconUtility'+utilString.camelCase(name);
              icons[enumName] = value.replace(/\"/g,'').replace('\\','\\u');
              iconEnum.push(enumName);
            }
          }
        }
      });
      opts.icons = icons;
      opts.iconEnum = iconEnum;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};

var readTemplateClass = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_ICON_FACTORY_TEMPLATE_NAME+'.m');
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        console.log(error);
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
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_ICON_FACTORY_TEMPLATE_NAME+'.h');
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

  if(!opts.iconEnum || !opts.icons){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.classNames" not found'));
  }


  opts.headerSrc = opts.template.headerSrc.replace(new RegExp(CONFIG.IOS_ICON_FACTORY_TEMPLATE_NAME,"g"), CONFIG.IOS_ICON_FACTORY_NAME)
    .replace('/*ICON_ENUM_VALUES*/',opts.iconEnum.join(',\n\t'))
    .replace('SLDS_ICON_NOTFOUND,','');

  deferred.resolve(opts);
  return deferred.promise;
};

var replaceClassTokens = function(opts){
  var deferred = Q.defer();


  if(!opts.template || !opts.template.classSrc){
    return deferred.reject(new Error('replaceClassTokens: "opts.originHeader" not found'));
  }

  if(!opts.iconEnum || !opts.icons){
    return deferred.reject(new Error('replaceClassTokens: "opts.classNames" not found'));
  }

  var enumItemNames = opts.iconEnum.map(function(enamName){
    var value = opts.icons[enamName];
    return '@"'+value+'"';
  });

  var iconLables = opts.iconEnum.map(function(enamName){
    return '@"'+enamName+'"';
  });

  opts.classSrc = opts.template.classSrc.replace(new RegExp(CONFIG.IOS_ICON_FACTORY_TEMPLATE_NAME,"g"), CONFIG.IOS_ICON_FACTORY_NAME)
    .replace('/*ICON_ENUM_STRING_VALUES*/',iconLables.join(',\\\n'));
  deferred.resolve(opts);
  return deferred.promise;
};


var saveHeader = function(opts){
  var deferred = Q.defer();
  if(!opts.headerSrc){
    return deferred.reject(new Error('saveHeader: "opts.header" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.IOS_ICON_FACTORY_NAME+'.h');
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
  var fileName = path.join(opts.tempDir,CONFIG.IOS_ICON_FACTORY_NAME+'.m');
  fs.outputFile(fileName, opts.classSrc, function(err){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

module.exports = function(config){
  GLOBAL_CONFIG = config;
  return {
    run: function(opts){
      return readIconCSS({tempDir:opts.tempDir})

        .then(readTemplateClass)
        .then(readTemplateHeader)
        .then(replaceHeaderTokens)
        .then(replaceClassTokens)
        .then(saveHeader)
        .then(saveClass)
    }
  }
};