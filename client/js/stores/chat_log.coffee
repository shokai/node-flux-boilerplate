## Store: ChatLog

Fluxxor = require 'fluxxor'

module.exports = (app) ->

  Fluxxor.createStore

    initialize: ->
      @logs = window.logs
      @bindActions 'add-chatlog', @add

    getState: ->
      logs: @logs

    add: (log) ->
      log._id ||= Date.now()
      @logs.unshift log
      @emit 'change'
