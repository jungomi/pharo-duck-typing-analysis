adding
createConcreteMethod: aDictionary
	| concreteMethod |
	concreteMethod := CpaConcreteMethod new: self.
	concreteMethod selectorTypes: aDictionary.
	concretes add: concreteMethod.
	^ concreteMethod