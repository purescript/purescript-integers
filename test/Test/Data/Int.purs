module Test.Data.Int (testInt) where

import Console (log)
import Data.Int
import Data.Maybe (Maybe(..))
import Test.Assert (assert)

testInt = do

  log "testing fromNumber"
  assert $ fromNumber 1.0 == 1
  assert $ fromNumber 42.0 == 42
  assert $ fromNumber 0.9 == 0
  assert $ fromNumber (-0.9) == 0
  assert $ fromNumber 0.0 == 0

  log "testing toNumber"
  assert $ toNumber 1 == 1.0
  assert $ toNumber (-1) == -1.0
  assert $ toNumber 0 == 0.0

  log "testing fromString"
  assert $ fromString "0" == Just 0
  assert $ fromString "9467" == Just 9467
  assert $ fromString "0.1" == Nothing
  assert $ fromString "2147483648" == Nothing

  log "testing even"
  assert $ even 0 == true
  assert $ even 1 == false
  assert $ even 2 == true
  assert $ even 3 == false

  log "testing odd"
  assert $ odd 0 == false
  assert $ odd 1 == true
  assert $ odd 2 == false
  assert $ odd 3 == true
