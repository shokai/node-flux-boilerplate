url = process.argv[2] or "http://localhost:3000"
console.log url

socket = require('socket.io-client').connect url

socket.on 'connect', ->
  console.log "connect!! #{url}"

socket.on 'chat', (data) ->
  console.log "#{data.from} : #{data.body}"

process.stdin.setEncoding 'utf8'
process.stdin.on 'data', (data) ->
  data =
    from: 'cui'
    body: data.replace(/[\r\n]/g, '')
  socket.emit 'chat', data

