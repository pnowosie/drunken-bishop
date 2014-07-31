﻿should = require 'should'
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
      (Board.OpenSSH().arrayPos 9, 5).should.equal 9 + 17*5
      (Board.Toponce().arrayPos 10, 6).should.equal 10 + 19*6

    it 'should correctly convert array index to board position', ->
      sshB = Board.OpenSSH()
      (sshB.boardPos sshB.start).should.eql [9, 5]
      topB = Board.Toponce()
      (topB.boardPos topB.start).should.eql [10, 6]
      myB = new Board 7, 5
      (myB.boardPos myB.start).should.eql [4, 3]

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
