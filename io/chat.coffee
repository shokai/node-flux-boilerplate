debug = require('debug')('chat:io')

module.exports = (app) ->
  io = app.get 'socket.io'

  io.on 'connection', (socket) ->
    debug 'new connection'

    socket.on 'chat', (data) ->
      debug data
      io.sockets.emit 'chat', data  # broadcast
      return
    
    io.sockets.emit 'chat', {
      from: "server"
      body: "hello new client (id:#{socket.id})"
    }

