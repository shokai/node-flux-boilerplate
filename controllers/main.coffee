debug    = require('debug')('chat:controller:main')
mongoose = require 'mongoose'
Message  = mongoose.model 'Message'

module.exports = (router) ->

  config = router.get 'config'
  pkg    = router.get 'package'

  router.get '/', (req, res) ->
    Message.latest 100, (err, msgs) ->
      if err
        debug err
        return res.status(500).end "server error"

      args =
        title: config.title
        chat:
          messages: msgs
        app:
          homepage: pkg.homepage

      return res.render 'index', args
