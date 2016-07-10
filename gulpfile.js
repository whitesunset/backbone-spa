var env = 'prod';
var gulp = require('gulp');
var gulpif = require('gulp-if');
var gutil = require('gulp-util');
var sass = require('gulp-sass');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var htmlmin = require('gulp-htmlmin');
var uglifycss = require('gulp-uglifycss');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('css', function () {
	return gulp.src([
		'bower_components/bootstrap/dist/css/bootstrap.css',
		'bower_components/bootstrap-material-design/dist/css/bootstrap-material-design.min.css',
		'bower_components/bootstrap-material-design/dist/css/ripples.min.css',
		'src/scss/main.scss'])
		.pipe(gulpif(/[.]scss/, sass()))
		.pipe(concat('style.min.css'))
		.pipe(gulpif(env === 'prod', uglifycss()))
		.pipe(sourcemaps.write('./'))
		.pipe(gulp.dest('public'));
});

gulp.task('coffee', function () {
	return gulp.src([
		'src/coffee/app.coffee',
		'src/coffee/router.coffee',
		'src/coffee/mixins/buttons.coffee',
		'src/coffee/models/app.coffee',
		'src/coffee/models/user.coffee',
		'src/coffee/collections/users.coffee',
		'src/coffee/templates/root.coffee',
		'src/coffee/templates/user/edit.coffee',
		'src/coffee/templates/user/address.coffee',
		'src/coffee/views/root.coffee',
		'src/coffee/views/user/list.coffee',
		'src/coffee/views/user/address.coffee',
		'src/coffee/views/user/edit.coffee',
		])
		.pipe(coffee({bare: true}).on('error', gutil.log))
		.pipe(concat('app.min.js'))
		.pipe(gulp.dest('src'));
});

gulp.task('js', ['coffee'], function () {
	return gulp.src([
			'bower_components/jquery/dist/jquery.min.js',
			'bower_components/underscore/underscore-min.js',
			'bower_components/backbone/backbone-min.js',
			'bower_components/backbone-deep-model/distribution/deep-model.js',
			'bower_components/backbone.stickit/backbone.stickit.js',
			'bower_components/backgrid/lib/backgrid.js',
			'bower_components/backbone.paginator/lib/backbone.paginator.min.js',
			'bower_components/backgrid-paginator/backgrid-paginator.min.js',
			'bower_components/bootstrap/dist/js/bootstrap.min.js',
			'bower_components/bootstrap-material-design/dist/js/material.min.js',
			'bower_components/bootstrap-material-design/dist/js/ripples.min.js',
			'src/app.min.js'
		])
		.pipe(concat('script.min.js'))
		.pipe(gulpif(env === 'prod', uglify()))
		.pipe(sourcemaps.write('./'))
		.pipe(gulp.dest('public'));
});

gulp.task('build', ['css', 'js']);

gulp.task('watch', function () {
	env = 'dev';
	gulp.start( 'build');
	gulp.watch('src/scss/**/*.scss', ['css']);
	gulp.watch('src/coffee/**/*.coffee', ['js']);
});

gulp.task('default', ['build']);
