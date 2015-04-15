# Module Documentation

## Module Data.Int

#### `Int`

``` purescript
newtype Int
```

A 32 bit integer.

#### `fromNumber`

``` purescript
fromNumber :: Number -> Int
```

Creates an `Int` from a `Number` value. If the value is not already an
integer it is rounded towards zero (so both `0.9` and `-0.9` will become
`Int 0`).

#### `toNumber`

``` purescript
toNumber :: Int -> Number
```

Converts an `Int` value back into a `Number`. Any `Int` is a valid `Number`
so there is no loss of precision with this function.

#### `toString`

``` purescript
toString :: Int -> String
```

Creates a `String` value from an `Int`. This differs from the `Show`
instance as, for example, an `Int` value of 42 will be rendered as `"42"`
by `toString`, whereas with `show` it would be rendered as
`"fromNumber 42"`.

#### `showInt`

``` purescript
instance showInt :: Show Int
```


#### `eqInt`

``` purescript
instance eqInt :: Eq Int
```


#### `ordInt`

``` purescript
instance ordInt :: Ord Int
```


#### `semiringInt`

``` purescript
instance semiringInt :: Semiring Int
```

The `Int` type does not strictly obey the `Semiring` laws due to the
wrapping behaviour with values smaller than -2,147,483,648 or larger than
2,147,483,648.

#### `moduloSemiringInt`

``` purescript
instance moduloSemiringInt :: ModuloSemiring Int
```


#### `ringInt`

``` purescript
instance ringInt :: Ring Int
```

The `Int` type does not strictly obey the `Ring` laws due to the
wrapping behaviour with values smaller than -2,147,483,648 or larger than
2,147,483,648.


## Module Data.Int.Bits


This module defines bitwise operations for the `Int` type.

#### `(.&.)`

``` purescript
(.&.) :: Int -> Int -> Int
```

Bitwise AND.

#### `(.|.)`

``` purescript
(.|.) :: Int -> Int -> Int
```

Bitwise OR.

#### `(.^.)`

``` purescript
(.^.) :: Int -> Int -> Int
```

Bitwise XOR.

#### `shl`

``` purescript
shl :: Int -> Int -> Int
```

Bitwise shift left.

#### `shr`

``` purescript
shr :: Int -> Int -> Int
```

Bitwise shift right.

#### `zshr`

``` purescript
zshr :: Int -> Int -> Int
```

Bitwise zero-fill shift right.

#### `complement`

``` purescript
complement :: Int -> Int
```

Bitwise NOT.



