# Socket: chat

module.exports = (app) ->

  socket = app.socket
  flux   = app.flux

  socket.on 'connect', ->
    console.log 'connect'

  socket.on 'chat', (data) ->
    flux.actions.chatLog.add data
