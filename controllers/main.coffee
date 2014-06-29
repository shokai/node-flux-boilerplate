util     = require 'util'
debug    = require('debug')('chat:controller:main')
mongoose = require 'mongoose'

module.exports = (app) ->

  config       = app.get 'config'
  package_json = app.get 'package'

  app.get '/', (req, res) ->
    args =
      title: config.title
      app:
        url: "#{req.protocol}://#{req.headers.host}"
        homepage: package_json.homepage

    return res.render 'index', args
