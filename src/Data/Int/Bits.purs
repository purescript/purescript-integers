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

infixl 10 .&.
infixl 10 .|.
infixl 10 .^.

-- | Bitwise AND.
(.&.) :: Int -> Int -> Int
(.&.) = andImpl

foreign import andImpl :: Int -> Int -> Int

-- | Bitwise OR.
(.|.) :: Int -> Int -> Int
(.|.) = orImpl

foreign import orImpl :: Int -> Int -> Int

-- | Bitwise XOR.
(.^.) :: Int -> Int -> Int
(.^.) = xorImpl

foreign import xorImpl :: Int -> Int -> Int

-- | Bitwise shift left.
foreign import shl :: Int -> Int -> Int

-- | Bitwise shift right.
foreign import shr :: Int -> Int -> Int

-- | Bitwise zero-fill shift right.
foreign import zshr :: Int -> Int -> Int

-- | Bitwise NOT.
foreign import complement :: Int -> Int
