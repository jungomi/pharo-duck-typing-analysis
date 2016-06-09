testing
concreteMethodExists: anOrderedCollection withValue: aSet
	"Checks whether there exists a concrete method with the given argument and value types"

	| argsDict |
	argsDict := self assignToSelectors: anOrderedCollection.
	concretes do: [ :each |
		(each selectorTypes = argsDict and: each valueTypes = aSet) ifTrue: [ ^ true ].
	].
	^ false