should = require 'should'
Board = require '../build/board'
Printer = require '../build/printer'

describe 'Printer', ->
  describe 'Printing header and footer', ->
    it 'no title is displayed if there is not enougth room for text'
    it 'no title is displayed if text to display is empty'
    it 'should display title in the middle of the boarder'
    it 'should be at least one "-" on each side of title'
    it 'should display horizontal boarder of given length'

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
    it 'prints empty board', ->
      b = new Board 7, 3
      p = new Printer ' .oxSE'
      console.log p.print b

    it 'each row should have the same length equals the board width'
    it 'EOL charactes should be handled independent from environment'
    it 'should print boarder around with chars +-|'
    it 'start-symbol should be placed in the middle of the board'
    it 'end-symbol should appear instead of starting when walk ends in starting position'

  describe 'Custom art printing', ->
    it 'Using OpenSSH board Diamond art should be printed correctly'
    it 'Using Toponce\'s modified board Diamond art should be printed correctly'