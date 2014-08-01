class Gravity

  getWalk: (buf) ->
    directions = []
    for byte in buf
      directions.push( (byte & (3 << i)) >> i )  for i in [0, 2, 4, 6]
    directions

module.exports = Gravity