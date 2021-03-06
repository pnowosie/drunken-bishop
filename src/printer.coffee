﻿class Printer
  constructor: (coins) ->
    @Coins = coins[...-2].split('')
    [@Coins.start_symbol, @Coins.end_symbol] = coins[-2..-1]

  print: (board, s) ->
    bs = @printTitle board.width, s?.header
    for h in [0...board.height]
      bs += '|'
      cc = (@getCoin board.get w, h for w in [0...board.width])
      bs += cc.join ''
      bs += "|\n"
    bs += @printTitle board.width, s?.footer
    bs

  printTitle: (width, text) ->
    if not text or width-2 < text.length+2
      return '+'.concat (new Array(1+width).join '-'), "+\n"

    minusCnt = width-2 -text.length
    arr = new Array 1+ minusCnt // 2
    title = '+'.concat (arr.join '-'), '[', text, ']', (arr.join '-')
    title += '-' if title.length is width
    title += '+\n'

  getCoin: (v) ->
    if v >= @Coins.length then v = a.length-1

    if v == -2 then @Coins.start_symbol
    else if v == -1 then @Coins.end_symbol
    else @Coins[v]

module.exports = Printer