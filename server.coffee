path     = require 'path'
debug    = require('debug')('chat:app')
express  = require 'express'
mongoose = require 'mongoose'


## config ##
config       = require path.resolve 'config.json'
package_json = require path.resolve 'package.json'
process.env.PORT ||= 3000


## server setup ##
app = express()
app.set 'view engine', 'jade'
app.use express.static path.resolve 'public'
app.set 'config', config
app.set 'package', package_json


## MongoDB ##
mongodb_uri = process.env.MONGOLAB_URI or
              process.env.MONGOHQ_URL or
              'mongodb://localhost/express-template'

mongoose.connect mongodb_uri, (err) ->
  if err
    console.error "mongoose connect failed"
    console.error err
    process.exit 1

  ## load controllers & models ##
  for name in ['message']
    require path.resolve 'models', name
  for name in ['main']
    require(path.resolve 'controllers', name)(app)

  ## start server ##
  server = app.listen process.env.PORT
  debug "server start - port:#{process.env.PORT}"

  ## Socket.IO ##
  io = require('socket.io').listen server
  app.set 'socket.io', io

  for name in ['chat']
    require(path.resolve 'sockets', name)(app)
