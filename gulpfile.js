const gulp 					= require('gulp');
const gutil 				= require('gulp-util');
const jsonFormat 		= require('gulp-json-format');
const through 			= require('through2');
const path 					= require('path');
const nunjucks 			= require('gulp-nunjucks');
const fs 						= require('fs');
const merge2				= require('merge2');
const rename				= require('gulp-rename');
const runSequence 	= require('run-sequence');
const _ 						= require('lodash');

const __PATHS__ = {
  designTokens: path.join(__dirname,'node_modules','@salesforce-ux','design-system','design-tokens','dist','force-base.ios.json'),
  iconTokens: path.join(__dirname,'node_modules','@salesforce-ux','design-system','design-tokens','dist'),
  icons: path.join(__dirname,'node_modules','@salesforce-ux','design-system','assets','icons'),
  output: path.join(__dirname, 'SalesforceDesignSystem','SalesforceDesignSystem','generated')
};

const prefix = 'SLDS';

let data = {};

let types = [
	'color',
	'size',
	'font-size'
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

// extract categories for a particular property type, add to categories object
const parseDesignTokens = () => {
	return through.obj((file, enc, next) => {
		let tokens = JSON.parse(file.contents.toString('utf-8'));

		types.forEach(t => {
			data[format(t)] = {};
		});

		tokens.properties.forEach(p => {
			if (types.indexOf(p.type) !== -1) {
				let value = p.value
				let t = format(p.type)

				if (!data[t].hasOwnProperty(format(p.category))) data[t][format(p.category)] = []
				if (p.type === 'color') value = parseColor(p.value)

				data[t][format(p.category)].push({
					'name' : p.name,
					'value' : value
				})
			}
		});

    file.contents = new Buffer(JSON.stringify(tokens), 'utf-8');
    next(null, file);
	});
}

const format = (s) => {
	return s[0].toUpperCase() + _.camelCase(s.substring(1))
}

gulp.task('template:design-tokens', () => {
	let streams = [];

		for (let type in data) {
		if (data.hasOwnProperty(type)) {
			let updatedType = type === 'FontSize' ? 'Font' : type
					streams.push(
						gulp.src('templates/' + updatedType + '/UI' + updatedType + '.h.njk')
							.pipe(nunjucks.compile({ 'data': data[type] }))
							.pipe(rename('extensions/UI' + updatedType + '+SLDS' + updatedType + '.h'))
					);

					streams.push(
						gulp.src('templates/' + updatedType + '/UI' + updatedType + '.m.njk')
							.pipe(nunjucks.compile({ 'data': data[type] }))
							.pipe(rename('extensions/UI' + updatedType + '+SLDS' + updatedType + '.m'))
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
})

// Icons
// ------------------------------------------------------------------------------------------------ //

let icons = [];

// extract categories for a particular property type, add to categories object
const parseIconTokens = () => {
	return through.obj((file, enc, next) => {
		let tokens = JSON.parse(file.contents.toString('utf-8'));

		// push unique categories
		tokens.properties.forEach(p => {
			
      let bgColor = parseColor(p.value)

			icons.push({
				"name" : p.name,
				"bgColor" : bgColor
			})
		});

		console.log(icons)

    file.contents = new Buffer(JSON.stringify(tokens), 'utf-8');
    next(null, file);
	});
}

gulp.task('template:icon-tokens', () => {
	let streams = [];


	icons.forEach(i => {

	})

	// return merge2(streams).pipe(gulp.dest(__PATHS__.output))
})

gulp.task('parse:design-tokens', () => {
	return gulp.src([path.resolve(__PATHS__.designTokens)])
	  .pipe(parseDesignTokens())
})

gulp.task('parse:icon-tokens', () => {
	return gulp.src([path.resolve(__PATHS__.iconTokens)])
	  .pipe(parseIconTokens())
})

gulp.task('default', () => {
	runSequence('parse:design-tokens', 'template:design-tokens')
});




































// Icons
// ------------------------------------------------------------------------------------------------ //


const iconFont 		= require('gulp-iconfont');
const svgMin 			= require('gulp-svgmin');
const fontPlugin 	= require('./fontPlugin.js');
const gulpFilter 	= require('gulp-filter');

gulp.task('create:icon-fonts', () => {
	const ttfFilter = gulpFilter('**/*.ttf');
	return gulp.src([__PATHS__.icons + '/action/*.svg'])
   .pipe(svgMin({
      plugins: [
        {
          removeViewBox:true,
          convertShapeToPath:true
        },
        {
          fontplugin:fontPlugin
        },
        {
          transformsWithOnePath:{}
        },
        {
          cleanupNumericValues: {
              floatPrecision: 3
          }
        }
      ]
  	}))
   	.pipe(iconFont({
  		fontName: 'SalesforceDesignSystemIconsAction', 
    }))
    .pipe(ttfFilter)
    .pipe(gulp.dest('SalesforceDesignSystem.bundle/'));
});