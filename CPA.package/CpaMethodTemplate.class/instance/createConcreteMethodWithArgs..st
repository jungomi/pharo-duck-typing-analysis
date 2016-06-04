adding
createConcreteMethodWithArgs: anOrderedCollection
	"Creates a concrete method from the current template with the argument types"

	| concreteMethod |
	concreteMethod := CpaConcreteMethod new: self.
	concreteMethod selectorTypes: (self assignArgsToSelectors: anOrderedCollection).
	concretes add: concreteMethod.
	^ concreteMethod