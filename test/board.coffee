should = require 'should'

describe 'The Board', ->
    describe 'Board printing', ->
        it 'board should have correct size'
        it 'each row should have the same length equals the board width'
        it 'EOL charactes should be handled independent from environment'
        it 'should print boarder around with chars +-|'
        it 'first row should contains header'
        it 'last row should contains footer'
        it 'no header is displayed if there is not enougth room for header text'
        it 'no footer is displayed if there is not enougth room for footer text'
        it 'start-symbol should be placed in the middle of the board'
        it 'end-symbol should appear instead of starting when walk ends in starting position'
    describe 'Board representation - state object', ->
        it 'board should be serialized to the state object'
        it 'state object should provide starting and ending position and cardinality of visited fields'
        it 'should be posible to load board from state object'
        it 'should be posible to add move to loaded board'
        it 'adding moves to board can change end-position no starting one'