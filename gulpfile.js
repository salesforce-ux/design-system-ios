/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

var gulp = require('gulp');
var iconfont = require('gulp-iconfont');
var svgmin = require('gulp-svgmin');
var consolidate = require('gulp-consolidate');
var fontplugin = require('./build/icon-fonts/fontplugin');
var clean = require('gulp-clean');
var gulpFilter = require('gulp-filter');


gulp.task('makeIconFontUtility', function () {
    var ttfFilter = gulpFilter('**/*.ttf');
    return gulp.src(['git_modules/icons/dist/salesforce_landmark_icons/utility/*.svg'])
        .pipe(svgmin({
            plugins: [
            {
              removeViewBox:true,
              convertShapeToPath:true
            },
            {
              fontplugin:fontplugin
            },
            {
              transformsWithOnePath:{
              }
            },
            {
              cleanupNumericValues: {
                  floatPrecision: 3
              }
            }
          ]
        }))
    .pipe(iconfont({
      fontName: 'SalesforceDesignSystemIconsUtility',
    }))
    .on('glyphs', function(glyphs, options) {
      gulp.src('./build/icon-fonts/templates/SalesforceDesignSystemIconsUtility.css')
        .pipe(consolidate('lodash', {
          glyphs: glyphs,
          fontName: 'SalesforceDesignSystemIconsUtility',
          fontPath: '',
          className: 's'
        }))
        .pipe(gulp.dest('_dist_css/'));

    })
    .pipe(ttfFilter)
    .pipe(gulp.dest('SalesforceDesignSystem.bundle/'));
});

gulp.task('makeIconFontAction', function () {
    var ttfFilter = gulpFilter('**/*.ttf');
    return gulp.src(['git_modules/icons/dist/salesforce_landmark_icons/action/*.svg'])
        .pipe(svgmin({
            plugins: [
            {
              removeViewBox:true,
              convertShapeToPath:true
            },
            {
              fontplugin:fontplugin
            },
            {
              transformsWithOnePath:{
              }
            },
            {
              cleanupNumericValues: {
                  floatPrecision: 3
              }
            }
          ]
        }))
    .pipe(iconfont({
      fontName: 'SalesforceDesignSystemIconsAction', 
    }))
    .on('glyphs', function(glyphs, options) {
      gulp.src('./build/icon-fonts/templates/SalesforceDesignSystemIconsAction.css')
        .pipe(consolidate('lodash', {
          glyphs: glyphs,
          fontName: 'SalesforceDesignSystemIconsAction',
          fontPath: '',
          className: 's'
        }))
        .pipe(gulp.dest('_dist_css/'));

    })
    .pipe(ttfFilter)
    .pipe(gulp.dest('SalesforceDesignSystem.bundle/'));
});

gulp.task('makeIconFontCustom', function () {
    var ttfFilter = gulpFilter('**/*.ttf');
    return gulp.src(['git_modules/icons/dist/salesforce_landmark_icons/custom/*.svg'])
        .pipe(svgmin({
            plugins: [
            {
              removeViewBox:true,
              convertShapeToPath:true
            },
            {
              fontplugin:fontplugin
            },
            {
              transformsWithOnePath:{
              }
            },
            {
              cleanupNumericValues: {
                  floatPrecision: 3
              }
            }
          ]
        }))
    .pipe(iconfont({
      fontName: 'SalesforceDesignSystemIconsCustom', 
    }))
    .on('glyphs', function(glyphs, options) {
      gulp.src('./build/icon-fonts/templates/SalesforceDesignSystemIconsCustom.css')
        .pipe(consolidate('lodash', {
          glyphs: glyphs,
          fontName: 'SalesforceDesignSystemIconsCustom',
          fontPath: '',
          className: 's'
        }))
        .pipe(gulp.dest('_dist_css/'));

    })
    .pipe(ttfFilter)
    .pipe(gulp.dest('SalesforceDesignSystem.bundle/'));
});

gulp.task('makeIconFontStandard', function () {
    var ttfFilter = gulpFilter('**/*.ttf');
    return gulp.src(['git_modules/icons/dist/salesforce_landmark_icons/standard/*.svg'])
        .pipe(svgmin({
            plugins: [
            {
              removeViewBox:true,
              convertShapeToPath:true
            },
            {
              fontplugin:fontplugin
            },
            {
              transformsWithOnePath:{
              }
            },
            {
              cleanupNumericValues: {
                  floatPrecision: 3
              }
            }
          ]
        }))
    .pipe(iconfont({
      fontName: 'SalesforceDesignSystemIconsStandard', 
    }))
    .on('glyphs', function(glyphs, options) {
      gulp.src('./build/icon-fonts/templates/SalesforceDesignSystemIconsStandard.css')
        .pipe(consolidate('lodash', {
          glyphs: glyphs,
          fontName: 'SalesforceDesignSystemIconsStandard',
          fontPath: '',
          className: 's'
        }))
        .pipe(gulp.dest('_dist_css/'));

    })
    .pipe(ttfFilter)
    .pipe(gulp.dest('SalesforceDesignSystem.bundle/'));
});

gulp.task('default', ['makeIconFontUtility','makeIconFontAction','makeIconFontCustom','makeIconFontStandard']);

