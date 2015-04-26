## Store: Chat

Fluxxor = require 'fluxxor'

module.exports = (app) ->

  socket = app.socket

  Fluxxor.createStore

    initialize: ->
      @name = 'NoName'
      @body = 'hello!'
      @logs = window.logs or []

      @bindActions 'set-chat-name', @setName
      @bindActions 'set-chat-body', @setBody
      @bindActions 'send-chat', @send
      @bindActions 'clear-chat-body', => @setBody ''
      @bindActions 'add-chat-log', @addLog

    getState: ->
      name: @name
      body: @body
      logs: @logs

    setName: (@name = '') -> @emit 'change'

    setBody: (@body = '') -> @emit 'change'

    addLog: (log) ->
      log._id ||= Date.now()
      @logs.unshift log
      @emit 'change'

    send: (chatData) ->
      body = chatData?.body or @body
      from = chatData?.name or @name
      return if body.length < 1 or from.length < 1
      socket.emit 'chat',
        from: from
        body: body
