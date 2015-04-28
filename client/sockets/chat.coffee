# Socket: chat

module.exports = (app) ->

  socket = app.socket
  flux   = app.flux

  flux.actions.socket.setStatus 'connecting..'

  socket.on 'connect', ->
    console.log 'connect'
    flux.actions.socket.setStatus 'connecting'

  socket.on 'disconnect', ->
    flux.actions.socket.setStatus 'disconnected'

  socket.on 'chat', (data) ->
    flux.actions.chatLog.add data
