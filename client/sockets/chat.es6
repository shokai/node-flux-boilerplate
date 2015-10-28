// Socket: chat

export default function(app){

  "use strict";

  var socket = app.socket.io;
  var flux   = app.flux;

  flux.actions.socket.setStatus("connecting..");

  // handle socket.io events
  socket.on("connect", function(){
    console.log("connect");
    flux.actions.socket.setStatus("connecting");
  });

  socket.on("disconnect", function(){
    flux.actions.socket.setStatus("disconnected");
  });

  socket.on("chat", function(data){
    flux.actions.chatLog.add(data);
  });


  // public methods for actions
  return {
    send: function(msg){
      if(!msg.body || msg.body.length < 1 ||
         !msg.name || msg.name.length < 1) return;

      socket.emit("chat", {
        from: msg.name,
        body: msg.body
      });
    }
  };
}

