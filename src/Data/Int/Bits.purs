-- | This module defines bitwise operations for the `Int` type.
module Data.Int.Bits
  ( (.&.)
  , (.|.)
  , (.^.)
  , shl
  , shr
  , zshr
  , complement
  ) where

import Data.Int

infixl 10 .&.
infixl 10 .|.
infixl 10 .^.

-- | Bitwise AND.
(.&.) :: Int -> Int -> Int
(.&.) = andImpl

-- | Bitwise OR.
(.|.) :: Int -> Int -> Int
(.|.) = orImpl

-- | Bitwise XOR.
(.^.) :: Int -> Int -> Int
(.^.) = xorImpl

foreign import andImpl
  """
  function andImpl(n1) {
    return function(n2) {
      return n1 & n2;
    };
  }
  """ :: Int -> Int -> Int

foreign import orImpl
  """
  function orImpl(n1) {
    return function(n2) {
      return n1 | n2;
    };
  }
  """ :: Int -> Int -> Int

foreign import xorImpl
  """
  function xorImpl(n1) {
    return function(n2) {
      return n1 ^ n2;
    };
  }
  """ :: Int -> Int -> Int

-- | Bitwise shift left.
foreign import shl
  """
  function shl(n1) {
    return function(n2) {
      return n1 << n2;
    };
  }
  """ :: Int -> Int -> Int

-- | Bitwise shift right.
foreign import shr
  """
  function shr(n1) {
    return function(n2) {
      return n1 >> n2;
    };
  }
  """ :: Int -> Int -> Int

-- | Bitwise zero-fill shift right.
foreign import zshr
  """
  function zshr(n1) {
    return function(n2) {
      return n1 >>> n2;
    };
  }
  """ :: Int -> Int -> Int

-- | Bitwise NOT.
foreign import complement
  """
  function complement(n) {
    return ~n;
  }
  """ :: Int -> Int
