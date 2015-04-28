## View: SocketStatus

React = require 'react'

module.exports = React.createClass

  render: ->
    <div>
      socket.io: {@props.status}
    </div>
