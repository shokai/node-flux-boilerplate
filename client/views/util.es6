// View utilities

import _ from "lodash";

// mix objects
export function mix(){
  var args = Array.prototype.splice.call(arguments, 0);
  return _.assign.apply(this, [{}].concat(args));
}
