adding
createConcreteMethod: aDictionary
	| concreteMethod |
	concreteMethod := CpaConcreteBlockMethod new: self.
	concreteMethod selectorTypes: aDictionary.
	concretes add: concreteMethod.
	^ concreteMethod