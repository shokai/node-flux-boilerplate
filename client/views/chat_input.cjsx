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

  getInitialState: ->
    name: 'NoName'
    body: 'hello!'

  render: ->
    <div>
      <input
       type="text"
       onChange={@_onNameChange}
       value={@state.name}
       style={mix style.input, style.input_name} />
      <input
       type="text"
       onChange={@_onBodyChange}
       onKeyDown={@_onKeyDown}
       value={@state.body}
       style={mix style.input, style.input_body} />
      <input
       type="button"
       value="send"
       onClick={@_send}
       disabled={!@_hasValidNameAndBody()}
       style={style.input} />
    </div>

  _onNameChange: (e) ->
    @setState
      name: e.target.value

  _onBodyChange: (e) ->
    @setState
      body: e.target.value

  _hasValidNameAndBody: ->
    @state.name?.length > 0 and @state.body?.length > 0

  _send: ->
    return unless @_hasValidNameAndBody()
    @getFlux().actions.chat.send
      name: @state.name
      body: @state.body
    @setState
      body: ''

  _onKeyDown: (e) ->
    if e.keyCode is 13 # enter key
      @_send()
