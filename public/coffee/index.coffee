socket = io.connect "#{location.protocol}//#{location.host}"

chat_send = ->
  data =
    from: $('#input_name').val()
    body: $('#input_message').val()
  return if data.body?.length < 1 or data.from?.length < 1
  socket.emit 'chat', data
  $('#input_message').val('')

$ ->
  console.log 'start'
  $('#btn_send').click chat_send
  $('#input_message').keydown (e) ->
    return unless e.keyCode is 13
    chat_send()

socket.on 'connect', ->
  console.log 'socket.io connect!!'
  return

socket.on 'chat', (data) ->
  $('#logs').prepend $('<li>').text "#{data.from} : #{data.body}"
