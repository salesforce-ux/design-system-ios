const gulp 				= require('gulp');
const gutil 			= require('gulp-util');
const jsonFormat 	= require('gulp-json-format');
const through 		= require('through2');
const path 				= require('path');
const nunjucks 		= require('gulp-nunjucks');
const fs 					= require('fs');
const merge2			= require('merge2');
const rename			= require('gulp-rename');
const runSequence = require('run-sequence');
const iconFont 		= require('gulp-iconfont');
const svgMin 			= require('gulp-svgmin');
const fontPlugin 	= require('./fontPlugin.js');
const gulpFilter 	= require('gulp-filter');
const gulpData		= require('gulp-data');
const consolidate = require('gulp-consolidate');
const _ 					= require('lodash');

const __PATHS__ = {
	templates: path.join(__dirname,'templates'),
  designTokens: path.join(__dirname,'node_modules','@salesforce-ux','design-system','design-tokens','dist','force-base.ios.json'),
  iconTokens: path.join(__dirname,'node_modules','@salesforce-ux','design-system','design-tokens','dist'),
  icons: path.join(__dirname,'node_modules','@salesforce-ux','design-system','assets','icons'),
  output: path.join(__dirname, 'SalesforceDesignSystem','generated')
};

let data = {};

let types = [
	'color',
	'size',
	'font-size'
]

let iconTypes = [
	{
		'name': 'action',
		'tokenFilename': 'bg-actions.ios.json'
	}, {
		'name': 'standard',
		'tokenFilename': 'bg-standard.ios.json'
	}, {
		'name': 'custom',
		'tokenFilename': 'bg-custom.ios.json'
	}, {
		'name': 'utility'
	}
]

const parseColor = (c) => {
	let splits = c.replace('rgba(','').replace('rgb(','').replace(')','').split(',');
  let r = parseFloat(splits[0]/1000);
  let g = parseFloat(splits[1]/1000);
  let b = parseFloat(splits[2]/1000);

  if(!splits[3]) splits.push(1)
  let a = parseFloat(splits[3]);
  if(a>1) a = a/100;

  return {r:r,g:g,b:b,a:a};
}

const format = (s) => {
	return s[0].toUpperCase() + _.camelCase(s.substring(1))
}

const parseDesignTokens = () => {
	return through.obj((file, enc, next) => {
		let tokens = JSON.parse(file.contents.toString('utf-8'));

		types.forEach(t => {
			data[format(t)] = {};
		});

		tokens.properties.forEach(p => {
			if (types.indexOf(p.type) !== -1) {
				let t = format(p.type)
				if (!data[t].hasOwnProperty(format(p.category))) data[t][format(p.category)] = []
				data[t][format(p.category)].push({
					'name' : format(p.name),
					'value' : p.type === 'color' ? parseColor(p.value) : p.value
				})
			}
		});
    next(null, file);
	});
}

gulp.task('template:design-tokens', () => {
	let streams = [];
	for (let type in data) {
		if (data.hasOwnProperty(type)) {
			let updatedType = type === 'FontSize' ? 'Font' : type

			streams.push(
				gulp.src('templates/' + updatedType + '/UI' + updatedType + '.h.njk')
					.pipe(nunjucks.compile({ 'data': data[type] }))
					.pipe(rename('Extensions/UI' + updatedType + '+SLDS' + updatedType + '.h'))
			);

			streams.push(
				gulp.src('templates/' + updatedType + '/UI' + updatedType + '.m.njk')
					.pipe(nunjucks.compile({ 'data': data[type] }))
					.pipe(rename('Extensions/UI' + updatedType + '+SLDS' + updatedType + '.m'))
			);

			streams.push(
				gulp.src('templates/' + updatedType + '/SLDS' + updatedType + '.m.njk')
					.pipe(nunjucks.compile({ 'data': data[type] }))
					.pipe(rename('SLDS' + updatedType + '.m'))
			);

			streams.push(
				gulp.src('templates/' + updatedType + '/SLDS' + updatedType + '.h.njk')
					.pipe(nunjucks.compile({ 'data': data[type] }))
					.pipe(rename('SLDS' + updatedType + '.h'))
			);
		}
	}

	return merge2(streams).pipe(gulp.dest(__PATHS__.output))
});

