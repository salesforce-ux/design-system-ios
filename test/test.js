// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

const assert 	= require('assert');
const fs			= require('fs');
const _ 			= require('lodash');

const format = (s) => {
	return s[0].toUpperCase() + _.camelCase(s.substring(1))
};

const stripIconNames = (i) => {
	return i.filter(n => {
		return n.indexOf('.svg') !== -1;
	}).map(n => {
		return format(n.replace('.svg',''));
	})
};

let colorOutput = fs.readFileSync('./SalesforceDesignSystem/generated/SLDSColor.h').toString();
let sizeOutput = fs.readFileSync('./SalesforceDesignSystem/generated/SLDSSize.h').toString();
let iconOutput = fs.readFileSync('./SalesforceDesignSystem/generated/SLDSIcon.h').toString();
let fontOutput = fs.readFileSync('./SalesforceDesignSystem/generated/SLDSFont.h').toString();

let designTokensFile = fs.readFileSync('./node_modules/@salesforce-ux/design-system/design-tokens/dist/force-base.ios.json');
let designTokens = JSON.parse(designTokensFile.toString('utf-8')).properties;

let actionIcons = stripIconNames(fs.readdirSync('./node_modules/@salesforce-ux/design-system/assets/icons/action'));
let customIcons = stripIconNames(fs.readdirSync('./node_modules/@salesforce-ux/design-system/assets/icons/custom'));
let standardIcons = stripIconNames(fs.readdirSync('./node_modules/@salesforce-ux/design-system/assets/icons/standard'));
let utilityIcons = stripIconNames(fs.readdirSync('./node_modules/@salesforce-ux/design-system/assets/icons/utility'));

let colorTokens = designTokens.filter(t => {
	return t.type === 'color';
});

let sizeTokens = designTokens.filter(t => {
	return t.type === 'size';
});

let fontSizeTokens = designTokens.filter(t => {
	return t.type === 'font-size';
});

describe('Color Tokens', () => {
	colorTokens.forEach(token => {
	  describe(token.name, () => {
	    it('should exist in Obj-C output (SLDSColor.h)', () => {
	    	assert(colorOutput.indexOf(token.name.charAt(0).toUpperCase() + token.name.slice(1)) !== -1)
	    });
	  });
	});
});

describe('Size Tokens', () => {
	sizeTokens.forEach(token => {
	  describe(token.name, () => {
	    it('should exist in Obj-C output (SLDSSize.h)', () => {
	    	assert(sizeOutput.indexOf(token.name.charAt(0).toUpperCase() + token.name.slice(1)) !== -1)
	    });
	  });
	});
});

describe('Font Size Tokens', () => {
	fontSizeTokens.forEach(token => {
	  describe(token.name, () => {
	    it('should exist in Obj-C output (SLDSSize.h)', () => {
	    	assert(fontOutput.indexOf(token.name.charAt(0).toUpperCase() + token.name.slice(1)) !== -1)
	    });
	  });
	});
});

describe('Action Icons', () => {
	actionIcons.forEach(icon => {
	  describe(icon, () => {
	    it('should exist in Obj-C output (SLDSIcon.h)', () => {
	    	assert(iconOutput.indexOf(icon) !== -1)
	    });
	  });
	});
});

describe('Custom Icons', () => {
	customIcons.forEach(icon => {
	  describe(icon, () => {
	    it('should exist in Obj-C output (SLDSIcon.h)', () => {
	    	assert(iconOutput.indexOf(icon) !== -1)
	    });
	  });
	});
});

describe('Standard Icons', () => {
	standardIcons.forEach(icon => {
	  describe(icon, () => {
	    it('should exist in Obj-C output (SLDSIcon.h)', () => {
	    	assert(iconOutput.indexOf(icon) !== -1)
	    });
	  });
	});
});

describe('Utility Icons', () => {
	utilityIcons.forEach(icon => {
	  describe(icon, () => {
	    it('should exist in Obj-C output (SLDSIcon.h)', () => {
	    	assert(iconOutput.indexOf(icon) !== -1)
	    });
	  });
	});
});