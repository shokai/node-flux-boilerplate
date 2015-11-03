import mongoose from "mongoose";

export default function(router){

  "use strict";

  var messageSchema = new mongoose.Schema({
    from: {
      type: String,
      validate: [
        function(v){ return v && v.length > 0 },
        "Invalid Name"
      ]
    },
    body: {
      type: String,
      validate: [
        function(v){ return v && v.length > 0 },
        "Invalid Body"
      ]
    },
    created_at: {
      type: Date,
      default: Date.now
    }
  });

  messageSchema.statics.latest = function(num, callback){
    return this.find({})
      .sort({
        created_at: "desc"
      })
      .limit(num)
      .exec(callback);
  };

  mongoose.model("Message", messageSchema);
};
