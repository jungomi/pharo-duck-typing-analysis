as yet unclassified
createConcreteMethod: aDictionary
	| concreteMethod |
	concreteMethod := CpaConcreteMethod new.
	concreteMethod selectors: selectors.
	selectors do: [ :each | concreteMethod initializeSelector: each with: (aDictionary at: each) ]