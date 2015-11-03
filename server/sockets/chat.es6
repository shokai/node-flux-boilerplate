var debug = require("debug")("chat:sockets");
import mongoose from "mongoose";

var Message = mongoose.model("Message");

export default function(router){

  "use strict";

  var io = router.get("socket.io");

  io.on("connection", function(socket){
    debug("new connection");

    socket.on("chat", function(data){
      debug(data);
      var message = new Message(data);
      message.save(function(err, data){
        if(err) return debug(err.toString());
        io.sockets.emit("chat", data); // broadcast
      });
    });

    io.sockets.emit("chat", {
      from: "server",
      body: `hello new client (ID:${socket.id})`
    });
  });
};
