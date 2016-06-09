accessing
concreteMethodWithArgs: anOrderedCollection andValue: aSet
	"Finds the concrete method for the given argument and value types"

	| argsDict |
	argsDict := self assignToSelectors: anOrderedCollection.
	concretes do: [ :each |
		(each selectorTypes = argsDict and: each valueTypes = aSet) ifTrue: [ ^ each ].
	].
	^ nil