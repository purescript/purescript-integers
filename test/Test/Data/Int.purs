module Test.Data.Int (testInt) where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Data.Int (odd, even, fromString, floor, ceil, round, toNumber, fromNumber, fromStringAs, binary, octal, hexadecimal, radix, toStringAs, pow)
import Data.Maybe (Maybe(..), fromJust)

import Global (nan, infinity)

import Partial.Unsafe (unsafePartial)

import Test.Assert (ASSERT, assert)

testInt :: Eff (console :: CONSOLE, assert :: ASSERT) Unit
testInt = do

  log "fromNumber should coerce integer values"
  assert $ fromNumber 1.0 == Just 1
  assert $ fromNumber 42.0 == Just 42
  assert $ fromNumber 0.0 == Just 0

  log "fromNumber should fail on float inputs"
  assert $ fromNumber 0.9 == Nothing
  assert $ fromNumber (-0.9) == Nothing

  log "toNumber should coerce any integer to a number"
  assert $ toNumber 1 == 1.0
  assert $ toNumber (-1) == -1.0
  assert $ toNumber 0 == 0.0

  log "round should choose the closest integer"
  assert $ round 0.3 == 0
  assert $ round 0.7 == 1

  log "ceil should round up"
  assert $ ceil 0.3 == 1
  assert $ ceil 0.7 == 1

  log "floor should round down"
  assert $ floor 0.3 == 0
  assert $ floor 0.7 == 0

  log "round, ceil, and floor should clamp values outside the Int range"
  let testClamping f = do
        let low = toNumber bottom - 1.5
        assert $ f low == bottom

        let high = toNumber top + 1.5
        assert $ f high == top

  testClamping round
  testClamping ceil
  testClamping floor


  log "round, ceil, and floor should return 0 for NaN and Infinities"
  let testNonNumber f = do
        assert $ f nan == 0
        assert $ f infinity == 0

  testNonNumber round
  testNonNumber ceil
  testNonNumber floor

  log "fromString should read integers"
  assert $ fromString "0" == Just 0
  assert $ fromString "9467" == Just 9467
  assert $ fromString "-6" == Just (-6)
  assert $ fromString "+6" == Just 6

  log "fromString should fail to read floats"
  assert $ fromString "0.1" == Nothing
  assert $ fromString "42.000000000000001" == Nothing

  log "fromString should fail to read integers outside of the int32 range"
  assert $ fromString "2147483648" == Nothing
  assert $ fromString "-2147483649" == Nothing

  log "fromString should fail to read strings with other non-integer values"
  assert $ fromString "" == Nothing
  assert $ fromString "a" == Nothing
  assert $ fromString "5a" == Nothing
  assert $ fromString "42,12" == Nothing

  log "fromStringAs should read integers in different bases"
  assert $ fromStringAs binary "100" == Just 4
  assert $ fromStringAs hexadecimal "100" == Just 256
  assert $ fromStringAs hexadecimal "EF" == Just 239
  assert $ fromStringAs hexadecimal "+ef" == Just 239
  assert $ fromStringAs hexadecimal "-ef" == Just (-239)
  assert $ fromStringAs hexadecimal "+7fffffff" == Just 2147483647
  assert $ fromStringAs hexadecimal "-80000000" == Just (-2147483648)
  assert $ fromStringAs binary "10" == Just 2
  assert $ fromStringAs (unsafePartial $ fromJust $ radix 3) "10" == Just 3
  assert $ fromStringAs (unsafePartial $ fromJust $ radix 11) "10" == Just 11
  assert $ fromStringAs (unsafePartial $ fromJust $ radix 12) "10" == Just 12
  assert $ fromStringAs (unsafePartial $ fromJust $ radix 36) "10" == Just 36

  log "fromStringAs should fail on unknown digits"
  assert $ fromStringAs binary "12" == Nothing
  assert $ fromStringAs octal "8" == Nothing
  assert $ fromStringAs hexadecimal "1g" == Nothing

  log "toStringAs should transform to a different base"
  assert $ toStringAs hexadecimal 255 == "ff"
  assert $ toStringAs binary 4 == "100"
  assert $ toStringAs binary (-4) == "-100"
  assert $ toStringAs hexadecimal 2147483647 == "7fffffff"

  log "zero is even"
  assert $ even 0 == true

  log "even numbers are even"
  assert $ even 2 == true
  assert $ even 4 == true
  assert $ even 100 == true

  log "odd numbers are not even"
  assert $ even 1 == false
  assert $ even 3 == false
  assert $ even 73 == false

  log "zero is not odd"
  assert $ odd 0 == false

  log "odd numbers are odd"
  assert $ odd 1 == true
  assert $ odd 3 == true
  assert $ odd 73 == true

  log "even numbers are not odd"
  assert $ odd 2 == false
  assert $ odd 4 == false
  assert $ odd 100 == false

  log "pow"
  assert $ pow 2 2 == 4
  assert $ pow 5 3 == 125
  assert $ pow 26 0 == 1
  assert $ pow 0 32 == 0
  assert $ pow 2 (-1) == 0
  assert $ pow 1 (-2) == 1
  assert $ pow 2 (-2) == 0
  assert $ pow (-2) (-2) == 0
  assert $ pow (-2) 2 == 4
  assert $ pow (-2) 3 == (-8)
