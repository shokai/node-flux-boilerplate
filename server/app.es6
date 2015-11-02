"use strict";

import path from "path";
var debug = require("debug")("chat:router");
import express from "express";
import mongoose from "mongoose";

// config
var config = require(path.resolve("config.json"));
var pkg = require(path.resolve("package.json"));
if(!process.env.PORT) process.env.PORT = 3000


// express modules
import cookieParser from "cookie-parser";
import session from "express-session";
var MongoStore = require("connect-mongo")(session);
import bodyParser from "body-parser";


// server setup
var router = express();
export default router;
router.disable("x-powered-by");
router.set("view engine", "jade");
router.set("views", path.join(__dirname, "views"));
router.use(express.static(path.resolve("public")));
router.use(cookieParser());
router.use(bodyParser.urlencoded({extended: true}));
router.use(bodyParser.json());

var http = require('http').Server(router);
var io = require('socket.io')(http);
router.set("socket.io", io);
router.set("config", config);
router.set("package", pkg);


// MongoDB
var mongodb_uri =
      process.env.MONGOLAB_URI ||
      process.env.MONGOHQ_URL ||
      "mongodb://localhost/flux-chat"

router.use(
  session({
    secret: (process.env.SESSION_SECRET || "うどん居酒屋 かずどん"),
    resave: false,
    saveUninitialized: true,
    store: new MongoStore({
      url: mongodb_uri
    })
  })
);

// load controllers, models, socket.io
var components = {
  models:      [ "message" ],
  controllers: [ "main" ],
  sockets:     [ "chat" ]
};

for(let type in components){
  let items = components[type];
  items.forEach(function(item){
    let path = `./${type}/${item}`;
    debug(`load ${path}`);
    require(path).default(router);
  });
}

mongoose.connect(mongodb_uri, function(err){
  if(err){
    console.error("mongoose connect failed");
    console.error(err);
    process.exit(1);
    return;
  }

  debug("connect MongoDB");

  if(process.argv[1] !== __filename){
    return;  // if load as a module, do not start HTTP server
  }

  // start server
  http.listen(process.env.PORT, function(){
    debug(`server start - port:${process.env.PORT}`);
  });
});
