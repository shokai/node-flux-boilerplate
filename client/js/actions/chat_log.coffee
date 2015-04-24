## Action: chatLog

module.exports = (app) ->

  add: (log) ->
    @dispatch 'add-chatlog', log
