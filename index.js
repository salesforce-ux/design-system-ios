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

var CONFIG = {
  DESIGN_TOKENS_DIR:path.join(__dirname,'git_modules','design-tokens','tokens'),
  FORCE_BASE_TOKENS_DIR:path.join(__dirname,'git_modules','design-tokens','tokens','force-base'),
  OUTPUT_DIR:path.join(__dirname,'SalesforceDesignSystem','Generated'),
  IOS_TEMPLATE_DIR:path.join(__dirname,'SalesforceDesignSystem','Templates'),
  FONT_FILE_NAME:'SalesforceDesignSystemIconsUtility.ttf',
  BUNDLE_FOLDER:path.join(__dirname,'SalesforceDesignSystemResources'),
  DIST_CSS:path.join(__dirname,'_dist_css')

};

var forceBaseAliases = require('./build/force-base/aliases')(CONFIG);
var forceBaseBackgrounds = require('./build/force-base/background')(CONFIG);
var forceBaseText = require('./build/force-base/text')(CONFIG);
var forceBaseBorder = require('./build/force-base/border')(CONFIG);
var forceBaseButton = require('./build/force-base/button')(CONFIG);
var forceBaseInput = require('./build/force-base/input')(CONFIG);
var forceBaseMessaging = require('./build/force-base/messaging')(CONFIG);

var forceBaseSpacing = require('./build/force-base/spacing')(CONFIG);
var forceBaseSizing = require('./build/force-base/sizing')(CONFIG);
var forceBaseLineHeight = require('./build/force-base/lineHeight')(CONFIG);


var fonts = require('./build/force-base/fonts')(CONFIG);

var iconsUtility = require('./build/icons/icons-utility')(CONFIG);
var iconsAction = require('./build/icons/icons-actions')(CONFIG);
var iconsCustom = require('./build/icons/icons-custom')(CONFIG);
var iconsStandard = require('./build/icons/icons-standard')(CONFIG);

var iconsLabelsUtility = require('./build/icons/icons-labels-utility')(CONFIG);
var iconsLabelsAction = require('./build/icons/icons-labels-actions')(CONFIG);
var iconsLabelsCustom = require('./build/icons/icons-labels-custom')(CONFIG);
var iconsLabelsStandard = require('./build/icons/icons-labels-standard')(CONFIG);


var cleanup = function(opts){
  var deferred = Q.defer();
  fs.remove(CONFIG.OUTPUT_DIR,function(){
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

var createTempDir = function(opts){
  var deferred = Q.defer();
  temp.mkdir('landmark', function(err, tempDir) {
    opts.tempDir = tempDir;
    return deferred.resolve(opts);
  });
  return deferred.promise;
};

var copyGeneratedFiles = function(opts){
  var deferred = Q.defer();
  fs.move(opts.tempDir, CONFIG.OUTPUT_DIR, function (err) {
    return deferred.resolve(opts);
  });
  return deferred.promise;
};


cleanup({})
  .then(createTempDir)

  .then(forceBaseAliases.run)
  .then(forceBaseBackgrounds.run)
  .then(forceBaseText.run)
  .then(forceBaseBorder.run)
  .then(forceBaseButton.run)
  .then(forceBaseInput.run)
  .then(forceBaseMessaging.run)
  .then(forceBaseSpacing.run)
  .then(forceBaseSizing.run)
  .then(forceBaseLineHeight.run)

  //ICONS BUILD
  .then(iconsUtility.run)
  .then(iconsLabelsUtility.run)
  .then(iconsAction.run)
  .then(iconsLabelsAction.run)
  .then(iconsCustom.run)
  .then(iconsLabelsCustom.run)
  .then(iconsStandard.run)
  .then(iconsLabelsStandard.run)

  .then(fonts.run)

  .then(copyGeneratedFiles)
  .then(function(opts){
    console.log('#### @@@@@ ####');
  });