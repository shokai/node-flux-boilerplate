"use strict";

import React from "react";
import ReactDOM from "react-dom";
import Fluxxor from "fluxxor";
import SocketIO from "socket.io-client";

var socket = SocketIO.connect(`${location.protocol}//${location.host}`);

var app = {
  socket: {
    io: socket
  },
  pkg: require("../package.json")
};

// flux = stores, actions
app.flux = new Fluxxor.Flux({
  Chat:   new (require("./stores/chat").default(app)),
  Socket: new (require("./stores/socket").default(app))
}, require("./actions/actions").default(app));

// Other Components
app.socket.chat = require("./sockets/chat").default(app);

// View
var View = require("./views/main");

ReactDOM.render(
    <View flux={app.flux} />
    , document.getElementById("app-container")
);
