export default function(app){

  "use strict";

  return {
    chat: {
      send: function(msg){
        app.socket.chat.send(msg);
      }
    },
    chatLog: {
      add: function(log){
        this.dispatch("add-chat-log", log);
      }
    },
    socket: {
      setStatus: function(status){
        this.dispatch("set-socket-status", status);
      }
    }
  };

};
