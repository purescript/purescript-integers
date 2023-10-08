-- | This module defines bitwise operations for the `Int` type.
module Data.Int.Bits
  ( and, (.&.)
  , or, (.|.)
  , xor, (.^.)
  , shl
  , shr
  , zshr
  , complement
  , zeroBits
  , bit
  , setBit
  , clearBit
  , complementBit
  , testBit
  ) where

-- | Bitwise AND.
foreign import and :: Int -> Int -> Int

infixl 10 and as .&.

-- | Bitwise OR.
foreign import or :: Int -> Int -> Int

infixl 10 or as .|.

-- | Bitwise XOR.
foreign import xor :: Int -> Int -> Int

infixl 10 xor as .^.

-- | Bitwise shift left.
foreign import shl :: Int -> Int -> Int

-- | Bitwise shift right.
foreign import shr :: Int -> Int -> Int

-- | Bitwise zero-fill shift right.
foreign import zshr :: Int -> Int -> Int

-- | Bitwise NOT.
foreign import complement :: Int -> Int

-- | zeroBits is the value with all bits unset.
zeroBits :: Int
zeroBits = 0

-- | bit i is a value with the i'th bit set and all other bits clear.
foreign import bit :: Int -> Int

-- | Set a bit
-- |
-- | ```purescript
-- | setBit 0 1 == 2
-- | ```
foreign import setBit :: Int -> Int -> Int

-- | Clear a bit
-- |
-- | ```purescript
-- | clearBit 7 1 == 5
-- | ```
foreign import clearBit :: Int -> Int -> Int 

-- | XOR a bit
-- |
-- | ```purescript
-- | complementBit 7 1 == 5
-- | complementBit 0 1 == 2
-- | ```
foreign import complementBit :: Int -> Int -> Int 

-- | Test a bit
-- |
-- | ```purescript
-- | testBit 0 1 == false
-- | testBit 7 1 == true
-- | ```
foreign import testBit :: Int -> Int -> Boolean
