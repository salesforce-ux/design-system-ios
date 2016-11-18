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

  IOS_FONT_SIZE_TEMPLATE_NAME:'SLDSFontSzTemplate',
  IOS_FONT_SIZE_NAME:'SLDSFontSz',

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
          var sizeEnumName = 'SLDS'+utilString.camelCase(name);
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

var readFontSizeTemplateClass = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_FONT_SIZE_TEMPLATE_NAME+'.m');
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      if(!opts.fontSize.template){
        opts.fontSize.template = {};
      }
      opts.fontSize.template.classSrc = src;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};

var readFontSizeTemplateHeader = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.IOS_TEMPLATE_DIR,CONFIG.IOS_FONT_SIZE_TEMPLATE_NAME+'.h');
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      if(!opts.fontSize.template){
        opts.fontSize.template = {};
      }
      opts.fontSize.template.headerSrc = src;
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



var replaceFontSizeHeaderTokens = function(opts){

  var deferred = Q.defer();

  if(!opts.fontSize.template || !opts.fontSize.template.headerSrc){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.originHeader" not found'));
  }

  if(!opts.fontSizeEnum || !opts.fontSizes){
    return deferred.reject(new Error('replaceHeaderTokens: "opts.classNames" not found'));
  }

  opts.fontSize.headerSrc = opts.fontSize.template.headerSrc.replace(new RegExp(CONFIG.IOS_FONT_SIZE_TEMPLATE_NAME,"g"), CONFIG.IOS_FONT_SIZE_NAME)
    .replace('/*SLDS_FONT_ENUM_VALUES*/',opts.fontSizeEnum.join(',\n\t'));

  deferred.resolve(opts);
  return deferred.promise;
};

var replaceFontSizeClassTokens = function(opts){
  var deferred = Q.defer();

  if(!opts.fontSize.template || !opts.fontSize.template.classSrc){
    return deferred.reject(new Error('replaceClassTokens: "opts.originHeader" not found'));
  }

  if(!opts.fontSizeEnum || !opts.fontSizes){
    return deferred.reject(new Error('replaceClassTokens: "opts.classNames" not found'));
  }

  var fontSizeValues = opts.fontSizeEnum.map(function(name){
    var body = [];
    var size = opts.fontSizes[name];
    //body.push('\tcase '+name+':');
    //  body.push('\t\t\treturn '+size+';');

    body.push('\t\t\t@'+size+',')
    return body.join('\n');
  });

  var fontSizeCases = opts.fontSizeEnum.map(function(name){
    var body = [];
    //var size = opts.fontSizes[name];
    //body.push('\tcase '+name+':');
    //  body.push('\t\t\treturn '+size+';');

    body.push('\t\t\t@"'+name+'",')
    return body.join('\n');
  });

  opts.fontSize.classSrc = opts.fontSize.template.classSrc.replace(new RegExp(CONFIG.IOS_FONT_SIZE_TEMPLATE_NAME,"g"), CONFIG.IOS_FONT_SIZE_NAME)
    .replace('/*SLDS_FONT_SIZE_VALUES*/',fontSizeValues.join('\n'))
    .replace('/*SLDS_FONT_SIZE_CASES*/',fontSizeCases.join('\n'));
  deferred.resolve(opts);
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

  opts.font.headerSrc = opts.font.template.headerSrc.replace(new RegExp(CONFIG.IOS_FONT_TEMPLATE_NAME,"g"), CONFIG.IOS_FONT_NAME);
  //  .replace('/*FONT_FAMILY_ENUM_VALUES*/',opts.fontNameEnum.join(',\n\t'));

  //opts.fontSizeEnum = opts.fontSizeEnum.map(function(f) {
  //  return f.replace('SLDS', '').replace('Xx', 'XX')
  //})

  //opts.font.headerSrc = opts.font.template.headerSrc.replace(new RegExp(CONFIG.IOS_FONT_SIZE_TEMPLATE_NAME,"g"), CONFIG.IOS_FONT_SIZE_NAME)
  //  .replace('/*SLDS_FONT_ENUM_VALUES*/',opts.fontSizeEnum.join(',\n\t'));

  deferred.resolve(opts);
  return deferred.promise;
};

