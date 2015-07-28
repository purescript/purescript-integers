module Test.Data.Int (testInt) where

import Prelude

import Control.Monad.Eff.Console (log)
import Data.Int
import Data.Maybe (Maybe(..))
import Test.Assert (assert)

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

  log "fromString should read integers"
  assert $ fromString "0" == Just 0
  assert $ fromString "9467" == Just 9467
  assert $ fromString "-6" == Just (-6)

  log "fromString should fail to read floats"
  assert $ fromString "0.1" == Nothing

  log "fromString should fail to read integers outside of the int32 range"
  assert $ fromString "2147483648" == Nothing
  assert $ fromString "-2147483649" == Nothing

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
