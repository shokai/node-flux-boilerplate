// View: Main

"use strict";

import React from "react";
import Fluxxor from "fluxxor";

import ChatInput from "./chat_input.jsx";
import ChatLog from "./chat_log.jsx";

export default React.createClass({
  mixins: [
    Fluxxor.FluxMixin(React),
    Fluxxor.StoreWatchMixin("Chat", "Socket")
  ],

  getStateFromFlux: function(){
    return {
      chat:   this.getFlux().store("Chat").getState(),
      socket: this.getFlux().store("Socket").getState()
    }
  },

  render: function(){
    return (
      <div>
        <h1>{title}</h1>
        <div>socket.io: {this.state.socket.status}</div>
        <ChatInput />
        <ChatLog logs={this.state.chat.logs} />
      </div>
    );
  }
});
