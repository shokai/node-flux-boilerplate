## Action: chatInput

module.exports = (app) ->

  send: ->
    @dispatch 'send-chatinput'
    @dispatch 'clear-chatinput-body'

  setName: (name) ->
    @dispatch 'set-chatinput-name', name

  setBody: (body) ->
    @dispatch 'set-chatinput-body', body
