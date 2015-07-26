module Data.Int
  ( fromNumber
  , ceil
  , floor
  , round
  , toNumber
  , fromString
  , even
  , odd
  ) where

import Prelude

import Data.Int.Bits
import Data.Maybe (Maybe(..))
import qualified Data.Maybe.Unsafe as U
import qualified Math as Math

-- | Creates an `Int` from a `Number` value. The number must already be an
-- | integer and fall within the valid range of values for the `Int` type
-- | otherwise `Nothing` is returned.
fromNumber :: Number -> Maybe Int
fromNumber = fromNumberImpl Just Nothing

foreign import fromNumberImpl :: (forall a. a -> Maybe a)
                              -> (forall a. Maybe a)
                              -> Number
                              -> Maybe Int

-- | Convert a `Number` to an `Int`, by taking the closest integer equal to or
-- | less than the argument. Values outside the `Int` range are clamped.
floor :: Number -> Int
floor = unsafeClamp <<< Math.floor

-- | Convert a `Number` to an `Int`, by taking the closest integer equal to or
-- | greater than the argument. Values outside the `Int` range are clamped.
ceil :: Number -> Int
ceil = unsafeClamp <<< Math.ceil

-- | Convert a `Number` to an `Int`, by taking the nearest integer to the
-- | argument. Values outside the `Int` range are clamped.
round :: Number -> Int
round = unsafeClamp <<< Math.round

-- | Convert an integral `Number` to an `Int`, by clamping to the `Int` range.
-- | This function will throw an error at runtime if the argument is
-- | non-integral.
unsafeClamp :: Number -> Int
unsafeClamp x
  | x >= toNumber (top :: Int)    = top
  | x <= toNumber (bottom :: Int) = bottom
  | otherwise                     = U.fromJust $ fromNumber x

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
