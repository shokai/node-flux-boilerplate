## Component: App

React   = require 'react'
Fluxxor = require 'fluxxor'

ChatInput = require './chat_input.cjsx'
ChatLog   = require './chat_log.cjsx'

module.exports = React.createClass
  mixins: [
    Fluxxor.FluxMixin React
    Fluxxor.StoreWatchMixin 'ChatLog', 'ChatInput'
  ]

  getStateFromFlux: ->
    chatlog: @getFlux().store('ChatLog').getState()
    chatinput: @getFlux().store('ChatInput').getState()

  render: ->
    <div>
      <h1>{title}</h1>
      <ChatInput
        name={@state.chatinput.name}
        body={@state.chatinput.body} />
      <ChatLog
        logs={@state.chatlog.logs} />
    </div>
