## Actions

module.exports = (app) ->

  chatInput:
    send: (chatData) ->
      @dispatch 'send-chat', chatData
      @dispatch 'clear-chat-body'

    setName: (name) ->
      @dispatch 'set-chat-name', name

    setBody: (body) ->
      @dispatch 'set-chat-body', body

  chatLog:
    add: (log) ->
      @dispatch 'add-chat-log', log

  socket:
    setStatus: (status) ->
      @dispatch 'set-socket-status', status
