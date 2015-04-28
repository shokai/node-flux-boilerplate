## Actions

module.exports = (app) ->

  socket = app.socket

  chat:
    send: (msg) ->
      app.socket.chat.send msg

  chatLog:
    add: (log) ->
      @dispatch 'add-chat-log', log

  socket:
    setStatus: (status) ->
      @dispatch 'set-socket-status', status
