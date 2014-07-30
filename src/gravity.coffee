class Gravity

  NW = 0; NE = 1; SW = 2; SE = 3

  getWalk: (buf) ->
    directions = []
    for byte in buf
      directions.push( (byte & (3 << i)) >> i )  for i in [0..6] when i%2==0
    directions

module.exports = Gravity