var replaceFontClassTokens = function(opts){

  var deferred = Q.defer();


  if(!opts.fontSize.template || !opts.fontSize.template.classSrc){
    return deferred.reject(new Error('replaceClassTokens: "opts.originHeader" not found'));
  }

  if(!opts.fontSizeEnum || !opts.fontSizes){
    return deferred.reject(new Error('replaceClassTokens: "opts.classNames" not found'));
  }

  // var regularFontSizeCases = opts.fontSizeEnum.map(function(name){
  //     var lines = [];
  //     lines.push('\t\tcase '+name+':{');
  //     lines.push('\t\t\tstatic dispatch_once_t predicate = 0;');
  //     lines.push('\t\t\tstatic UIFont* font;');
  //     lines.push('\t\t\tdispatch_once(&predicate, ^{');
  //     lines.push('\t\t\t\tfont = [UIFont fontWithName:bodyFontName size:[SLDSFontSz sldsFontSize:'+name+']];');
  //     lines.push('\t\t\t});');
  //     lines.push('\t\t\treturn font;');
  //     lines.push('\t\t}');
  //     return lines.join('\n');
  // });

  // var italicFontSizeCases = opts.fontSizeEnum.map(function(name){
  //     var lines = [];
  //     lines.push('\t\tcase '+name+':{');
  //     lines.push('\t\t\tstatic dispatch_once_t predicate = 0;');
  //     lines.push('\t\t\tstatic UIFont* font;');
  //     lines.push('\t\t\tdispatch_once(&predicate, ^{');
  //     lines.push('\t\t\t\tfont = [UIFont fontWithName:italicFontName size:[SLDSFontSz sldsFontSize:'+name+']];');
  //     lines.push('\t\t\t});');
  //     lines.push('\t\t\treturn font;');
  //     lines.push('\t\t}');
  //     return lines.join('\n');
  // });

  // var strongFontSizeCases = opts.fontSizeEnum.map(function(name){
  //     var lines = [];
  //     lines.push('\t\tcase '+name+':{');
  //     lines.push('\t\t\tstatic dispatch_once_t predicate = 0;');
  //     lines.push('\t\t\tstatic UIFont* font;');
  //     lines.push('\t\t\tdispatch_once(&predicate, ^{');
  //     lines.push('\t\t\t\tfont = [UIFont fontWithName:strongFontName size:[SLDSFontSz sldsFontSize:'+name+']];');
  //     lines.push('\t\t\t});');
  //     lines.push('\t\t\treturn font;');
  //     lines.push('\t\t}');
  //     return lines.join('\n');
  // });

  // var lightFontSizeCases = opts.fontSizeEnum.map(function(name){
  //     var lines = [];
  //     lines.push('\t\tcase '+name+':{');
  //     lines.push('\t\t\tstatic dispatch_once_t predicate = 0;');
  //     lines.push('\t\t\tstatic UIFont* font;');
  //     lines.push('\t\t\tdispatch_once(&predicate, ^{');
  //     lines.push('\t\t\t\tfont = [UIFont fontWithName:lightFontName size:[SLDSFontSz sldsFontSize:'+name+']];');
  //     lines.push('\t\t\t});');
  //     lines.push('\t\t\treturn font;');
  //     lines.push('\t\t}');
  //     return lines.join('\n');
  // });

  // var thinFontSizeCases = opts.fontSizeEnum.map(function(name){
  //     var lines = [];
  //     lines.push('\t\tcase '+name+':{');
  //     lines.push('\t\t\tstatic dispatch_once_t predicate = 0;');
  //     lines.push('\t\t\tstatic UIFont* font;');
  //     lines.push('\t\t\tdispatch_once(&predicate, ^{');
  //     lines.push('\t\t\t\tfont = [UIFont fontWithName:thinFontName size:[SLDSFontSz sldsFontSize:'+name+']];');
  //     lines.push('\t\t\t});');
  //     lines.push('\t\t\treturn font;');
  //     lines.push('\t\t}');
  //     return lines.join('\n');
  // });

  opts.font.classSrc = opts.font.template.classSrc.replace(new RegExp(CONFIG.IOS_FONT_TEMPLATE_NAME,"g"), CONFIG.IOS_FONT_NAME);
    // .replace('/*FONT_REGULAR_SIZES*/',regularFontSizeCases.join('\n'))
    // .replace('/*FONT_ITALIC_SIZES*/',italicFontSizeCases.join('\n'))
    // .replace('/*FONT_STRONG_SIZES*/',strongFontSizeCases.join('\n'))
    // .replace('/*FONT_LIGHT_SIZES*/',lightFontSizeCases.join('\n'))
    // .replace('/*FONT_THIN_SIZES*/',thinFontSizeCases.join('\n'));
  deferred.resolve(opts);
  return deferred.promise;
};

var saveFontSizeHeader = function(opts){
  var deferred = Q.defer();
  if(!opts.fontSize.headerSrc){
    return deferred.reject(new Error('saveHeader: "opts.header" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.IOS_FONT_SIZE_NAME+'.h');
  fs.outputFile(fileName, opts.fontSize.headerSrc, function(err){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

var saveFontSizeClass = function(opts){
  var deferred = Q.defer();
  if(!opts.fontSize.classSrc){
    return deferred.reject(new Error('saveClass: "opts.header" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.IOS_FONT_SIZE_NAME+'.m');
  fs.outputFile(fileName, opts.fontSize.classSrc, function(err){
    return deferred.resolve(opts);
  });
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


var createFontSizes = function(opts){
  return readFontSizeTemplateClass(opts)
    .then(readFontSizeTemplateHeader)
    .then(replaceFontSizeHeaderTokens)
    .then(replaceFontSizeClassTokens)
    .then(saveFontSizeHeader)
    .then(saveFontSizeClass);
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
        .then(createFontSizes)
        .then(createFonts)
    }
  }
};