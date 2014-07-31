
class Board extends Array
  constructor: (@width, @height, @start) ->
    @start = (@width >> 1) + @width * (@height >> 1) unless @start?
    @length = @width * @height

  @OpenSSH: -> new Board 17, 9
  @Toponce: -> new Board 19, 11

  boardPos: (index) ->
    [ index % @width, index / @width |0 ]

  arrayPos: (w, h) -> w + @width * h

  makeMove: (direction) ->
    @end = @start unless @end?
    [last_x, last_y] = @boardPos @end
    NW = 0; NE = 1; SW = 2; SE = 3

    switch direction
      when NW then
      when NE then
      when SW then
      when SE then
    undefined

module.exports = Board