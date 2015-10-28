// View: ChatLog

"use strict";

import React from "react";

export default React.createClass({

  render: function(){
    var logs = this.props.logs.map(function(i){
      return <li key={i._id}>{i.from} : {i.body}</li>
    });
    return <ul>{logs}</ul>;
  }

});
