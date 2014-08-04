Gravity = require './gravity'
Board = require './board'
Printer = require './printer'

module.exports = class RandomArt
  @get: (data, opt) ->
    opt = {} unless opt?
    opt.type = 'openssh' unless opt.type?

    data = @toRawBytes data if typeof data is 'string'




  @toRawBytes: (str, fmt) ->
    fmt = @discoverFormat str unless fmt?
    new Buffer str, fmt

  @discoverFormat: (str) ->
