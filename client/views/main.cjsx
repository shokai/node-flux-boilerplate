## View: Main

React   = require 'react'
Fluxxor = require 'fluxxor'

ChatInput    = require './chat_input.cjsx'
ChatLog      = require './chat_log.cjsx'

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
      <div>socket.io: {@state.socket.status}</div>
      <ChatInput />
      <ChatLog logs={@state.chat.logs} />
    </div>
