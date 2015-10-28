"use strict";

var url = process.argv[2] || "http://localhost:3000"
console.log(url);

import SocketIO from "socket.io-client";

var socket = SocketIO.connect(url);

socket.on("connect", function(){
  console.log(`connect!! ${url}`);
});


socket.on("chat", function(data){
  console.log(`${data.from} : ${data.body}`);
});

process.stdin.setEncoding("utf8");

process.stdin.on("data", function(data){
  var data = {
    from: "cui",
    body: data.replace(/[\r\n]/g, "")
  };
  socket.emit("chat", data);
});
