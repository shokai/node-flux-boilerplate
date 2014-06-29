socket = io.connect "#{location.protocol}//#{location.host}"

$ ->
  console.log "start"

socket.on 'connect', ->
  console.log "socket.io connect!!"
