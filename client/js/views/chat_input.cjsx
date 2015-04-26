## Component: ChatInput

React   = require 'react'
Fluxxor = require 'fluxxor'

module.exports = React.createClass
  mixins: [
    Fluxxor.FluxMixin React
  ]

  _onNameChange: (e) ->
    @getFlux().actions.chatInput.setName e.target.value

  _onBodyChange: (e) ->
    @getFlux().actions.chatInput.setBody e.target.value

  _onKeyDown: (e) ->
    if e.keyCode is 13 # enter key
      @getFlux().actions.chatInput.send()

  _onSendClick: (e) ->
    @getFlux().actions.chatInput.send()

  render: ->
    <div>
      <input
       type="text"
       onChange={@_onNameChange}
       value={@props.name} />
      <input
       type="text"
       onChange={@_onBodyChange}
       onKeyDown={@_onKeyDown}
       value={@props.body} />
      <input
       type="button"
       value="send"
       onClick={@_onSendClick}
       disabled={@props.name?.length is 0 or @props.body?.length is 0} />
    </div>

