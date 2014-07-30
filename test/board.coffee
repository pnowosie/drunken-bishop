should = require 'should'
Board = require '../build/board'

describe 'The Board', ->
  describe 'Board object', ->
    expected_start = 4+7*3
    b = new Board 7, 5

    it 'should expose Board properties', ->
      (b?).should.be.ok
      b.width.should.be.a.Number
      b.height.should.be.a.Number
      b.start.should.be.a.Number

    it 'board should have correct size', ->
      b.width.should.equal 7
      b.height.should.equal 5
      
    it 'should set starting position in the center', ->
      b.start.should.equal expected_start

    it 'should be able to set different starting position', ->
      my_b = new Board 7, 5, 0
      my_b.start.should.equal 0

    it 'should behave like an Array', ->
      empty = (x for x in b)
      empty.should.be.empty

      my_b = new Board 7, 5
      my_b[4] = 1
      my_b[2] = 3

  describe 'OpenSSH board', ->
    b = Board.OpenSSH()
    it 'should expose static property', ->
      (b?).should.be.ok

    it 'should have correct size and starting position', ->
      b.width.should.equal 17
      b.height.should.equal 9
      b.start.should.equal 9+17*5

  describe 'Toponce\'s board', ->
    b = Board.Toponce()
    it 'should expose static property', ->
      (b?).should.be.ok

    it 'should have correct size and starting position', ->
      b.width.should.equal 19
      b.height.should.equal 11
      b.start.should.equal 10+19*6
