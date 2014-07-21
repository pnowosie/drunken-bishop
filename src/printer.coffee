class Printer
  constructor: (coins) ->
    @Coins = coins[...-2].split('')
    [@Coins.start_symbol, @Coins.end_symbol] = coins[-2..-1]

module.exports = Printer