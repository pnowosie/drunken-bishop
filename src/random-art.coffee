Gravity = require './gravity'
Board = require './board'
Printer = require './printer'

module.exports = class RandomArt
  @get: (data, opt) ->
    opt = {} unless opt?
    opt.type = 'openssh' unless opt.type?

    data = @toRawBytes data if typeof data is 'string'
    [board, printer] = @createStandardBoard opt.type

    board.walk Gravity.getWalk data
    printer.print board, opt

  @createStandardBoard: (type) ->
    # OpenSSH board is default
    switch type
      when 'toponce'
        [ Board.Toponce(), new Printer ' .^:li?(fxXZ#MW&8%@SE' ]
      else
        [ Board.OpenSSH(), new Printer ' .o+=*BOX@%&#/^SE' ]

  @toRawBytes: (str, fmt) ->
    if typeof str isnt 'string'
      throw new Error 'Argument is expected to be type of string'
    fmt = @discoverFormat str unless fmt?
    new Buffer str, fmt

  @discoverFormat: (str) ->
    # if hex.startsWith '0x', more 'stackoverflow: javascript startsWith'
    hex = if (str.lastIndexOf '0x', 0) is 0 then str[2..]
    else str

    if /^[0-9a-f]{2,}$/i.test hex then 'hex'
    else if str.length <= 3 or (str.indexOf ' ') > -1 then 'utf8'
    else 'base64'
