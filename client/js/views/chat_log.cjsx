## View: ChatLog

React = require 'react'

module.exports = React.createClass

  render: ->
    logs = @props.logs.map (i) ->
      <li key={i._id}>{i.from} : {i.body}</li>
    <ul>{logs}</ul>
