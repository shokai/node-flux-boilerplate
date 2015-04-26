## Store: ChatInput

Fluxxor = require 'fluxxor'

module.exports = (app) ->

  socket = app.socket

  Fluxxor.createStore

    initialize: ->
      @name = 'NoName'
      @body = 'hello!'
      @bindActions 'set-chatinput-name', @setName
      @bindActions 'set-chatinput-body', @setBody
      @bindActions 'send-chatinput', @send
      @bindActions 'clear-chatinput-body', => @setBody ''

    getState: ->
      name: @name
      body: @body

    setName: (@name) -> @emit 'change'

    setBody: (@body) -> @emit 'change'

    send: ->
      return if @body.length < 1 or @name.length < 1
      socket.emit 'chat',
        from: @name
        body: @body
