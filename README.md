# purescript-integers

[![Build Status](https://travis-ci.org/purescript/purescript-integers.svg?branch=master)](https://travis-ci.org/purescript/purescript-integers)

This library provides a 32-bit `Int` type for PureScript along with corresponding bitwise operations.

## Installation

```
bower install purescript-integers
```

## Overview

Integers are constructed using integer literals, or from the standard `Number` by using the `fromNumber` function:

``` purescript
ten = fromNumber 1.0
```

See the [module documentation](docs/MODULE.md) for more details on the behaviour of `fromNumber`.

A `Semiring Int` instance is also provided so `zero` and `one` can be used for the equivalent integer values.

As values outside of the range -2,147,483,648 to 2,147,483,648 will overflow and wrap around, the `Int` type does not _strictly_ obey the laws for `Semiring` and `Ring`.

## Module documentation

[`docs/MODULE.md`](docs/MODULE.md)
