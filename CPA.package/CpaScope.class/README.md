# CpaScope

`CpaScope` is a lexical scope that is used in a tree structure. It keeps track
of the variables defined within the scope and the return value from return
statements in the scope.

## Public API and Key Messages

- `variableNodeByName: Name` - returns the variable node with the name `Name`.
- `receiver` - returns the receiver of the scope if it is a method scope.
- `newChild: Name` - creates a new child scope with the name `Name`.

There are some variations to `newChild` to add specific scopes.

## Instance Variables

- `parent: CpaScope` - the parent scope.
- `children: Set` - the child scopes.
- `id: Name` - the name of the scope.
- `returnTypes: Set` - the types of the return value.
