should = require 'should'
Gravity = require '../build/gravity'
Board = require '../build/board'
Printer = require '../build/printer'

describe 'Diamond art', ->
  NW = 0; NE = 1; SW = 2; SE = 3
  diamond = [ 0x48, 0xf5, 0xaf, 0x0a, 0xd0 ]
  walkDir = [ NW, SW, NW, NE, NE, NE, SE, SE, SE, SE, SW, SW, SW, SW, NW, NW, NW, NW, NE, SE ]

  pathDebugger = (walk) ->
    (path) -> 
      walk.push path.start if walk.length is 0
      walk.push path.end


  describe 'Gravity object', ->
    it 'converts binary to directions', ->
      dir = Gravity.getWalk diamond
      walkDir.should.eql dir

  describe 'Board state object', ->
    it 'Diamond-art state object', ->
      do (b = Board.OpenSSH(), 
          g = Gravity,
          data = diamond,
          walk = []) ->

        path = [ 76, 58, 74, 56, 40, 24, 8, 26, 44, 62, 80, 96, 112, 128, 144, 126, 108, 90, 72, 56, 74 ]

        b.walkDebugger = pathDebugger walk
        b.walk Gravity.getWalk data

        b.start.should.equal 8 + 17*4
        b.end.should.equal 6 + 17*4
        path.should.eql walk

  describe 'Printed art string', ->
    diamondArt= '+-----------------+\n'+
                '|        .        |\n'+
                '|       . .       |\n'+
                '|      .   .      |\n'+
                '|     o .   .     |\n'+
                '|    . E S   .    |\n'+
                '|     .     .     |\n'+
                '|      .   .      |\n'+
                '|       . .       |\n'+
                '|        .        |\n'+
                '+-----------------+\n'

    it 'Diamond-art printout string', ->
      b = Board.OpenSSH()
      b.walk Gravity.getWalk diamond
      p = new Printer ' .oSE'
      diamondArt.should.equal p.print b


    it 'OpenSSH board known walk test', ->
      # From section "2.3 Coverage" of [paper](http://www.dirk-loss.de/sshvis/drunken_bishop.pdf)
      do (b = Board.OpenSSH(), 
          g = Gravity,
          data = [0xfc, 0x94, 0xb0, 0xc1, 0xe5, 0xb0, 0x98, 0x7c, 0x58, 0x43, 0x99, 0x76, 0x97, 0xee, 0x9f, 0xb7],
          walk = []) ->

        b.walkDebugger = pathDebugger walk
        b.walk g.getWalk data

        walk.should.eql [76, 58, 76, 94, 112, 94, 78, 62, 78, 60, 42, 60, 76, 60, 42, 24, 42, 26, 10, 26, 44,
                        26, 8, 26, 42, 24, 40, 24, 40, 22, 40, 58, 42, 24, 40, 24, 8, 26, 8, 7, 8, 9, 25, 9, 25,
                        41, 25, 43, 27, 45, 29, 13, 29, 45, 63, 79, 97, 115, 133, 117, 133, 151, 135, 152, 151]
