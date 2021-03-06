"use strict";

import test from "./test_helper";
import assert from "assert";
import request from "supertest";
import mongoose from "mongoose";
import app from "../server/app"


describe("Server", function(){

  it("sohuld have index page", function(done){
    request(app)
      .get("/")
      .expect(200)
      .expect("Content-Type", /text/)
      .end(done);
  });

});

describe("model \"Message\"", function(){

  var Message = mongoose.model("Message");

  it("should have method \"latest\"", function(){
    assert.equal(typeof Message["latest"], "function");
  });

  describe("method \"latest\"", function(){

    it("should return latest chat messages", function(done){
      Message.latest(10, function(err, res){
        assert.equal(res instanceof Array, true);
        done();
      });
    });
  });

  describe("method \"save\"", function(){

    it("should not save empty \"name\"", function(done){
      var msg = new Message({from: "", body: "hi"});
      msg.save(function(err, data){
        assert.equal(!err, false);
        done();
      });
    });

    it("should not save empty \"body\"", function(done){
      var msg = new Message({from: "shokai", body: ""});
      msg.save(function(err, data){
        assert.equal(!err, false);
        done();
      });
    });

  });
});
