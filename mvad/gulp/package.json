var gulp = require('gulp'),
    autoprefixer = require('gulp-autoprefixer'),
    path = require('path'),
    less = require('gulp-less'),
    gutil = require('gulp-util'),
    fs = require("fs"),
    lessSource = './assets/less/stylesheet.less',
    // cssDest = './assets/css/';
    cssDest = '.';

var fileContent  = fs.readFileSync(lessSource + 'stylesheet.less', "utf8"),
    options = fileContent.slice(0, fileContent.indexOf("\n")),
    options = options.slice(3),
    options = JSON.parse('{' + options + '}');

var LessPluginCleanCSS = require('less-plugin-clean-css'),
    cleanCSSPlugin = new LessPluginCleanCSS({compatibility: options['cleancss']});

// Autoprefixer
var prefixer = options['autoprefixer'];
prefixer = prefixer.join(', ');

gulp.task('less', function () {

    return gulp.src(lessSource)
        .pipe(less({
            plugins: [ cleanCSSPlugin ]
        }))
        // .pipe(autoprefixer({
        //     browsers: prefixer,
        //     cascade: false
        // }))
        .on('end', function() { gutil.log(prefixer); })
        .pipe(gulp.dest(cssDest));
});

gulp.task('watch', function() {
  gulp.watch('**/*.less', ['less']);
});

// Default Task
gulp.task('default', ['less', 'watch'], function() {
});
