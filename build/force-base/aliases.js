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

var GLOBAL_CONFIG;
var CONFIG = {
  IOS_COLOR_FACTORY_TEMPLATE_NAME:'SLDSColorAliasTemplate',
  IOS_COLOR_FACTORY_NAME:'SLDSColorAlias',
  COLORS_FILE_NAME:'aliases.json'
};


var readColorAliases = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.FORCE_BASE_TOKENS_DIR,CONFIG.COLORS_FILE_NAME);

  var colors = {};
  var colorEnum = [];
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      var colors = JSON.parse(src).aliases;
      Object.keys(colors).map(function(name){
        var value = colors[name];
        var rgb = {};
        if(value.indexOf('#')===0){
          rgb = colorUtil.hexToRgb(value)
        }
        else if(value.indexOf('hsl(')===0){
          var splits = value.replace('hsl(','').replace(')','').split(',');
          var h = parseFloat(splits[0])/255;
          var s = parseFloat(splits[1].replace('%',''))/100;
          var l = parseFloat(splits[2].replace('%',''))/100;
          rgb = colorUtil.hslToRgb(h,s,l);
        }
        else if(value.indexOf('rgba(')===0){
          var splits = value.replace('rgba(','').replace(')','').split(',');
          var r = parseFloat(splits[0]);
          var g = parseFloat(splits[1]);
          var b = parseFloat(splits[2]);

          var alpha = parseFloat(splits[3]);
          if(alpha>1){
            alpha = alpha/100;
          }
          rgb = {r:r,g:g,b:b,a:alpha};
        }
        else if(value.indexOf('rgb(')===0){
          var splits = value.replace('rgb(','').replace(')','').split(',');
          var r = parseFloat(splits[0]);
          var g = parseFloat(splits[1]);
          var b = parseFloat(splits[2]);

          rgb = {r:r,g:g,b:b,a:1};
        }
        else if(value==='transparent'){
          rgb = {r:0,g:0,b:0,a:0};
        }
        else{
          console.log('!!! FORMAT ALIAS: ',value);
        }
        colors['SFDS_ALIAS_'+name] = rgb;
        colorEnum.push('SFDS_ALIAS_'+name);
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
    .replace('SFDS_ALIAS_NOTFOUND,','')
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
    var rgb = opts.colors[name];
    body.push('\tcase '+name+':{');
    body.push('\t\t\tstatic UIColor *color = nil;');
    body.push('\t\t\tstatic dispatch_once_t predicate = 0;');
    body.push('\t\t\tdispatch_once(&predicate, ^{');
    body.push('\t\t\tcolor = [UIColor colorWithRed:'+(Math.round(1000*rgb.r/255)/1000)+' green:'+(Math.round(1000*rgb.g/255)/1000)+' blue:'+(Math.round(1000*rgb.b/255)/1000)+' alpha:'+(rgb.a?rgb.a:1)+'];');
    body.push('\t\t\t});');
    body.push('\t\t\treturn color;');
    body.push('\t\t\t}');
    return body.join('\n');
  });

  var aliasColors = opts.colorEnum.map(function(name){
    var body = [];
    var rgb = opts.colors[name];
    if(rgb){
      return '[UIColor colorWithRed:'+(Math.round(1000*rgb.r/255)/1000)+' green:'+(Math.round(1000*rgb.g/255)/1000)+' blue:'+(Math.round(1000*rgb.b/255)/1000)+' alpha:'+(rgb.a?rgb.a:1)+']';
    }
    return 'nil';
  });

  opts.classSrc = opts.template.classSrc.replace(new RegExp(CONFIG.IOS_COLOR_FACTORY_TEMPLATE_NAME,"g"), CONFIG.IOS_COLOR_FACTORY_NAME)
    .replace('/*COLOR_ENUM_STRING_VALUES*/',enumItemNames.join(',\\\n'))
    .replace('/*ALIAS_COLORS*/',aliasColors.join(',\n'));
//    .replace('/*COLOR_CASES*/',colorCases.join('\n'));
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
      return readColorAliases({tempDir:opts.tempDir})
        .then(readTemplateClass)
        .then(readTemplateHeader)
        .then(replaceHeaderTokens)
        .then(replaceClassTokens)
        .then(saveHeader)
        .then(saveClass)
    }
  }
};