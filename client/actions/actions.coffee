## Actions

module.exports = (app) ->

  socket = app.socket

  chat:
    send: (msg) ->
      return if msg.body?.length < 1 or msg.name?.length < 1
      socket.emit 'chat',
        from: msg.name
        body: msg.body

  chatLog:
    add: (log) ->
      @dispatch 'add-chat-log', log

  socket:
    setStatus: (status) ->
      @dispatch 'set-socket-status', status
