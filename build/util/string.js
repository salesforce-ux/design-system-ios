/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
var capitalize = function (string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

var camelCase = function(string) {
  var result = [];
  var nameParts = string.replace(/-/g,'_').split('_');
  nameParts.forEach(function(namePart){
    result.push(capitalize(namePart.toLowerCase()));
  });
  return result.join('');
}

var toEnumFormat = function(str){
  var result = [];
  return str.replace(/-/g,"_").split('').map(function(ch,index){
    var upper = ch.toUpperCase();
    if(index>1&&isNaN(ch)&&ch === upper&&ch !== '_'){
      upper = '_'+upper;
    }
    return upper;
  }).join('');
};

var normalizeMixedDataValue = function ( value ) {

  var padding = "000000000000000";
  value = value.replace(
    /(\d+)((\.\d+)+)?/g,
    function( $0, integer, decimal, $3 ) {
      if ( decimal !== $3 ) {
        return(
          padding.slice( integer.length ) +
          integer +
          decimal
        );
      }

      decimal = ( decimal || ".0" );

      return(
        padding.slice( integer.length ) +
        integer +
        decimal +
        padding.slice( decimal.length )
      );
    }
  );

  return( value );
};

module.exports = {
  capitalize:capitalize,
  camelCase:camelCase,
  toEnumFormat:toEnumFormat,
  normalizeMixedDataValue:normalizeMixedDataValue
};