// Store: Chat

import Fluxxor from "fluxxor";

export default function(app){

  return Fluxxor.createStore({

    initialize: function(){
      this.logs = window.logs || [];
      this.bindActions("add-chat-log", this.addLog);
    },

    getState: function(){
      return {
        logs: this.logs
      }
    },

    addLog: function(log){
      if(!log._id) log._id = Date.now()  // for react-key
      this.logs.unshift(log);
      this.emit("change");
    }
  });

}
