# CpaBlock

`CpaBlock` represents a block object and holds the receiving class
(`BlockClosure`) and the types of the block's value.

Blocks have implicit returns and the value can be accessed during run time by
calling `BlockClosure>>#value`, this value is stored to access it at any time
without having to process the block again.

## Instance Variables

- `valueTypes: Set` - the types of the block's value.
