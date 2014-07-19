gulp = require 'gulp'
del = require 'del'
mocha = require 'gulp-mocha'

gulp.task 'clean', (cb) ->
    del ['build'], cb

gulp.task 'test', ->
    gulp.src 'test/*.coffee', read: false
        .pipe(mocha reporter: 'nyan')    # nyan, landing, spec

gulp.task 'default', ['clean', 'test']
