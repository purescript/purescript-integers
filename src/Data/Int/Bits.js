// module Data.Int.Bits

export const and = function (n1) {
  return function (n2) {
    /* jshint bitwise: false */
    return n1 & n2;
  };
};

export const or = function (n1) {
  return function (n2) {
    /* jshint bitwise: false */
    return n1 | n2;
  };
};

export const xor = function (n1) {
  return function (n2) {
    /* jshint bitwise: false */
    return n1 ^ n2;
  };
};

export const shl = function (n1) {
  return function (n2) {
    /* jshint bitwise: false */
    return n1 << n2;
  };
};

export const shr = function (n1) {
  return function (n2) {
    /* jshint bitwise: false */
    return n1 >> n2;
  };
};

export const zshr = function (n1) {
  return function (n2) {
    /* jshint bitwise: false */
    return n1 >>> n2;
  };
};

export const complement = function (n) {
  /* jshint bitwise: false */
  return ~n;
};

export const zeroBits = 0;

export const bit = function (n) {
  return function (pos) {
    return (1 << pos);
  }
};

export const setBit = function (n) {
  return function (pos) {
    return n | (1 << pos);
  }
};

export const clearBit = function (n) {
  return function (pos) {
    const mask = ~(1 << pos);
    return n & mask;
  }
};

export const complementBit = function (n) {
  return function (pos) {
    return n ^ (1 << pos);
  }
};

export const testBit = function (n) {
  return function (pos) {
    return (n & (1 << pos)) === 0 ? 0 : 1;
  }
};
