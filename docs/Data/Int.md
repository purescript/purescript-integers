## Module Data.Int

#### `fromNumber`

``` purescript
fromNumber :: Number -> Maybe Int
```

Creates an `Int` from a `Number` value. The number must already be an
integer and fall within the valid range of values for the `Int` type
otherwise `Nothing` is returned.

#### `floor`

``` purescript
floor :: Number -> Int
```

Convert a `Number` to an `Int`, by taking the closest integer equal to or
less than the argument. Values outside the `Int` range are clamped.

#### `ceil`

``` purescript
ceil :: Number -> Int
```

Convert a `Number` to an `Int`, by taking the closest integer equal to or
greater than the argument. Values outside the `Int` range are clamped.

#### `round`

``` purescript
round :: Number -> Int
```

Convert a `Number` to an `Int`, by taking the nearest integer to the
argument. Values outside the `Int` range are clamped.

#### `toNumber`

``` purescript
toNumber :: Int -> Number
```

Converts an `Int` value back into a `Number`. Any `Int` is a valid `Number`
so there is no loss of precision with this function.

#### `fromString`

``` purescript
fromString :: String -> Maybe Int
```

Reads an `Int` from a `String` value. The number must parse as an integer
and fall within the valid range of values for the `Int` type, otherwise
`Nothing` is returned.

#### `even`

``` purescript
even :: Int -> Boolean
```

Returns whether an `Int` is an even number.

``` purescript
even 0 == true
even 1 == false
```

#### `odd`

``` purescript
odd :: Int -> Boolean
```

The negation of `even`.

``` purescript
odd 0 == false
odd 1 == false
```


