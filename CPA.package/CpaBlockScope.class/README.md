# CpaBlockScope

`CpaBlockScope` is special form of `CpaScope` that represents the scope within
a block. Return statements within the block belong to the enclosing method as
well as `self` and `super`. This is addressed in `CpaBlockScope`.

## Instance Variables

- `methodScope: CpaScope` - the scope of the enclosing method.
