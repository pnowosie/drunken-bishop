
class Board extends Array
  constructor: (@width, @height, @start) ->
    @start = (1+ @width >> 1) + @width * (1+ @height >> 1) unless @start?

  @OpenSSH: -> new Board 17, 9
  @Toponce: -> new Board 19, 11


module.exports = Board