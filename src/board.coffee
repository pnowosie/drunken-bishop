
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
      when NW then --last_x; --last_y
      when NE then ++last_x; --last_y
      when SW then --last_x; ++last_y
      when SE then ++last_x; ++last_y
    last_x = 0 if last_x < 0
    last_x = @width if last_x > @width
    last_y = 0 if last_y < 0
    last_y = @height if last_y > @height
    @end = @arrayPos last_x, last_y
    @[@end] = 1 + (@[@end] or 0)

module.exports = Board