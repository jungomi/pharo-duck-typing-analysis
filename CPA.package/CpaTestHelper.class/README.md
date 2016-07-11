# CpaTestHelper

A helper class that provides methods for frequently used actions and values in
the tests.

## Public API and Key Messages

- `parse`: `String` - parses the expression with the `RBParser` class.
- `createMocks` - creates the artificial classes.
- `deleteMocks` - deletes the artificial classes.

Should be created in the `setUp` of the tests with: `CpaTestHelper new`.

## Example

```smalltalk
setUp
  super setUp.
  helper := CpaTesthelper new.
  helper createMocks.

tearDown
  super tearDown.
  helper deleteMocks.
```

OR directly in a single test case with the `deleteMocks` in an ensure block, to
guarantee that the classes are deleted:

```smalltalk
testMethod
  | helper |
  helper := CpaTestHelper new.
  helper createMocks.
  [
    self assert: true.
  ] ensure: [ helper deleteMocks ]. 
```

## Instance Variables

- `cpa`: `Cpa` the main object for the tests.
- `mock`: `TestClassMock` an artificial class containing methods with specific
    behaviour to test the different receiver.
- `subMock`: `TestSubClassMock` a subclass of `TestClassMock` to test
    inheritance.
- `subSubMock`: `TestSubSubClassMock` a subclass of `TestSubClassMock` to test
    further inheritance.
- `otherMock`: `TestClassOtherMock` an class independent of `TestSubClassMock`
    to test duck typing.
- `types`: `Set` a Set containing the values `SmallInteger` and `Float`.
