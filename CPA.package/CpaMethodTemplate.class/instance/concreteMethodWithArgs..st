accessing
concreteMethodWithArgs: anOrderedCollection
	"Finds the concrete method for the given argument types"

	| argsDict |
	argsDict := self assignToSelectors: anOrderedCollection.
	concretes do: [ :each |
		each selectorTypes = argsDict ifTrue: [ ^ each ].
	].
	^ nil