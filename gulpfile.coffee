gulp = require 'gulp'
del = require 'del'
coffeelint = require 'gulp-coffeelint'
coffee = require 'gulp-coffee'
mocha = require 'gulp-mocha'

gulp.task 'clean', (cb) ->
  del ['build'], cb

gulp.task 'lint', ->
  gulp.src './src/*.coffee'
  .pipe coffeelint()
  .pipe coffeelint.reporter()

gulp.task 'build', ['clean'], ->
  gulp.src 'src/*.coffee'
  .pipe coffee()
  .pipe gulp.dest 'build'

gulp.task 'test', ['build'], ->
  gulp.src 'test/*.coffee', read: false
  .pipe mocha reporter: 'nyan'  # nyan, landing, spec

gulp.task 'default', ['lint', 'build']
