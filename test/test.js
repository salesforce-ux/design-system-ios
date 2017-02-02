const assert 	= require('assert');
const fs			= require('fs');
const _ 			= require('lodash');

let colorOutput = fs.readFileSync('./SalesforceDesignSystem/generated/SLDSColor.h').toString();
let designTokensFile = (fs.readFileSync('./node_modules/@salesforce-ux/design-system/design-tokens/dist/force-base.ios.json'));

let designTokens = JSON.parse(designTokensFile.toString('utf-8')).properties;

let colorTokens = designTokens.filter(t => {
	return t.type === 'color';
});

let sizeTokens = designTokens.filter(t => {
	return t.type === 'size';
});

describe('Color Tokens', () => {
	colorTokens.forEach(token => {
	  describe(token.name, () => {
	    it('should exist in Obj-C output (SLDSColor.h)', () => {
	    	assert(colorOutput.indexOf(token.name.charAt(0).toUpperCase()) !== -1)
	    });
	  });
	});
});