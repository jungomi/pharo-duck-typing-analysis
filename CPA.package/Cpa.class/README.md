# Cpa

The `Cpa` class is the main instance for the code analysis with the Cartesian
Product Algorithm (CPA). It parses the AST of the code that is being analysed
and tries to infer the types of the variables, the return types of the methods
and additionally also potential duck types that are used within the code.

## Examples

The analysis starts in `Cpa>>#processNode:` which takes an AST node as input,
that can be parsed with the `RBParser` class.

```smalltalk
cpa := Cpa new.

parsedExpression := RBParser parseExpression: '| duck |
  duck := Dictionary new.
  duck := Set new.
  duck add: Object'.
cpa processNode: parsedExpression.

parsedMethod := RBParser parseCompiledMethod: CpaNode>>#propagate.
cpa processNode: testNode.
```

Alternatively the class methods `Cpa>>#processExpression:` and
`Cpa>>#processMethod:` or the equivalent instance methods can be used to pass
a string or a method that will be analysed. The class methods return a new `Cpa`
instance whereas the instance methods simply add the results to the existing
instance.

```smalltalk
| cpa cpa2 |
cpa := Cpa processExpression: '| duck |
  duck := Dictionary new.
  duck := Set new.
  duck add: Object'.

"New instance"
cpa2 := Cpa processMethod: CpaNode>>#propagate.
"Adding to the existing instance"
cpa processMethod: CpaNode>>#propagate.
```

## Public API and Key Messages

- `variables` - returns a `Dictionary` containing all variables and their types
    in the respective scope.
- `variablesFromScopeWithId: Name` - returns a `Dictionary` containing all
    variables in the scope with the given name.
- `variablesWithName: Name` - returns a `Dictionary` containing the types of the
    variable with the given name.
- `ducks` - returns a `Dictionary` containing all duck types associated to the
    variables.
- `ducksFromScopeWithId: Name` - returns a `Dictionary` containing all duck
    types in the scope with the given name.
- `ducksOfVariable: Name` - returns a `Dictionary` containing the duck types of
    the variable with the given name.

## Instance Variables

- `currentScope: CpaScope` - the current lexical scope.
- `globalScope: CpaScope` - the global (top-level) lexical scope.
- `instanceVariableTypes: Dictionary` - contains instance variables of the
    analysed classes.
- `repository: CpaMethodRepository` - holds a list of method templates.
- `returnTypes: CpaReturn` - represents the current return value types.
- `methodFailed: Boolean` - represents whether the most recent method failed.


## Implementation Details

### Scope

Every method creates a new scope as a child of the currently active scope
(starting with the global scope), building a tree. There are a few cases that
require additional informations:

### Blocks

A block creates a new scope where local variables follow the rules of the basic
scope with the addition that `self`, `super`, instance variables and returns
belong the enclosing method. This method is not necessarily the parent of the
block, as it is possible to have nested blocks. Therefore it is needed to keep
track of the enclosing method in the scope information. `CpaBlockScope` achieves
this, allowing the identification of the correct receiver.  Blocks also have
implicit returns, because return statements belong the enclosing method.

### Block Methods

The values of blocks can be accessed with the method value (i.e.
`BlockClosure>>#value`), which is implemented using a primitive.  In order to
get that value the block return values (implicit return of the last expression)
needs to be stored, so it can accessed at any time.  This is done in a modified
scope (`CpaBlockMethodScope`) which enables the possibility to detect whether
the selector #value corresponds to a block and needs to be intercepted and
replaced with the return values of the block.

### Super Methods

Methods of the superclasses can be called, either explicitly with the keyword
`super` or implicitly when the method is not defined in the called class but in
one of its superclasses. These calls are similar to the block scoping
differences, namely `self`, `super` and instance variables belong to the
originally called class and not to the class where the method resides. For
`self` and `super` it's essential to have this information to determine the
correct (overridden) methods that need to be called. It is also needed to be
able to tell which instance variables need to be modified. `CpaSuperMethodScope`
provides those additional informations.

### Returns

Return types of the last evaluated expression are stored in `returnTypes` of the
`Cpa` instance. As methods can have multiple return statements, it is required
to to accumulate those types but allowing the `Cpa` instance to overwrite the
return type of the last expression. For this purpose the return types of
a method are kept in the current scope (whilst taking the special cases,
mentioned above, into account).
A return value may be unknown due to limited access to the code
(e.g. starting code analysis in a method, without the information of the
passed parameters). Multiple return statements also add the fact that some
return values are known and others unknown, these are marked as incomplete.

### Duck Types

Potential duck types are added when a variable holds multiple types which
respond to the selector.

#### Method Failure

A method fails whenever there is no suitable receiver for a message within the
method.The method analysis is not aborted at that point, but continues normally
in order to collect as much type information as possible. Every duck type that
failed a message with the variable as receiver, is removed.
