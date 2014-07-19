gulp = require 'gulp' 
mocha = require 'gulp-mocha'

gulp.task 'test', ->
    gulp.src 'test/*.coffee', read: false
        .pipe(mocha reporter: 'nyan')

gulp.task 'default', ['test']
