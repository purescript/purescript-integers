# purescript-integers

[![Build Status](https://travis-ci.org/purescript/purescript-integers.svg?branch=master)](https://travis-ci.org/purescript/purescript-integers)

This library provides a 32-bit `Int` type for PureScript along with corresponding bitwise operations.

## Installation

```
bower install purescript-integers
```

## Overview

Integers are constructed from the standard `Number` by using the `fromNumber` function, see [`docs/MODULE.md`](docs/MODULE.md) for more details.

As values outside of the range -2,147,483,648 to 2,147,483,648 will overflow and wrap around, the `Int` type does not _strictly_ obey the laws for `Semiring` and `Ring`.

## Module documentation

[`docs/MODULE.md`](docs/MODULE.md)
