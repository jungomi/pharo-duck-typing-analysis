adding
createConcreteMethodWithArgs: anOrderedCollection andValue: aSet
	"Creates a concrete method from the current template with the argument and value types"

	| concreteMethod |
	concreteMethod := CpaConcreteBlockMethod new: self.
	concreteMethod selectorTypes: (self assignToSelectors: anOrderedCollection).
	concreteMethod valueTypes: aSet.
	concretes add: concreteMethod.
	^ concreteMethod