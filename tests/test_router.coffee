path = require 'path'
require path.resolve 'tests', 'test_helper'

assert   = require 'assert'
request  = require 'supertest'
mongoose = require 'mongoose'
app      = require path.resolve 'app.coffee'


describe 'Express Template (Chat App)', ->

  it 'sohuld have index page', (done) ->
    request app
    .get '/'
    .expect 200
    .expect 'Content-Type', /text/
    .end done


describe 'model "Message"', ->

  Message = mongoose.model 'Message'

  it 'should have method "latest"', ->
    assert.equal typeof Message['latest'], 'function'

  describe 'method "latest"', ->

    it 'should return latest chat messages', (done) ->

      Message.latest 10, (err, res) ->
        assert.equal res instanceof Array, true
        done()
