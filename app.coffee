'use strict'

path     = require 'path'
debug    = require('debug')('chat:router')
express  = require 'express'
mongoose = require 'mongoose'

## config ##
config = require path.resolve 'config.json'
pkg    = require path.resolve 'package.json'
process.env.PORT ||= 3000


## express modules
cookieParser = require 'cookie-parser'
session      = require 'express-session'
MongoStore   = require('connect-mongo')(session)
bodyParser   = require 'body-parser'


## server setup ##
module.exports = router = express()
router.disable 'x-powered-by'
router.set 'view engine', 'jade'
router.use express.static path.resolve 'public'
router.use cookieParser()
router.use bodyParser.urlencoded(extended: true)
router.use bodyParser.json()

http = require('http').Server(router)
io = require('socket.io')(http)
router.set 'socket.io', io
router.set 'config', config
router.set 'package', pkg


## MongoDB ##
mongodb_uri = process.env.MONGOLAB_URI or
              process.env.MONGOHQ_URL or
              'mongodb://localhost/express-template'

router.use session
  secret: (process.env.SESSION_SECRET or 'うどん居酒屋 かずどん')
  resave: false
  saveUninitialized: true
  store: new MongoStore
    url: mongodb_uri


## load controllers, models, socket.io ##
components =
  models:      [ 'message' ]
  controllers: [ 'main' ]
  sockets:     [ 'chat' ]

for type, items of components
  for item in items
    debug "load #{type}/#{item}"
    require(path.resolve type, item)(router)


mongoose.connect mongodb_uri, (err) ->
  if err
    console.error "mongoose connect failed"
    console.error err
    process.exit 1
    return

  debug "connect MongoDB"

  if process.argv[1] isnt __filename
    return   # if load as a module, do not start HTTP server

  ## start server ##
  http.listen process.env.PORT, ->
    debug "server start - port:#{process.env.PORT}"
