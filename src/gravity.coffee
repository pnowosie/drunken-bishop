class Gravity

  @getWalk: (buf) ->
    directions = []
    for byte in buf
      directions.push( (byte & (3 << i)) >> i ) for i in [0..6] by 2
    directions

module.exports = Gravity