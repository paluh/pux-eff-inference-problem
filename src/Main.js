/* global exports */
"use strict";

// module Main

exports.push = function(url) {
  return function() {
    window.history.pushState({}, document.title, url);
  }
};
