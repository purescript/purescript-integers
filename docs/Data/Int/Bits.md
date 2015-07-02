## Module Data.Int.Bits

This module defines bitwise operations for the `Int` type.

#### `(.&.)`

``` purescript
(.&.) :: Int -> Int -> Int
```

_left-associative / precedence 10_

Bitwise AND.

#### `(.|.)`

``` purescript
(.|.) :: Int -> Int -> Int
```

_left-associative / precedence 10_

Bitwise OR.

#### `(.^.)`

``` purescript
(.^.) :: Int -> Int -> Int
```

_left-associative / precedence 10_

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


