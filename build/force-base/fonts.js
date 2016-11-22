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
var Q = require('q');
var utilString = require('../util/string');

var GLOBAL_CONFIG;
var CONFIG = {

  IOS_FONT_TEMPLATE_NAME:'SLDSFontTemplate',
  IOS_FONT_NAME:'SLDSFont',

  FONTS_FILE_NAME:'font.json'
};

var readFonts = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.FORCE_BASE_TOKENS_DIR,CONFIG.FONTS_FILE_NAME);

  if(!opts.fontSize){
    opts.fontSize = {};
  }

  if(!opts.fontFamily){
    opts.fontFamily = {};
  }

  if(!opts.font){
    opts.font = {};
  }

  var fontSizes = {};
  var fontSizeEnum = [];
  var fontNames = {};
  var fontNameEnum = [];

  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      
      var fonts = JSON.parse(src).props;
      Object.keys(fonts).map(function(name){
        var font = fonts[name];
        
        if(font.type === 'size'){
          var size = parseFloat(font.value.replace('rem',''))*16;
          var sizeEnumName = 'SLDS'+utilString.camelCase(name).replace('Xx','XX');
          fontSizes[sizeEnumName] = size;
          fontSizeEnum.push(sizeEnumName);
        }
        else if(font.type === 'font' && font.deprecated){
          var fontName = font.value.split(',')[0].replace(/'/g,'');
          fontNames['SLDS_'+name] = fontName;
          fontNameEnum.push('SLDS_'+name);
        }
      });

      opts.fontSizes = fontSizes;
      opts.fontSizeEnum = fontSizeEnum;

      opts.fontNames = fontNames;
      opts.fontNameEnum = fontNameEnum;

      deferred.resolve(opts);
    }
  });

  return deferred.promise;
};

var readFontTemplateClass = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_FONT_TEMPLATE_NAME+'.m');
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      if(!opts.font.template){
        opts.font.template = {};
      }
      opts.font.template.classSrc = src;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};

var readFontTemplateHeader = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_FONT_TEMPLATE_NAME+'.h');
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      if(!opts.font.template){
        opts.font.template = {};
      }
      opts.font.template.headerSrc = src;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};

var replaceFontHeaderTokens = function(opts){

  var deferred = Q.defer();

  if(!opts.font.template || !opts.font.template.headerSrc){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.originHeader" not found'));
  }

  if(!opts.fontSizeEnum || !opts.fontSizes){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.classNames" not found'));
  }

  opts.font.headerSrc = opts.font.template.headerSrc.replace(new RegExp(CONFIG.IOS_FONT_TEMPLATE_NAME,"g"), CONFIG.IOS_FONT_NAME)
    .replace('/*SLDS_FONT_ENUM_VALUES*/',opts.fontSizeEnum.join(',\n\t'));

  deferred.resolve(opts);
  return deferred.promise;
};

var replaceFontClassTokens = function(opts){

  var deferred = Q.defer();

  if(!opts.font.template || !opts.font.template.headerSrc){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.originHeader" not found'));
  }

  if(!opts.fontSizeEnum || !opts.fontSizes){
    return deferred.reject(new Error('replaceClassTokens: "opts.classNames" not found'));
  }

  var fontSizeValues = opts.fontSizeEnum.map(function(name){
    var body = [];
    var size = opts.fontSizes[name];
    
    body.push('\t\t\t\t\t@'+size+',')
    return body.join('\n');
  });

  var fontSizeCases = opts.fontSizeEnum.map(function(name){
    var body = [];
    
    body.push('\t\t\t\t\t@"'+name+'",')
    return body.join('\n');
  });

  opts.font.classSrc = opts.font.template.classSrc.replace(new RegExp(CONFIG.IOS_FONT_TEMPLATE_NAME,"g"), CONFIG.IOS_FONT_NAME)
  .replace('/*SLDS_FONT_SIZE_VALUES*/',fontSizeValues.join('\n'))
  .replace('/*SLDS_FONT_SIZE_CASES*/',fontSizeCases.join('\n'));

   deferred.resolve(opts);
  return deferred.promise;
};

var saveFontHeader = function(opts){
  var deferred = Q.defer();
  if(!opts.font.headerSrc){
    return deferred.reject(new Error('saveHeader: "opts.header" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.IOS_FONT_NAME+'.h');
  fs.outputFile(fileName, opts.font.headerSrc, function(err){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

var saveFontClass = function(opts){
  var deferred = Q.defer();
  if(!opts.font.classSrc){
    return deferred.reject(new Error('saveClass: "opts.header" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.IOS_FONT_NAME+'.m');
  fs.outputFile(fileName, opts.font.classSrc, function(err){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

var createFonts = function(opts){
  return readFontTemplateClass(opts)
    .then(readFontTemplateHeader)
    .then(replaceFontHeaderTokens)
    .then(replaceFontClassTokens)
    .then(saveFontHeader)
    .then(saveFontClass);
};

module.exports = function(config){
  GLOBAL_CONFIG = config;
  return {
    run: function(opts){
      return readFonts({tempDir:opts.tempDir})
        .then(createFonts)
    }
  }
};