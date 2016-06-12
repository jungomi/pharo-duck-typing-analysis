# Pharo Duck Typing Analysis

Analysis of duck typing in Pharo Smalltalk

## Cartesian Product Algorithm (CPA) implementation

The `Cpa` class is the main instance for the code analysis with the Cartesian
Product Algorithm (CPA). It parses the AST of the code that is being analysed
and tries to infer the types of the variables, the return types of the methods
and additionally also potential duck types that are used within the code.

### Examples

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
`Cpa>>#processMethod:` can be used to pass a string or a method that will be
analysed, returning the resulting `Cpa` instance.

```smalltalk
Cpa processExpression: '| duck |
  duck := Dictionary new.
  duck := Set new.
  duck add: Object'.

Cpa processMethod: CpaNode>>#propagate.
```

### Implementation Details

#### Scope

Every method creates a new scope as a child of the currently active scope
(starting with the global scope), building a tree. There are a few cases that
require additional informations:

##### Blocks

A block creates a new scope where local variables follow the rules of the basic
scope with the addition that self, super, instance variables and returns belong
the enclosing method. This method is not necessarily the parent of the block, as
it is possible to have nested blocks. Therefore it is needed to keep track of
the enclosing method in the scope information. `CpaBlockScope` achieves this,
allowing the identification of the correct receiver.  Blocks also have implicit
returns, because return statements belong the enclosing method.

##### Block Methods

The values of blocks can be accessed with the method value (i.e.
`BlockClosure>>#value`), which is implemented using a primitive.  In order to
get that value the block return values (implicit return of the last expression)
needs to be stored, so it can accessed at any time.  This is done in a modified
scope (`CpaBlockMethodScope`) which enables the possibility to detect whether
the selector #value corresponds to a block and needs to be intercepted and
replaced with the return values of the block.

##### Super Methods

Methods of the superclasses can be called, either explicitly with the keyword
super or implicitly when the method is not defined in the called class but in
one of its superclasses. These calls are similar to the block scoping
differences, namely self, super and instance variables belong to the originally
called class and not to the class where the method resides. For self and super
it's essential to have this information to determine the correct (overridden)
methods that need to be called. It is also needed to be able to tell which
instance variables need to be modified. `CpaSuperMethodScope` provides those
additional informations.

#### Returns

Return types of the last evaluated expression are stored in returnTypes of the
`Cpa` instance. As methods can have multiple return statements, it is required
to to accumulate those types but allowing the `Cpa` instance to overwrite the
return type of the last expression. For this purpose the return types of
a method are kept in the current scope (whilst taking the special cases,
mentioned above, into account).
A return value may be unknown due to limited access to the code
(e.g. starting code analysis in a method, without the information of the
passed parameters). Multiple return statements also add the fact that some
return values are known and others unknown, these are marked as incomplete.

#### Duck Types

Potential duck types are added when a variable holds multiple types which
respond to the selector.
