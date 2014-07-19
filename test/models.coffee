﻿should = require 'should'

describe 'Representation objects', ->
    describe 'The Gravity object', ->
        it 'knows how to convert randomness to list of move directions'
        it 'one byte produces four directions'
        it 'gives NW,SE,NW,SE for byte 0xcc'    # 00,11,00,11
        it 'gives NE,SW,NE,SW for byte 0x99'    # 01,10,01,10 
        it 'gives SW,NE,SW,NE for byte 0x66'    # 10,01,10,01
        it 'gives SE,NW,SE,NW for byte 0x33'    # 11,00,11,00
        it 'gives NE,SE,SW,NW for byte 0x2d'    # 01,11,10,00
        it 'gives SE,SW,SE,SW for byte 0xbb'    # 11,10,11,10
        it 'gives SW,SE,SW,SE for byte 0xee'    # 10,11,10,11
        it 'gives NE,NW,NE,NW for byte 0x11'    # 01,00,01,00
        it 'gives NW,NE,NW,NE for byte 0x44'    # 00,01,00,01

    describe 'Walk representation - walklog object', ->
        it 'knows nothing about starting and ending positions'
        it 'represents only list of move directions'

    describe 'Board representation - state object', ->
        it 'board should be serialized to the state object'
        it 'state object should provide starting and ending position and cardinality of visited fields'
        it 'should be posible to load board from state object'
        it 'should be posible to add move to loaded board'
        it 'adding moves to board can change end-position no starting one'