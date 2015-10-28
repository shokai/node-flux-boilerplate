// Store: Socket

"use strict";

import Fluxxor from "fluxxor";

export default function(app){

  return Fluxxor.createStore({

    initialize: function(){
      this.status = "unknown";
      this.bindActions("set-socket-status", this.setStatus);
    },
    getState: function(){
      return {
        status: this.status
      }
    },
    setStatus: function(status){
      this.status = status;
      this.emit("change");
    }

  });
};
