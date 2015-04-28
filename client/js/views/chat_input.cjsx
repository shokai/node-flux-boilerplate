## View: ChatInput

React   = require 'react'
Fluxxor = require 'fluxxor'

mix = require('./util').mix

style =
  input:
    fontSize: 12
  input_name:
    width: 100
  input_body:
    width: 300

module.exports = React.createClass
  mixins: [
    Fluxxor.FluxMixin React
  ]

  render: ->
    <div>
      <input
       type="text"
       onChange={@_onNameChange}
       value={@props.name}
       style={mix style.input, style.input_name} />
      <input
       type="text"
       onChange={@_onBodyChange}
       onKeyDown={@_onKeyDown}
       value={@props.body}
       style={mix style.input, style.input_body} />
      <input
       type="button"
       value="send"
       onClick={@_onSendClick}
       disabled={@props.name?.length is 0 or @props.body?.length is 0}
       style={style.input} />
    </div>

  _onNameChange: (e) ->
    @getFlux().actions.chatInput.setName e.target.value

  _onBodyChange: (e) ->
    @getFlux().actions.chatInput.setBody e.target.value

  _onKeyDown: (e) ->
    if e.keyCode is 13 # enter key
      @getFlux().actions.chatInput.send()

  _onSendClick: (e) ->
    @getFlux().actions.chatInput.send()

