should = require 'should'
RndArt = require '../build/random-art'

describe 'Random art entry point object', ->
  it 'should expose proper methods', ->
    (RndArt?).should.be.ok
    RndArt.get.should.be.a.Function
    RndArt.toRawBytes.should.be.a.Function
    RndArt.discoverFormat.should.be.a.Function

  describe 'Discovering format of string', ->
    it 'should discover HEX string', ->
      'hex'.should.equal RndArt.discoverFormat 'a0'

    it 'should discover HEX string prepended with 0x', ->
      'hex'.should.equal RndArt.discoverFormat '0xa0'

    it 'should discover Base64 string', ->
      'base64'.should.equal RndArt.discoverFormat '0xabe1=='

    it 'should discover utf-8 string', ->
      'utf8'.should.equal RndArt.discoverFormat 'Ala ma kota'

    it 'should discover utf-8 string if string is short', ->
      'utf8'.should.equal RndArt.discoverFormat 'q=='

  describe 'Convertion to bytes', ->
    it 'should convert HEX string to buffer', ->
      (new Buffer [ 0x1e, 0x00, 0x0a ]).should.eql RndArt.toRawBytes '1e000a'

    it 'should convert base64 string to buffer', ->
      (new Buffer 'faceb00c', 'hex').should.eql RndArt.toRawBytes '+s6wDA=='

    it 'should convert any string to buffer (assumes utf-8 encoding)', ->
      (new Buffer [ 65, 108, 97, 32, 109, 97, 32, 107, 111, 116, 97 ])
        .should.eql RndArt.toRawBytes 'Ala ma kota'
