should = require 'should'
Board = require '../build/board'

describe 'The Board', ->
  describe 'Board object', ->
    expected_start = 3+7*2
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
      empty = (x for x in b when x?)
      empty.should.be.empty

      my_b = new Board 7, 5
      my_b[4] = 1
      my_b[2] = 3 
      my_b.should.have.lengthOf 7*5 # but it isn't an array itself
      arrOfTwo = (x for x in my_b when x?)
      arrOfTwo.should.be.an.Array.and.have.lengthOf 2

  describe 'Convert between 1D <-> 2D positions', ->
    it 'should correctly convert board center to array index', ->
      (Board.OpenSSH().arrayPos 8, 4).should.equal 8 + 17*4
      (Board.Toponce().arrayPos 9, 5).should.equal 9 + 19*5

    it 'should correctly convert array index to board position', ->
      sshB = Board.OpenSSH()
      (sshB.boardPos sshB.start).should.eql [8, 4]
      topB = Board.Toponce()
      (topB.boardPos topB.start).should.eql [9, 5]
      myB = new Board 3, 3
      (myB.boardPos myB.start).should.eql [1, 1]

  describe 'Get method should return correct values', ->
    b = new Board 3, 3
    b[0] = 5; b[1] = 2; b[3] = 0; b[6] = 0; b[7] = 2; b[8] = 3
    b.end = 6

    it 'Value test - array coords', ->
      5.should.equal b.get 0
      2.should.equal b.get 1
      0.should.equal b.get 2
      0.should.equal b.get 3
      0.should.equal b.get 5
      2.should.equal b.get 7
      3.should.equal b.get 8

    it 'Value test - board coords', ->
      5.should.equal b.get 0, 0
      2.should.equal b.get 1, 0
      0.should.equal b.get 2, 0
      0.should.equal b.get 0, 1
      0.should.equal b.get 2, 1
      2.should.equal b.get 1, 2
      3.should.equal b.get 2, 2

    it 'Start and End test', ->
      (-2).should.equal b.get 4
      (-2).should.equal b.get 1, 1
      (-1).should.equal b.get 6
      (-1).should.equal b.get 0, 2

    it 'End position goes before start', ->
      my_b = new Board 3, 3, 1
      1.should.equal my_b.start
      my_b.end = 1
      (-1).should.equal my_b.get 1

  describe 'OpenSSH board', ->
    b = Board.OpenSSH()
    it 'should expose static property', ->
      (b?).should.be.ok

    it 'should have correct size and starting position', ->
      b.width.should.equal 17
      b.height.should.equal 9
      b.start.should.equal 8+17*4

  describe 'Toponce\'s board', ->
    b = Board.Toponce()
    it 'should expose static property', ->
      (b?).should.be.ok

    it 'should have correct size and starting position', ->
      b.width.should.equal 19
      b.height.should.equal 11
      b.start.should.equal 9+19*5
