# Socket: chat

module.exports = (app) ->

  socket = app.socket.io
  flux   = app.flux

  flux.actions.socket.setStatus 'connecting..'

  ## handle socket.io events
  socket.on 'connect', ->
    console.log 'connect'
    flux.actions.socket.setStatus 'connecting'

  socket.on 'disconnect', ->
    flux.actions.socket.setStatus 'disconnected'

  socket.on 'chat', (data) ->
    flux.actions.chatLog.add data


  ## public methods for actions
  send: (msg) ->
    return if msg.body?.length < 1 or msg.name?.length < 1
    socket.emit 'chat',
      from: msg.name
      body: msg.body
