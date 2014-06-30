mongoose = require 'mongoose'

module.exports = (app) ->

  messageSchema = new mongoose.Schema
    from: String
    body: String
    created_at:
      type: Date
      default: Date.now

  messageSchema.statics.latest = (num, callback) ->
    return @find {}
    .sort
      created_at: 'desc'
    .limit num
    .exec callback

  Message = mongoose.model 'Message', messageSchema
