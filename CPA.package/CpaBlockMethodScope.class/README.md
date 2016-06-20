# CpaBlockMethodScope

`CpaBlockMethodScope` is special form of `CpaScope` that applies to methods with
a block as receiver. It additionally holds the block with all its informations.

## Instance Variables

- `block: CpaBlock` - the block that is used as the receiver.
