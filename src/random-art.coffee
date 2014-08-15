Gravity = require './gravity'
Board = require './board'
Printer = require './printer'

module.exports = class RandomArt
  @get: (data, opt) ->
    opt = {} unless opt?
    opt.type = 'openssh' unless opt.type?

    data = @toRawBytes data if typeof data is 'string'




  @toRawBytes: (str, fmt) ->
    if typeof str isnt 'string'
      throw new Error 'Argument is expected to be type of string'
    fmt = @discoverFormat str unless fmt?
    new Buffer str, fmt

  @discoverFormat: (str) ->
    # if hex.startsWith '0x', @see http://stackoverflow.com/questions/646628/how-to-check-if-a-string-startswith-another-string
    hex = if (str.lastIndexOf '0x', 0) is 0 then str[2..]
    else str

    if /^[0-9a-f]{2,}$/i.test hex then 'hex'
    else if str.length <= 3 or (str.indexOf ' ') > -1 then 'utf8'
    else 'base64'
