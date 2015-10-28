// View: ChatInput

"use strict";

import React from "react";
import Fluxxor from "fluxxor";

import {mix} from "./util";

var style = {
  input: {
    fontSize: 12
  },
  input_name: {
    width: 100
  },
  input_body: {
    width: 300
  }
};

export default React.createClass({
  mixins: [
    Fluxxor.FluxMixin(React)
  ],

  getInitialState: function(){
    return {
      name: 'NoName',
      body: 'hello!'
    }
  },

  render: function(){
    return (
      <div>
        <input
         type="text"
         onChange={this._onNameChange}
         value={this.state.name}
         style={mix(style.input, style.input_name)} />
        <input
         type="text"
         onChange={this._onBodyChange}
         onKeyDown={this._onKeyDown}
         value={this.state.body}
         style={mix(style.input, style.input_body)} />
        <input
         type="button"
         value="send"
         onClick={this._send}
         disabled={!this._hasValidNameAndBody()}
         style={style.input} />
      </div>
    );
  },

  _onNameChange: function(e){
    this.setState({
      name: e.target.value
    });
  },
  _onBodyChange: function(e){
    this.setState({
      body: e.target.value
    });
  },
  _hasValidNameAndBody: function(){
    return this.state.name && this.state.name.length > 0 &&
      this.state.body && this.state.body.length > 0;
  },
  _send: function(){
    if(!this._hasValidNameAndBody()) return;
    this.getFlux().actions.chat.send({
      name: this.state.name,
      body: this.state.body
    });
    this.setState({
      body: ''
    });
  },
  _onKeyDown: function(e){
    if(e.keyCode === 13){ // enter key
      this._send()
    }
  }
});
