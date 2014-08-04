should = require 'should'
RndArt = require '../build/random-art'

describe 'Random art entry point object', ->
  it 'should expose proper methods', ->
    (RndArt?).should.be.ok
    RndArt.get.should.be.a.Function
    RndArt.toRawBytes.should.be.a.Function
    RndArt.discoverFormat.should.be.a.Function

  describe 'Discovering format of string', ->
    it 'should discover HEX string'
    it 'should discover HEX string prepended with 0x'
    it 'should discover Base64 string'
    it 'should discover utf-8 string'

  describe 'Convertion to bytes', ->
    it 'should accept buffer object'
    it 'should convert HEX string to buffer'
    it 'should convert base64 string to buffer'
    it 'should convert any string to buffer (assumes utf-8 encoding)'
