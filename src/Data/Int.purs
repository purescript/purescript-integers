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

-- | Creates an `Int` from a `Number` value. The number must already be an
-- | integer and fall within the valid range of values for the `Int` type
-- | otherwise `Nothing` is returned.
fromNumber :: Number -> Maybe Int
fromNumber = fromNumberImpl Just Nothing

foreign import fromNumberImpl :: (forall a. a -> Maybe a)
                              -> (forall a. Maybe a)
                              -> Number
                              -> Maybe Int

-- | Converts an `Int` value back into a `Number`. Any `Int` is a valid `Number`
-- | so there is no loss of precision with this function.
foreign import toNumber :: Int -> Number

-- | Reads an `Int` from a `String` value. The number must parse as an integer
-- | and fall within the valid range of values for the `Int` type, otherwise
-- | `Nothing` is returned.
fromString :: String -> Maybe Int
fromString = fromStringImpl Just Nothing

foreign import fromStringImpl :: (forall a. a -> Maybe a)
                              -> (forall a. Maybe a)
                              -> String
                              -> Maybe Int

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
