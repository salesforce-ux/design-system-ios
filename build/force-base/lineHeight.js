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
  OUTPUT_NAME:'SLDSLineHeight',
  LINE_HEIGHT_FILE_NAME:'font.json'
};


var readTokens = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.FORCE_BASE_TOKENS_DIR,CONFIG.LINE_HEIGHT_FILE_NAME);
  var lineHeights = {};
  var lineHeightEnum = [];
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      var tokens = JSON.parse(src).props;
      Object.keys(tokens).map(function(name){
        var token = tokens[name];
        if(token && token.category && token.category === 'line-height' && token.value){
          var tokenName = name;
          var tokenValue = 0;
          if(token.value.indexOf('rem')>0){
            tokenValue = Math.round(14*parseFloat(token.value.replace('rem','')));
          }
          else{
            tokenName += '_MULTIPLE';
            tokenValue = token.value;
          }
          var enamName = 'SLDS'+utilString.camelCase(tokenName);
          lineHeights[enamName] = tokenValue;
          lineHeightEnum.push(enamName);
        }
      });

      opts.lineHeights = lineHeights;
      opts.lineHeightEnum = lineHeightEnum;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};


var saveHeader = function(opts){
  var deferred = Q.defer();
  if(!opts.lineHeightEnum){
    return deferred.reject(new Error('saveHeader: "opts.lineHeightEnum" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.OUTPUT_NAME+'.h');

  var lines = opts.lineHeightEnum.map(function(enumName){
    return 'static const float ' + enumName + ' = ' +opts.lineHeights[enumName];
  });
  var src = lines.join(';\n')+';';
  fs.outputFile(fileName, src, function(err){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

module.exports = function(config){
  GLOBAL_CONFIG = config;
  return {
    run: function(opts){
      return readTokens({tempDir:opts.tempDir})
        .then(saveHeader);
    }
  }
};