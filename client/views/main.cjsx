## View: Main

React   = require 'react'
Fluxxor = require 'fluxxor'

ChatInput    = require './chat_input.cjsx'
ChatLog      = require './chat_log.cjsx'
SocketStatus = require './socket_status.cjsx'

module.exports = React.createClass
  mixins: [
    Fluxxor.FluxMixin React
    Fluxxor.StoreWatchMixin 'Chat', 'Socket'
  ]

  getStateFromFlux: ->
    chat:   @getFlux().store('Chat').getState()
    socket: @getFlux().store('Socket').getState()

  render: ->
    <div>
      <h1>{title}</h1>
      <SocketStatus
       status={@state.socket.status} />
      <ChatInput
       name={@state.chat.name}
       body={@state.chat.body} />
      <ChatLog
       logs={@state.chat.logs} />
    </div>
