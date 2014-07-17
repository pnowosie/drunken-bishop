should = require 'should'

describe 'Board printing', ->
    it 'board should have correct size'
    it 'each row should have the same length equals the board width'
    it 'EOL charactes should be handled independent from environment'
    it 'should print boarder around with chars +-|'
    it 'first row should contains header'
    it 'last row should contains footer'
    it 'no header is displayed if there is not enougth room for header text'
    it 'no footer is displayed if there is not enougth room for footer text'
    