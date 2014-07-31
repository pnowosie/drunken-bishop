
class Board extends Array
  constructor: (@width, @height, @start) ->
    @start = (1+ @width >> 1) + @width * (1+ @height >> 1) unless @start?
    @length = @width * @height

  @OpenSSH: -> new Board 17, 9
  @Toponce: -> new Board 19, 11

  boardPos: (index) ->
    [ index % @width, index / @width |0 ]

  arrayPos: (w, h) -> w + @width * h


module.exports = Board