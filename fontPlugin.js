'use strict';

exports.type = 'perItem';

exports.active = true;

exports.description = 'optimizes path data: writes in shorter form, applies transformations';

exports.params = {
    convertShapeToPath:true,
    applyTransforms: true,
    applyTransformsStroked: true,
    straightCurves: true,
    lineShorthands: true,
    curveSmoothShorthands: true,
    floatPrecision: 3,
    transformPrecision: 5,
    removeUseless: true,
    collapseRepeated: true,
    utilizeAbsolute: true,
    leadingZero: true,
    negativeExtraSpace: true
};

var pathElems = require('svgo/plugins/_collections.js').pathElems,
    viewBoxElems = ['svg', 'pattern'],
    path2js = require('svgo/plugins/_path.js').path2js,
    js2path = require('svgo/plugins/_path.js').js2path,
    relative2absolute = require('svgo/plugins/_path.js').relative2absolute,
    applyTransforms = require('svgo/plugins/_path.js').applyTransforms,
    cleanupOutData = require('svgo/lib/svgo/tools').cleanupOutData,
    precision,
    error,
    hasMarkerMid;

var convertShapeToPath = require('svgo/plugins/convertShapeToPath.js').fn;


var convertCircleToPath = function(item){
    if(item.isElem('circle')){
        var cx = 10*item.attr('cx').value;
        var cy = 10*item.attr('cy').value;
        var r = 10*item.attr('r').value;
        var pathData =
            'M' + cx + ' ' + cy +
            'm' + (-r) + ' 0' +
            'a' + r + ' ' + r + ' 0 1 0 ' + (r*2) + ' 0' +
            'a' + r + ' ' + r + ' 0 1 0 ' + (-r*2) + ' 0z';

        item.renameElem('path');
        item.removeAttr(['cx', 'cy', 'r']);
        item.addAttr({
            name: 'd',
            value: pathData,
            prefix: '',
            local: 'd'
        });
    }
    else if(item.isElem('ellipse')){
        var cx = 10*item.attr('cx').value;
        var cy = 10*item.attr('cy').value;
        var rx = 10*item.attr('rx').value;
        var ry = 10*item.attr('ry').value;
        var pathData =
            'M' + cx + ' ' + cy +
            'm' + (-rx) + ' 0' +
            'a' + rx + ' ' + ry + ' 0 1 0 ' + (rx*2) + ' 0' +
            'a' + rx + ' ' + ry + ' 0 1 0 ' + (-ry*2) + ' 0z';

        item.renameElem('path');
        item.removeAttr(['cx', 'cy', 'rx', 'ry']);
        item.addAttr({
            name: 'd',
            value: pathData,
            prefix: '',
            local: 'd'
        });
    }
};

exports.fn = function(item, params) {
    if (
        item.isElem('svg') &&
        item.hasAttr('width') &&
        item.hasAttr('height')
    ) {
        item.attrs.width.value = 10*item.attrs.width.value;
        item.attrs.height.value = 10*item.attrs.height.value;
    }
    
    if (
        item.isElem('circle') ||
        item.isElem('ellipse')
    ) {

        convertCircleToPath(item);
    }

    else if (item.isElem(pathElems) && item.hasAttr('d')) {

        precision = params.floatPrecision;
        error = precision !== false ? +Math.pow(.1, precision).toFixed(precision) : 1e-2;
        hasMarkerMid = item.hasAttr('marker-mid');

        var data = path2js(item);

        if (data.length) {

            data = relative2absolute(data);

            data.map(function(pathItem){
                if(pathItem.data){
                    pathItem.data = pathItem.data.map(function(dataValue){
                        return Math.round(10*parseFloat(dataValue)*100)/100;
                    });
                }
                return pathItem;
            });

            js2path(item, data, params);

        }

    }

};
