debug    = require('debug')('chat:io')
mongoose = require 'mongoose'

Message = mongoose.model 'Message'

module.exports = (app) ->
  io = app.get 'socket.io'

  io.on 'connection', (socket) ->
    debug 'new connection'

    socket.on 'chat', (data) ->
      debug data
      message = new Message data
      message.save (err) ->
        debug err if err
      io.sockets.emit 'chat', data  # broadcast
      return

    io.sockets.emit 'chat', {
      from: "server"
      body: "hello new client (id:#{socket.id})"
    }