// Icons
// ------------------------------------------------------------------------------------------------

let icons = {};

gulp.task('create:icon-fonts', () => {
	const ttfFilter = gulpFilter('**/*.ttf');
	let iconPaths = []

	iconTypes.forEach(t => {
		fs.readdirSync(path.resolve(__PATHS__.icons + '/'+ t.name)).filter(p => {
			return p.indexOf('.svg') !== -1
		}).forEach(p => {
			iconPaths.push(__PATHS__.icons + '/' + t.name + '/' + p)
		})
	})

	// add unique id to filename to avoid duplicate glyphs
	let id = 1;
	gulp.src(iconPaths)
		.pipe(rename((path) => {
	    path.basename += '-' + id;
	    id++;
	  }))
   	.pipe(iconFont({
  		fontName: 'SalesforceDesignSystemIcons',
  		normalize:true
    }))
    .pipe(ttfFilter)
		.pipe(gulp.dest('SalesforceDesignSystem.bundle/'))
});

const parseIcons = () => {
	return through.obj((file, enc, next) => {
		let unicode = 59905;
		iconTypes.forEach(iconType => {
			icons[iconType.name] = [];

			let iconNames = (fs.readdirSync(path.resolve(__PATHS__.icons + '/' + iconType.name))).filter(n => {
				return n.indexOf('.svg') !== -1;
			}).map(i => {
				return iconType.name === 'action' ? 'action' + format(i.replace('.svg','')) : format(i.replace('.svg','')).charAt(0).toLowerCase() + format(i.replace('.svg','')).slice(1);
			});

			let tokens = JSON.parse(file.contents.toString('utf-8'));
			iconNames.forEach(n => {
				let backgroundColor = iconType.name === 'utility' ? 'null' : parseColor(_.find(tokens[iconType.name].properties, { 'name': n }).value)
				icons[iconType.name].push({
					"name" : (iconType.name === 'action' || iconType.name === 'custom') ?  'SLDS' + format(n) : 'SLDS' + format(iconType.name) + format(n) ,
					"backgroundColor" : backgroundColor,
					"unicode" : unicode.toString(16).toUpperCase()
				});
				unicode++;
			});
		});
    next(null, file);
	});
}

gulp.task('template:icons', () => {

	let templateSources = [
		'UIImage.h.njk',
		'UIImage.m.njk',
		'SLDSIcon.h.njk'
	]

	let streams = templateSources.map(src => {
		let dest = src.replace('UIImage', 'UIImage+SLDSIcon').replace('.njk', '')
		dest = src.indexOf('UIImage') === -1 ? dest : 'Extensions/' + dest
		return gulp.src('templates/Icon/' + src)
			.pipe(nunjucks.compile({
				'icons': icons,
				'iconTypes':iconTypes
			}))
			.pipe(rename(dest))
	})

	return merge2(streams).pipe(gulp.dest(__PATHS__.output))
});

gulp.task('parse:icons', () => {
	return gulp.src(path.resolve('./temp/icons.json'))
	  .pipe(parseIcons())
});

const merge = require('gulp-json-concat');

gulp.task('merge:icon-tokens', () => {
	let basePath = path.resolve(__PATHS__.iconTokens)
	let source = iconTypes.map(t => {
		return basePath + '/' + t.tokenFilename
	});

	return gulp.src(source)
		.pipe(merge('icons.json', (data) => {
			iconTypes.forEach(t => {
				if(t.name !== 'utility') {
					data.icons
					data[t.name] = data[t.tokenFilename.replace('.json', '')]
					delete data[t.tokenFilename.replace('.json', '')]
				}
			})
	      return new Buffer(JSON.stringify(data));
	    }))
	    .pipe(jsonFormat(2))
			.pipe(gulp.dest('./temp'))
});

// ------------------------------------------------------------------------------------------------ //

gulp.task('parse:design-tokens', () => {
	return gulp.src([path.resolve(__PATHS__.designTokens)])
	  .pipe(parseDesignTokens())
})

gulp.task('default', () => {
	runSequence('parse:design-tokens', 'template:design-tokens', 'icons')
});

gulp.task('icons', () => {
	runSequence('create:icon-fonts', 'merge:icon-tokens', 'parse:icons', 'template:icons')
});