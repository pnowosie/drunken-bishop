class Printer
  constructor: (coins) ->
    @Coins = coins[...-2].split('')
    [@Coins.start_symbol, @Coins.end_symbol] = coins[-2..-1]

  print: (board, s) ->
    bs = @printTitle board.width
    for h in [0...board.height]
      bs += '|'
      cc = (@Coins[ board[board.arrayPos w,h] or 0 ] for w in [0...board.width])
      bs += cc.join ''
      bs += "|\n"
    bs += @printTitle board.width
    bs

  printTitle: (width, text) ->
    '+'.concat (new Array(1+width).join '-'), "+\n"

module.exports = Printer