module Data.Int
  ( Int()
  , fromNumber
  , toNumber
  ) where

-- | A 32 bit integer.
newtype Int = Int Number

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
toNumber :: Int -> Number
toNumber (Int n) = n

instance showInt :: Show Int where
  show (Int n) = "fromNumber " ++ show n

instance eqInt :: Eq Int where
  (==) (Int x) (Int y) = x == y
  (/=) (Int x) (Int y) = x /= y

instance ordInt :: Ord Int where
  compare (Int x) (Int y) = compare x y

instance semiringInt :: Semiring Int where
  (+) = intAdd
  zero = Int 0
  (*) = intMul
  one = Int 1

instance moduloSemiringInt :: ModuloSemiring Int where
  (/) = intDiv
  mod = intMod

instance ringInt :: Ring Int where
  (-) = intSub

foreign import intAdd
  """
  function intAdd(x) {
    return function(y) {
      return (x + y)|0;
    };
  }
  """ :: Int -> Int -> Int

foreign import intMul
  """
  function intMul(x) {
    return function(y) {
      return (x * y)|0;
    };
  }
  """ :: Int -> Int -> Int

foreign import intDiv
  """
  function intDiv(x) {
    return function(y) {
      return (x / y)|0;
    };
  }
  """ :: Int -> Int -> Int

foreign import intMod
  """
  function intMod(x) {
    return function(y) {
      return x % y;
    };
  }
  """ :: Int -> Int -> Int

foreign import intSub
  """
  function intSub(x) {
    return function(y) {
      return (x - y)|0;
    };
  }
  """ :: Int -> Int -> Int
