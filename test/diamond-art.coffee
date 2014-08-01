should = require 'should'
Gravity = require '../build/gravity'
Board = require '../build/board'
Printer = require '../build/printer'

describe 'Diamond art', ->
  NW = 0; NE = 1; SW = 2; SE = 3
  diamond = [ 0x48, 0xf5, 0xaf, 0x0a, 0xd0 ]
  walkDir = [ NW, SW, NW, NE, NE, NE, SE, SE, SE, SE, SW, SW, SW, SW, NW, NW, NW, NW, NE, SE ]
  boardD  = [ 8, 24, 26, 40, 44, 56, 58, 62, 72, 74, 80, 90, 96, 108, 112, 126, 128, 144 ]


  describe 'Gravity object', ->
    it 'converts binary to directions', ->
      gravity = new Gravity
      dir = gravity.getWalk diamond
      walkDir.should.eql dir

  describe 'Board state object', ->
    it 'Diamond-art state object', ->
      gravity = new Gravity
      b = Board.OpenSSH()
      b.walk gravity.getWalk diamond

      b.start.should.equal 8 + 17*4
      b.end.should.equal 6 + 17*4
      positions = (x for v,x in b when v?)
      positions.sort( (a,b) -> a-b )
      boardD.should.eql positions

  describe 'Printed art string', ->
    it 'Diamond-art printout string', ->
      gravity = new Gravity
      b = Board.OpenSSH()
      b.walk gravity.getWalk diamond
      p = new Printer ' .oSE'
      console.log p.print b
