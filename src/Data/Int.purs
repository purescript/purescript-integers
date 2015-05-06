module Data.Int
  ( fromNumber
  , toNumber
  , even
  , odd
  ) where

import Data.Int.Bits

-- | Creates an `Int` from a `Number` value. If the value is not already an
-- | integer it is rounded towards zero (so both `0.9` and `-0.9` will become
-- | `Int 0`).
foreign import fromNumber
  """
  function fromNumber(n) {
    return n|0;
  }
  """ :: Number -> Int

-- | Converts an `Int` value back into a `Number`. Any `Int` is a valid `Number`
-- | so there is no loss of precision with this function.
foreign import toNumber
  """
  function toNumber(n) {
    return n;
  }
  """ :: Int -> Number

-- | Returns whether an `Int` is an even number.
-- |
-- |     even 0 == true
-- |     even 1 == false
even :: Int -> Boolean
even x = x .&. 1 == 0

-- | The negation of `even`.
-- |
-- |     odd 0 == false
-- |     odd 1 == false
odd :: Int -> Boolean
odd = not <<< even
