util     = require 'util'
debug    = require('debug')('chat:controller:main')
mongoose = require 'mongoose'
Message  = mongoose.model 'Message'

module.exports = (app) ->

  config       = app.get 'config'
  package_json = app.get 'package'

  app.get '/', (req, res) ->
    Message.latest 100, (err, msgs) ->
      if err
        debug err
        return res.status(500).end "server error"

      args =
        title: config.title
        messages: msgs
        app:
          url: "#{req.protocol}://#{req.headers.host}"
          homepage: package_json.homepage

      return res.render 'index', args
