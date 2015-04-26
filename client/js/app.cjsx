React   = require 'react'
Fluxxor = require 'fluxxor'
socket  = require('socket.io-client').connect "#{location.protocol}//#{location.host}"

app =
  socket: socket
  pkg: require '../../package.json'

app.flux = new Fluxxor.Flux {
  ChatLog:   new (require('./stores/chat_log')(app))
  ChatInput: new (require('./stores/chat_input')(app))
}, {
  chatLog:   require('./actions/chat_log')(app)
  chatInput: require('./actions/chat_input')(app)
}

require('./sockets/chat')(app)

View = require './views/main'

React.render <View flux={app.flux} />
, document.getElementById 'app-container'
