module Data.Int
  ( fromNumber
  , toNumber
  ) where

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
