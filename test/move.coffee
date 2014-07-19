should = require 'should'

describe 'Walking on the board', ->
  describe 'Walking from starting position', ->
    it 'move NW should place the bishop in correct field'
    it 'move NE should place the bishop in correct field'
    it 'move SW should place the bishop in correct field'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from "a" field', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row left boarder'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from "b" field', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row boarder'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from "c" field', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row boarder'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from "d" field', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row boarder'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from top boarder', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row boarder'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from left boarder', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row boarder'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from bottom boarder', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row boarder'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from right boarder', ->
    it 'move NW should leave bishop unmoved'
    it 'move NE should place the bishop on second top field'
    it 'move SW should place the bishop second row boarder'
    it 'move SE should place the bishop in correct field'
