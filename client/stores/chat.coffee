## Store: Chat

Fluxxor = require 'fluxxor'

module.exports = (app) ->

  Fluxxor.createStore

    initialize: ->
      @logs = window.logs or []
      @bindActions 'add-chat-log', @addLog

    getState: ->
      logs: @logs

    addLog: (log) ->
      log._id ||= Date.now()
      @logs.unshift log
      @emit 'change'
