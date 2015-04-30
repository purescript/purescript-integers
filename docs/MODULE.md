# Module Documentation

## Module Data.Int

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



