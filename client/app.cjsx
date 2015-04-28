React   = require 'react'
Fluxxor = require 'fluxxor'
socket  = require('socket.io-client').connect "#{location.protocol}//#{location.host}"

app =
  socket:
    io: socket
  pkg: require '../package.json'

## flux = stores, actions
app.flux = new Fluxxor.Flux
  Chat:   new (require('./stores/chat')(app))
  Socket: new (require('./stores/socket')(app))
, require('./actions/actions')(app)

## Other Components
app.socket.chat = require('./sockets/chat')(app)

## View
View = require './views/main'

React.render <View flux={app.flux} />
, document.getElementById 'app-container'
