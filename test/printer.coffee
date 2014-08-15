should = require 'should'
Board = require '../build/board'
Printer = require '../build/printer'

describe 'Printer', ->
  p = new Printer ' .o+=*BOX@%&#/^SE'
  describe 'Printing header and footer', ->
    it 'should display horizontal boarder of given length', ->
      '+---+\n'.should.equal p.printTitle 3

    it 'no title is displayed if text to display is empty', ->
      '+---+\n'.should.equal p.printTitle 3

    it 'no title is displayed if there is not enougth room for text', ->
      '+-----+\n'.should.equal p.printTitle 5, 'ab' # Minimum is '+-[a]-+'

    it 'should be at least one "-" on each side of title', ->
      '+-----+\n'.should.equal p.printTitle 5, 'ab' # Minimum is '+-[a]-+'
      '+-[a]-+\n'.should.equal p.printTitle 5, 'a'
      '+-[a]--+\n'.should.equal p.printTitle 6, 'a'

    it 'should display title in the middle of the boarder', ->
      '+-[a]-+\n'.should.equal p.printTitle 5, 'a'



  describe 'Printer coins characters', ->
    p = new Printer ' .o+=*BOX@%&#/^SE'
    it 'Coins property should be an Array', ->
      p.should.be.OK
      p.Coins.should.be.an.Array

    it 'should have "start_symbol" property', ->
      p.Coins.start_symbol.should.be.equal 'S'

    it 'should have "end_symbol" property', ->
      p.Coins.end_symbol.should.be.equal 'E'

    it 'Coins should be initialized from string', ->
      p.Coins.join('').should.be.equal ' .o+=*BOX@%&#/^'

  describe 'Printing board', ->
    empty = '+-------+\n'+
            '|       |\n'+
            '|   S   |\n'+
            '|       |\n'+
            '+-------+\n'
    it 'prints empty board', ->
      b = new Board 7, 3
      p = new Printer ' .oxSE'
      empty.should.equal p.print b

    it 'each row should have the same length equals the board width', ->
      boardWidth = 9; boardHeight = 7
      expectedWidth = 1 + boardWidth + 1   # boarder + width + boarder
      expectedHeight = 1 + boardHeight + 1 # boarder + height + boarder
      b = new Board boardWidth, boardHeight
      p = new Printer ' .oxSE'
      lines = (p.print b).split '\n'
      lines.pop() # get last empty line out
      expectedHeight.should.equal lines.length
      expectedWidth.should.equal line.length for line in lines

    it 'start-symbol should be placed in the middle of the board', ->
      b = new Board 3, 3
      p = new Printer ' .oxSE'
      lines = (p.print b).split '\n'
      line = lines[1 + 3//2] # boarder and middle of height
      char = line[1 + 3//2] # boarder and middle of width
      'S'.should.equal char

    it 'end-symbol should appear instead of starting when walk ends in starting position', ->
      b = new Board 3, 3
      b.walk [2, 1] # SW, NE
      p = new Printer ' .oxSE'
      lines = (p.print b).split '\n'
      line = lines[1 + 3//2] # boarder and middle of height
      char = line[1 + 3//2] # boarder and middle of width
      'E'.should.equal char