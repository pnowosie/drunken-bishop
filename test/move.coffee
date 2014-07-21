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
    it 'move SE should place the bishop one field from corner'

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
    it 'move SW should leave bishop unmoved'
    it 'move SE should place the bishop on second bottom field'
    it 'move NW should place the bishop but-last row boarder'
    it 'move NE should place the bishop one field from corner'

  describe 'Walking from top boarder', ->
    it 'move NW should place the bishop one field left'
    it 'move NE should place the bishop one field right'
    it 'move SW should place the bishop in correct field'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from left boarder', ->
    it 'move NW should place the bishop one field up'
    it 'move NE should place the bishop in correct field'
    it 'move SW should place the bishop one field down'
    it 'move SE should place the bishop in correct field'

  describe 'Walking from bottom boarder', ->
    it 'move SW should place the bishop one field left'
    it 'move SE should place the bishop one field right'
    it 'move NW should place the bishop in correct field'
    it 'move NE should place the bishop in correct field'

  describe 'Walking from right boarder', ->
    it 'move NE should place the bishop one field up'
    it 'move SE should place the bishop one field down'
    it 'move SW should place the bishop in correct field'
    it 'move NW should place the bishop in correct field'
