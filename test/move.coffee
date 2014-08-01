should = require 'should'
Board = require '../build/board'

describe 'Walking on the board', ->
  NW = 0; NE = 1; SW = 2; SE = 3
  describe 'Walking from starting position', ->
    it 'move NW should place the bishop in correct field', ->
      b = new Board 3,3
      b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0

    it 'move NE should place the bishop in correct field', ->
      b = new Board 3,3
      b.makeMove NE
      (''+b).should.equal ',,1,,,,,,'
      b.end.should.equal 2

    it 'move SW should place the bishop in correct field', ->
      b = new Board 3,3
      b.makeMove SW
      (''+b).should.equal ',,,,,,1,,'
      b.end.should.equal 6

    it 'move SE should place the bishop in correct field', ->
      b = new Board 3,3
      b.makeMove SE
      (''+b).should.equal ',,,,,,,,1'
      b.end.should.equal 8


  describe 'Walking from "a" field', ->
    it 'move NW should leave bishop unmoved', ->
      b = new Board 3,3,0
      b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0

    it 'move NE should place the bishop on second top field', ->
      b = new Board 3,3,0
      b.makeMove NE
      (''+b).should.equal ',1,,,,,,,'
      b.end.should.equal 1

    it 'move SW should place the bishop second row left boarder', ->
      b = new Board 3,3,0
      b.makeMove SW
      (''+b).should.equal ',,,1,,,,,'
      b.end.should.equal 3

    it 'move SE should place the bishop one field from corner', ->
      b = new Board 3,3,0
      b.makeMove SE
      (''+b).should.equal ',,,,1,,,,'
      b.end.should.equal 4

  describe 'Walking from "b" field', ->
    it 'move NE should leave bishop unmoved'
    it 'move NW should place the bishop on but-last top field'
    it 'move SE should place the bishop second row boarder'
    it 'move SW should place the bishop one field from corner'

  describe 'Walking from "c" field', ->
    it 'move SE should leave bishop unmoved'
    it 'move SW should place the bishop on but-last bottom field'
    it 'move NE should place the bishop but-last row boarder'
    it 'move NW should place the bishop one field from corner'

  describe 'Walking from "d" field', ->
    it 'move SW should leave bishop unmoved', ->
      b = new Board 3,3,6
      b.makeMove SW
      (''+b).should.equal ',,,,,,1,,'
      b.end.should.equal 6

    it 'move SE should place the bishop on second bottom field', ->
      b = new Board 3,3,6
      b.makeMove SE
      (''+b).should.equal ',,,,,,,1,'
      b.end.should.equal 7

    it 'move NW should place the bishop but-last row boarder', ->
      b = new Board 3,3,6
      b.makeMove NW
      (''+b).should.equal ',,,1,,,,,'
      b.end.should.equal 3

    it 'move NE should place the bishop one field from corner', ->
      b = new Board 3,3,6
      b.makeMove NE
      (''+b).should.equal ',,,,1,,,,'
      b.end.should.equal 4

  describe 'Walking from top boarder', ->
    it 'move NW should place the bishop one field left', ->
      b = new Board 3,3,1
      b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0

    it 'move NE should place the bishop one field right', ->
      b = new Board 3,3,1
      b.makeMove NE
      (''+b).should.equal ',,1,,,,,,'
      b.end.should.equal 2

    it 'move SW should place the bishop in correct field', ->
      b = new Board 3,3,1
      b.makeMove SW
      (''+b).should.equal ',,,1,,,,,'
      b.end.should.equal 3

    it 'move SE should place the bishop in correct field', ->
      b = new Board 3,3,1
      b.makeMove SE
      (''+b).should.equal ',,,,,1,,,'
      b.end.should.equal 5


  describe 'Walking from left boarder', ->
    it 'move NW should place the bishop one field up', ->
      b = new Board 3,3,3
      b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0

    it 'move NE should place the bishop in correct field', ->
      b = new Board 3,3,3
      b.makeMove NE
      (''+b).should.equal ',1,,,,,,,'
      b.end.should.equal 1

    it 'move SW should place the bishop one field down', ->
      b = new Board 3,3,3
      b.makeMove SW
      (''+b).should.equal ',,,,,,1,,'
      b.end.should.equal 6

    it 'move SE should place the bishop in correct field', ->
      b = new Board 3,3,3
      b.makeMove SE
      (''+b).should.equal ',,,,,,,1,'
      b.end.should.equal 7


  describe 'Walking from bottom boarder', ->
    it 'move SW should place the bishop one field left'
    it 'move SE should place the bishop one field right'
    it 'move NW should place the bishop in correct field'
    it 'move NE should place the bishop in correct field'

  describe 'Walking from right boarder', ->
    it 'move NE should place the bishop one field up', ->
      b = new Board 3,3,5
      b.makeMove NE
      (''+b).should.equal ',,1,,,,,,'
      b.end.should.equal 2

    it 'move SE should place the bishop one field down', ->
      b = new Board 3,3,5
      b.makeMove SE
      (''+b).should.equal ',,,,,,,,1'
      b.end.should.equal 8

    it 'move SW should place the bishop in correct field', ->
      b = new Board 3,3,5
      b.makeMove SW
      (''+b).should.equal ',,,,,,,1,'
      b.end.should.equal 7

    it 'move NW should place the bishop in correct field', ->
      b = new Board 3,3,5
      b.makeMove NW
      (''+b).should.equal ',1,,,,,,,'
      b.end.should.equal 1

