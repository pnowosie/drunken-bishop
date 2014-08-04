should = require 'should'
Board = require '../build/board'

describe 'Walking on the board', ->
  NW = 0; NE = 1; SW = 2; SE = 3
  describe 'Walking from starting position', ->
    it 'move NW should place the bishop in correct field', ->
      b = new Board 3,3
      p = b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0
      p.should.eql start: 4, direction: NW, x: 0, y: 0, end: 0, value: 1

    it 'move NE should place the bishop in correct field', ->
      b = new Board 3,3
      p = b.makeMove NE
      (''+b).should.equal ',,1,,,,,,'
      b.end.should.equal 2
      p.should.eql start: 4, direction: NE, x: 2, y: 0, end: 2, value: 1

    it 'move SW should place the bishop in correct field', ->
      b = new Board 3,3
      p = b.makeMove SW
      (''+b).should.equal ',,,,,,1,,'
      b.end.should.equal 6
      p.should.eql start: 4, direction: SW, x: 0, y: 2, end: 6, value: 1

    it 'move SE should place the bishop in correct field', ->
      b = new Board 3,3
      p = b.makeMove SE
      (''+b).should.equal ',,,,,,,,1'
      b.end.should.equal 8
      p.should.eql start: 4, direction: SE, x: 2, y: 2, end: 8, value: 1


  describe 'Walking from "a" field', ->
    it 'move NW should leave bishop unmoved', ->
      b = new Board 3,3,0
      p = b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0
      p.should.eql start: 0, direction: NW, x: 0, y: 0, end: 0, value: 1

    it 'move NE should place the bishop on second top field', ->
      b = new Board 3,3,0
      p = b.makeMove NE
      (''+b).should.equal ',1,,,,,,,'
      b.end.should.equal 1
      p.should.eql start: 0, direction: NE, x: 1, y: 0, end: 1, value: 1

    it 'move SW should place the bishop second row left boarder', ->
      b = new Board 3,3,0
      p = b.makeMove SW
      (''+b).should.equal ',,,1,,,,,'
      b.end.should.equal 3
      p.should.eql start: 0, direction: SW, x: 0, y: 1, end: 3, value: 1

    it 'move SE should place the bishop one field from corner', ->
      b = new Board 3,3,0
      p = b.makeMove SE
      (''+b).should.equal ',,,,1,,,,'
      b.end.should.equal 4
      p.should.eql start: 0, direction: SE, x: 1, y: 1, end: 4, value: 1

  describe 'Walking from "b" field', ->
    it 'move NE should leave bishop unmoved', ->
      b = new Board 3,3,2
      p = b.makeMove NE
      (''+b).should.equal ',,1,,,,,,'
      b.end.should.equal 2
      p.should.eql start: 2, direction: NE, x: 2, y: 0, end: 2, value: 1

    it 'move NW should place the bishop on but-last top field', ->
      b = new Board 3,3,2
      p = b.makeMove NW
      (''+b).should.equal ',1,,,,,,,'
      b.end.should.equal 1
      p.should.eql start: 2, direction: NW, x: 1, y: 0, end: 1, value: 1

    it 'move SE should place the bishop second row boarder', ->
      b = new Board 3,3,2
      p = b.makeMove SE
      (''+b).should.equal ',,,,,1,,,'
      b.end.should.equal 5
      p.should.eql start: 2, direction: SE, x: 2, y: 1, end: 5, value: 1

    it 'move SW should place the bishop one field from corner', ->
      b = new Board 3,3,2
      p = b.makeMove SW
      (''+b).should.equal ',,,,1,,,,'
      b.end.should.equal 4
      p.should.eql start: 2, direction: SW, x: 1, y: 1, end: 4, value: 1


  describe 'Walking from "d" field', ->
    it 'move SE should leave bishop unmoved', ->
      b = new Board 3,3,8
      p = b.makeMove SE
      (''+b).should.equal ',,,,,,,,1'
      b.end.should.equal 8
      p.should.eql start: 8, direction: SE, x: 2, y: 2, end: 8, value: 1

    it 'move SW should place the bishop on but-last bottom field', ->
      b = new Board 3,3,8
      p = b.makeMove SW
      (''+b).should.equal ',,,,,,,1,'
      b.end.should.equal 7
      p.should.eql start: 8, direction: SW, x: 1, y: 2, end: 7, value: 1

    it 'move NE should place the bishop but-last row boarder', ->
      b = new Board 3,3,8
      p = b.makeMove NE
      (''+b).should.equal ',,,,,1,,,'
      b.end.should.equal 5
      p.should.eql start: 8, direction: NE, x: 2, y: 1, end: 5, value: 1

    it 'move NW should place the bishop one field from corner', ->
      b = new Board 3,3,8
      p = b.makeMove NW
      (''+b).should.equal ',,,,1,,,,'
      b.end.should.equal 4
      p.should.eql start: 8, direction: NW, x: 1, y: 1, end: 4, value: 1


  describe 'Walking from "c" field', ->
    it 'move SW should leave bishop unmoved', ->
      b = new Board 3,3,6
      p = b.makeMove SW
      (''+b).should.equal ',,,,,,1,,'
      b.end.should.equal 6
      p.should.eql start: 6, direction: SW, x: 0, y: 2, end: 6, value: 1

    it 'move SE should place the bishop on second bottom field', ->
      b = new Board 3,3,6
      p = b.makeMove SE
      (''+b).should.equal ',,,,,,,1,'
      b.end.should.equal 7
      p.should.eql start: 6, direction: SE, x: 1, y: 2, end: 7, value: 1

    it 'move NW should place the bishop but-last row boarder', ->
      b = new Board 3,3,6
      p = b.makeMove NW
      (''+b).should.equal ',,,1,,,,,'
      b.end.should.equal 3
      p.should.eql start: 6, direction: NW, x: 0, y: 1, end: 3, value: 1

    it 'move NE should place the bishop one field from corner', ->
      b = new Board 3,3,6
      p = b.makeMove NE
      (''+b).should.equal ',,,,1,,,,'
      b.end.should.equal 4
      p.should.eql start: 6, direction: NE, x: 1, y: 1, end: 4, value: 1

  describe 'Walking from top boarder', ->
    it 'move NW should place the bishop one field left', ->
      b = new Board 3,3,1
      p = b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0
      p.should.eql start: 1, direction: NW, x: 0, y: 0, end: 0, value: 1

    it 'move NE should place the bishop one field right', ->
      b = new Board 3,3,1
      p = b.makeMove NE
      (''+b).should.equal ',,1,,,,,,'
      b.end.should.equal 2
      p.should.eql start: 1, direction: NE, x: 2, y: 0, end: 2, value: 1

    it 'move SW should place the bishop in correct field', ->
      b = new Board 3,3,1
      p = b.makeMove SW
      (''+b).should.equal ',,,1,,,,,'
      b.end.should.equal 3
      p.should.eql start: 1, direction: SW, x: 0, y: 1, end: 3, value: 1

    it 'move SE should place the bishop in correct field', ->
      b = new Board 3,3,1
      p = b.makeMove SE
      (''+b).should.equal ',,,,,1,,,'
      b.end.should.equal 5
      p.should.eql start: 1, direction: SE, x: 2, y: 1, end: 5, value: 1


  describe 'Walking from left boarder', ->
    it 'move NW should place the bishop one field up', ->
      b = new Board 3,3,3
      p = b.makeMove NW
      (''+b).should.equal '1,,,,,,,,'
      b.end.should.equal 0
      p.should.eql start: 3, direction: NW, x: 0, y: 0, end: 0, value: 1

    it 'move NE should place the bishop in correct field', ->
      b = new Board 3,3,3
      p = b.makeMove NE
      (''+b).should.equal ',1,,,,,,,'
      b.end.should.equal 1
      p.should.eql start: 3, direction: NE, x: 1, y: 0, end: 1, value: 1

    it 'move SW should place the bishop one field down', ->
      b = new Board 3,3,3
      p = b.makeMove SW
      (''+b).should.equal ',,,,,,1,,'
      b.end.should.equal 6
      p.should.eql start: 3, direction: SW, x: 0, y: 2, end: 6, value: 1

    it 'move SE should place the bishop in correct field', ->
      b = new Board 3,3,3
      p = b.makeMove SE
      (''+b).should.equal ',,,,,,,1,'
      b.end.should.equal 7
      p.should.eql start: 3, direction: SE, x: 1, y: 2, end: 7, value: 1


  describe 'Walking from bottom boarder', ->
    it 'move SW should place the bishop one field left', ->
      b = new Board 3,3,7
      p = b.makeMove SW
      (''+b).should.equal ',,,,,,1,,'
      b.end.should.equal 6
      p.should.eql start: 7, direction: SW, x: 0, y: 2, end: 6, value: 1

    it 'move SE should place the bishop one field right', ->
      b = new Board 3,3,7
      p = b.makeMove SE
      (''+b).should.equal ',,,,,,,,1'
      b.end.should.equal 8
      p.should.eql start: 7, direction: SE, x: 2, y: 2, end: 8, value: 1

    it 'move NW should place the bishop in correct field', ->
      b = new Board 3,3,7
      p = b.makeMove NW
      (''+b).should.equal ',,,1,,,,,'
      b.end.should.equal 3
      p.should.eql start: 7, direction: NW, x: 0, y: 1, end: 3, value: 1

    it 'move NE should place the bishop in correct field', ->
      b = new Board 3,3,7
      p = b.makeMove NE
      (''+b).should.equal ',,,,,1,,,'
      b.end.should.equal 5
      p.should.eql start: 7, direction: NE, x: 2, y: 1, end: 5, value: 1

  describe 'Walking from right boarder', ->
    it 'move NE should place the bishop one field up', ->
      b = new Board 3,3,5
      p = b.makeMove NE
      (''+b).should.equal ',,1,,,,,,'
      b.end.should.equal 2
      p.should.eql start: 5, direction: NE, x: 2, y: 0, end: 2, value: 1

    it 'move SE should place the bishop one field down', ->
      b = new Board 3,3,5
      p = b.makeMove SE
      (''+b).should.equal ',,,,,,,,1'
      b.end.should.equal 8
      p.should.eql start: 5, direction: SE, x: 2, y: 2, end: 8, value: 1

    it 'move SW should place the bishop in correct field', ->
      b = new Board 3,3,5
      p = b.makeMove SW
      (''+b).should.equal ',,,,,,,1,'
      b.end.should.equal 7
      p.should.eql start: 5, direction: SW, x: 1, y: 2, end: 7, value: 1

    it 'move NW should place the bishop in correct field', ->
      b = new Board 3,3,5
      p = b.makeMove NW
      (''+b).should.equal ',1,,,,,,,'
      b.end.should.equal 1
      p.should.eql start: 5, direction: NW, x: 1, y: 0, end: 1, value: 1

