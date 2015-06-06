module Data.Int
  ( fromNumber
  , toNumber
  , fromString
  , even
  , odd
  ) where

import Prelude

import Data.Int.Bits
import Data.Maybe (Maybe(..))

-- | Creates an `Int` from a `Number` value. If the value is not already an
-- | integer it is rounded towards zero (so both `0.9` and `-0.9` will become
-- | `Int 0`).
foreign import fromNumber :: Number -> Int

-- | Converts an `Int` value back into a `Number`. Any `Int` is a valid `Number`
-- | so there is no loss of precision with this function.
foreign import toNumber :: Int -> Number

fromString :: String -> Maybe Int
fromString = fromStringImpl Just Nothing

foreign import fromStringImpl :: (forall a. a -> Maybe a)
                              -> (forall a. Maybe a)
                              -> String -> Maybe Int

-- | Returns whether an `Int` is an even number.
-- |
-- | ``` purescript
-- | even 0 == true
-- | even 1 == false
-- | ```
even :: Int -> Boolean
even x = x .&. 1 == 0

-- | The negation of `even`.
-- |
-- | ``` purescript
-- | odd 0 == false
-- | odd 1 == false
-- | ```
odd :: Int -> Boolean
odd x = x .&. 1 /= 0
