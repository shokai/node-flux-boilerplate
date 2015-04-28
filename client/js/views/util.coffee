## View utilities

_ = require 'lodash'

module.exports =

  ## mix objects
  mix: ->
    args = Array.prototype.splice.call arguments, 0
    _.assign.apply @, [{}].concat args
