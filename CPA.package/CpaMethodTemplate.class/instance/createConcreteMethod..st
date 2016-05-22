as yet unclassified
createConcreteMethod: aDictionary
	| concreteMethod |
	concreteMethod := CpaConcreteMethod new: self.
	concreteMethod selectorTypes: aDictionary.
	^ concreteMethod