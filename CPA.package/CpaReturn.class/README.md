CpaReturn keeps track of types of the return values. A return value may be
unknown or multiple return can exist within the same context. When some return
values are known but others are not, the CpaReturn is marked as incomplete, as
some types could not have been identified correctly, but they do exist.
The return type can only be unknown when there exists a value (that could not be
identified correctly) and is different from not having a return value at all.

Public API and Key Messages
  - copyReturnValues: <CpaReturn> - copies the content of <CpaReturn>.
  - mergeReturnValues: <CpaReturn> - combines the content of <CpaReturn> with
      the current content.
  - propagate - propagates the types through the outgoing edges
  There are also various of methods to add or set the values.

Instance Variables
  hasValue: <Boolean> - whether it has a valid return value.
  isUnknown: <Boolean> - whether the return type is unknown.
  isIncomplete: <Boolean> - whether the return type is incomplete.
  types: <Set> - the types of the return value.