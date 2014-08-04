should = require 'should'
Gravity = require '../build/gravity'

describe 'Representation objects', ->
  describe 'The Gravity object', ->
    NW = 0; NE = 1; SW = 2; SE = 3
    diamond_art = new Buffer [ 0x48, 0xf5, 0xaf, 0x0a, 0xd0 ]
    gravity = new Gravity

    it 'knows how to convert randomness to list of move directions', ->
      (gravity?).should.be.ok
      gravity.should.be.type('object')
      gravity.getWalk.should.be.a.Function
      
    it 'one byte produces four directions', ->
      gravity.getWalk([0x2d]).should.be.an.Array.and.have.lengthOf 4

    it 'diamond art walk length should have 20 moves', ->
      gravity.getWalk(diamond_art).should.have.lengthOf 20

    it 'gives NW,SE,NW,SE for byte 0xcc', ->  # 00,11,00,11
      gravity.getWalk([0xcc]).should.eql([NW,SE,NW,SE])

    it 'gives NE,SW,NE,SW for byte 0x99', ->  # 01,10,01,10 
      gravity.getWalk([0x99]).should.eql([NE,SW,NE,SW])

    it 'gives SW,NE,SW,NE for byte 0x66', ->  # 10,01,10,01
      gravity.getWalk([0x66]).should.eql([SW,NE,SW,NE])

    it 'gives SE,NW,SE,NW for byte 0x33', ->  # 11,00,11,00
      gravity.getWalk([0x33]).should.eql([SE,NW,SE,NW])

    it 'gives NE,SE,SW,NW for byte 0x2d', ->  # 01,11,10,00
      gravity.getWalk([0x2d]).should.eql([NE,SE,SW,NW])

    it 'gives SE,SW,SE,SW for byte 0xbb', ->  # 11,10,11,10
      gravity.getWalk([0xbb]).should.eql([SE,SW,SE,SW])

    it 'gives SW,SE,SW,SE for byte 0xee', ->  # 10,11,10,11
       gravity.getWalk([0xee]).should.eql([SW,SE,SW,SE])

    it 'gives NE,NW,NE,NW for byte 0x11', ->  # 01,00,01,00
       gravity.getWalk([0x11]).should.eql([NE,NW,NE,NW])

    it 'gives NW,NE,NW,NE for byte 0x44', ->  # 00,01,00,01
       gravity.getWalk([0x44]).should.eql([NW,NE,NW,NE])
