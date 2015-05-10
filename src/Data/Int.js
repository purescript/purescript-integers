/* global exports */
"use strict";

// module Data.Int

exports.fromNumber = function (n) {
  /* jshint bitwise: false */
  return n | 0;
};

exports.toNumber = function (n) {
  return n;
};

exports.fromStringImpl = function (just) {
  return function (nothing) {
    return function (s) {
      /* jshint bitwise: false */
      var i = parseFloat(s);
      return (i | 0) === i ? just(i) : nothing;
    };
  };
};
