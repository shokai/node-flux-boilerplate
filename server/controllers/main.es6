var debug = require("debug")('chat:controller:main');
import mongoose from "mongoose";
var Message = mongoose.model("Message");

export default function(router){

  "use strict";

  var config = router.get("config");
  var pkg = router.get("package");

  router.get("/", (req, res) => {
    Message.latest(100, (err, msgs) => {
      if(err){
        debug(err);
        return res.status(500).end("server error");
      }

      var args = {
        title: config.title,
        chat: {
          messages: msgs
        },
        app: {
          homepage: pkg.homepage
        },
        description: pkg.description
      };

      return res.render("index", args);
    });
  });

};
