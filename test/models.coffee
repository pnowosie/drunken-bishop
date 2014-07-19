should = require 'should'
gravity = require '../src/gravity'

describe 'Representation objects', ->
    describe 'The Gravity object', ->
        NW = 0; NE = 1; SW = 2; SE = 3        

        it 'knows how to convert randomness to list of move directions', ->
            (gravity?).should.be.ok
            gravity.should.be.type('object')
            gravity.getWalk.should.be.a.Function
            
        it 'one byte produces four directions', ->
            gravity.getWalk(0x2d).should.be.an.Array.and.have.lengthOf(4);

        it 'gives NW,SE,NW,SE for byte 0xcc', ->    # 00,11,00,11
            gravity.getWalk(0xcc).should.equal([NW,SE,NW,SE])

        it 'gives NE,SW,NE,SW for byte 0x99', ->    # 01,10,01,10 
            gravity.getWalk(0x99).should.equal([NE,SW,NE,SW])

        it 'gives SW,NE,SW,NE for byte 0x66', ->    # 10,01,10,01
            gravity.getWalk(0x66).should.equal([SW,NE,SW,NE])

        it 'gives SE,NW,SE,NW for byte 0x33', ->    # 11,00,11,00
            gravity.getWalk(0x33).should.equal([SE,NW,SE,NW])

        it 'gives NE,SE,SW,NW for byte 0x2d', ->    # 01,11,10,00
            gravity.getWalk(0x2d).should.equal([NE,SE,SW,NW])

        it 'gives SE,SW,SE,SW for byte 0xbb', ->    # 11,10,11,10
            gravity.getWalk(0xbb).should.equal([SE,SW,SE,SW])

        it 'gives SW,SE,SW,SE for byte 0xee', ->    # 10,11,10,11
            gravity.getWalk(0xee).should.equal([SW,SE,SW,SE])

        it 'gives NE,NW,NE,NW for byte 0x11', ->    # 01,00,01,00
            gravity.getWalk(0x11).should.equal([NE,NW,NE,NW])

        it 'gives NW,NE,NW,NE for byte 0x44', ->    # 00,01,00,01
            gravity.getWalk(0x44).should.equal([NW,NE,NW,NE])

    describe 'Walk representation - walklog object', ->
        it 'knows nothing about starting and ending positions'
        it 'represents only list of move directions'

    describe 'Board representation - state object', ->
        it 'board should be serialized to the state object'
        it 'state object should provide starting and ending position and cardinality of visited fields'
        it 'should be posible to load board from state object'
        it 'should be posible to add move to loaded board'
        it 'adding moves to board can change end-position no starting one'