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
  OUTPUT_NAME:'SLDSSpacing',
  SPACING_FILE_NAME:'spacing.json'
};


var readTokens = function(opts){
  var deferred = Q.defer();
  var fileName = path.join(GLOBAL_CONFIG.FORCE_BASE_TOKENS_DIR,CONFIG.SPACING_FILE_NAME);
  var spacings = {};
  var spacingEnum = [];
  fs.readFile(fileName, "utf-8", function (error, src) {
    if (error) {
        deferred.reject(new Error(error));
    } else {
      var tokens = JSON.parse(src).props;
      Object.keys(tokens).map(function(name){
        var token = tokens[name];
        if(token && token.value){
          var value = Math.round(16*parseFloat(token.value.replace('rem','')));
          var enamName = 'SLDS'+utilString.camelCase(name);
          spacings[enamName] = value;
          spacingEnum.push(enamName);
        }
      });

      opts.spacings = spacings;
      opts.spacingEnum = spacingEnum;
      deferred.resolve(opts);
    }
  });
  return deferred.promise;
};


var saveHeader = function(opts){
  var deferred = Q.defer();
  if(!opts.spacingEnum){
    return deferred.reject(new Error('saveHeader: "opts.spacingEnum" not found'));
  }
  var fileName = path.join(opts.tempDir,CONFIG.OUTPUT_NAME+'.h');

  var lines = opts.spacingEnum.map(function(enumName){
    return 'static const int ' + enumName + ' = ' +opts.spacings[enumName];
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
