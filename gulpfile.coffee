# load plugins
gulp = require 'gulp'
coffee = require 'gulp-coffee'
clean = require 'gulp-clean'
browserSync = require 'browser-sync'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
gutil = require 'gulp-util'


# config
paths =
  target: 'dist'
  src: 'src'

# tasks
gulp.task 'coffee', ['clean'], () ->
  gulp.src "#{paths.src}/**/*.coffee"
  .pipe plumber()
  .pipe coffee()
  .pipe gulp.dest paths.target

gulp.task 'copy', ['clean'],() ->
  gulp.src "#{paths.src}/**/*.html"
  .pipe gulp.dest paths.target

gulp.task 'reload', () ->
  browserSync.reload()

gulp.task 'browser-sync', () ->
  browserSync(
    server:
      baseDir: paths.target
  )

gulp.task 'watch', () ->
  watch "#{paths.src}/**/*", () ->
    gulp.start(['build', 'reload'])

gulp.task 'clean', () ->
  gulp.src "#{paths.target}/*"
  .pipe clean()


gulp.task 'build', ['coffee', 'copy']
gulp.task 'server', ['browser-sync', 'watch']
gulp.task 'default', ['build']
