# Module Documentation

## Module Data.Int

### Types

#### `Int`

    newtype Int


### Type Class Instances

#### `bitsInt`

    instance bitsInt :: Bits Int

#### `eqInt`

    instance eqInt :: Eq Int

#### `moduloSemiringInt`

    instance moduloSemiringInt :: ModuloSemiring Int

#### `ordInt`

    instance ordInt :: Ord Int

#### `semiringInt`

    instance semiringInt :: Semiring Int

#### `showInt`

    instance showInt :: Show Int


### Values

#### `fromNumber`

Creates an `Int` from a `Number` value. If the value is not already an
integer it is rounded down.

    fromNumber :: Number -> Int

#### `toNumber`

    toNumber :: Int -> Number