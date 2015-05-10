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

#### `fromString`

``` purescript
fromString :: String -> Maybe Int
```

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


