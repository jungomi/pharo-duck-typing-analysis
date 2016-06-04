accessing
concreteMethodWithArgs: anOrderedCollection
	"Finds the concrete method for the given argument types"

	| argsDict |
	argsDict := self assignArgsToSelectors: anOrderedCollection.
	concretes do: [ :each |
		each selectorTypes = argsDict ifTrue: [ ^ each ].
	].
	^ nil