const gulp 			= require('gulp');
const gutil 		= require('gulp-util');
const jsonFormat 	= require('gulp-json-format');
const through 		= require('through2');
const path 			= require('path');
const nunjucks 		= require('gulp-nunjucks');
const fs 			= require('fs');
const merge2		= require('merge2');
const rename		= require('gulp-rename');
const runSequence 	= require('run-sequence');
const iconFont 		= require('gulp-iconfont');
const gulpFilter 	= require('gulp-filter');
const gulpData		= require('gulp-data');
const consolidate 	= require('gulp-consolidate');
const del 			= require('del');
const _ 			= require('lodash');
const xmlEdit		= require('gulp-edit-xml');
var svgo 			= require('gulp-svgo');

const __PATHS__ = {
	templates: path.join(__dirname,'templates'),
  designTokens: path.join(__dirname,'node_modules','@salesforce-ux','design-system','design-tokens','dist','force-base.ios.json'),
  iconTokens: path.join(__dirname,'node_modules','@salesforce-ux','design-system','design-tokens','dist'),
  icons: path.join(__dirname,'node_modules','@salesforce-ux','design-system','assets','icons'),
  output: path.join(__dirname, 'SalesforceDesignSystem','generated'),
  temp: path.join(__dirname, 'temp')
};

let data = {};

let iconNames = [];

let types = [
	'color',
	'size',
	'font-size'
]

let iconTypes = [
	{
		'name': 'action',
		'tokenFilename': 'bg-actions.ios.json'
	},{
		'name': 'custom',
		'tokenFilename': 'bg-custom.ios.json'
	},{
		'name': 'standard',
		'tokenFilename': 'bg-standard.ios.json'
	},{
		'name': 'utility'
	}
]

const parseColor = (c) => {
	let splits = c.replace('rgba(','').replace('rgb(','').replace(')','').split(',');
  let r = parseFloat(splits[0]/255);
  let g = parseFloat(splits[1]/255);
  let b = parseFloat(splits[2]/255);

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
			let t = format(p.type)
			if (types.indexOf(p.type) !== -1) {

				if (!data[t].hasOwnProperty(format(p.category))) data[t][format(p.category)] = []
				data[t][format(p.category)].push({
					'name' : format(p.name),
					'value' : p.type === 'color' ? parseColor(p.value) : p.value
				});
			}
		});
    next(null, file);
	});
}

gulp.task('minify:svgs', () => {
	let index = 0.999
	let streams = [];

	iconTypes.forEach(t => {
		streams.push(
			gulp.src(__PATHS__.icons +  '/' + t.name + '/*.svg')
				.pipe(svgo())
				.pipe(xmlEdit((xml) => {
					if (t.name === 'action' || t.name === 'utility') {
						xml.svg.$.height = 100;
						xml.svg.$.weight = 100;
						xml.svg.$.viewBox = '0 -24 100 100';
					}
					if (xml.svg.g) {
						if(xml.svg.g[0].path) {
							xml.svg.g[0].path[0].$.d = xml.svg.g[0].path[0].$.d + ' M' + index + ' ' + index
						}
					}
					else if (xml.svg.path) xml.svg.path[0].$.d =  xml.svg.path[0].$.d + ' M' + index + ' ' + index
					index -= 0.001;
        	return xml;
    		}))
				.pipe(gulp.dest(__PATHS__.temp + '/minified/' + t.name))
			)
	})

	return merge2(streams)
});

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
	let iconPaths = []

	iconTypes.forEach(t => {
		fs.readdirSync(path.resolve(__PATHS__.temp + '/minified/' + t.name)).forEach(p => {
			iconPaths.push(__PATHS__.temp + '/minified/' + t.name + '/' + p)
		})
	})

	// add unique id to filename to avoid duplicate glyphs
	let id = 0;
	return gulp.src(iconPaths)
		.pipe(rename((path) => {
	    path.basename += '-' + id++;
	  }))
   	.pipe(iconFont({
  		fontName: 'SalesforceDesignSystemIcons',
  		normalize: true
    }))
		.pipe(gulp.dest('SalesforceDesignSystem.bundle'))
});

const parseIcons = () => {
	return through.obj((file, enc, next) => {
		iconTypes.forEach(iconType => {
			icons[iconType.name] = [];

			let names = (fs.readdirSync(path.resolve(__PATHS__.icons + '/' + iconType.name))).filter(n => {
				return n.indexOf('.svg') !== -1;
			}).map(i => {
				return iconType.name === 'action' ? 'action' + format(i.replace('.svg','')) : format(i.replace('.svg','')).charAt(0).toLowerCase() + format(i.replace('.svg','')).slice(1);
			});

			let tokens = JSON.parse(file.contents.toString('utf-8'));
			names.forEach(n => {
				let backgroundColor = iconType.name === 'utility' ? 'null' : parseColor(_.find(tokens[iconType.name].properties, { 'name': n }).value)
				let name = (iconType.name === 'action' || iconType.name === 'custom') ?  format(n) : format(iconType.name) + format(n)
				iconNames.push(name);
				icons[iconType.name].push({
					"name" : name ,
					"backgroundColor" : backgroundColor
				});
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

gulp.task('template:names', () => {

	let streams = [];

	streams.push(
		gulp.src('templates/Name/NSString.h.njk')
			.pipe(nunjucks.compile())
			.pipe(rename('Extensions/NSString+SLDSName.h'))
	);

	streams.push(
		gulp.src('templates/Name/NSString.m.njk')
			.pipe(nunjucks.compile())
			.pipe(rename('Extensions/NSString+SLDSName.m'))
	);

	streams.push(
		gulp.src('templates/Name/SLDSName.h.njk')
			.pipe(nunjucks.compile({
				'tokenNames': data,
				'iconNames': iconNames}))
			.pipe(rename('SLDSName.h'))
	);

	return merge2(streams).pipe(gulp.dest(__PATHS__.output))
});

gulp.task('parse:design-tokens', () => {
	return gulp.src([path.resolve(__PATHS__.designTokens)])
	  .pipe(parseDesignTokens())
})

gulp.task('default', () => {
	runSequence('parse:design-tokens', 'template:design-tokens', 'icons')
});

gulp.task('remove:temp', () => {
	return del(__PATHS__.temp, {force:true});
});

gulp.task('clean', () => {
	return del([__PATHS__.output, __PATHS__.temp], {force:true});
});

gulp.task('icons', () => {
	runSequence('minify:svgs', 'create:icon-fonts', 'merge:icon-tokens', 'parse:icons', 'template:icons', 'template:names', 'remove:temp')
});