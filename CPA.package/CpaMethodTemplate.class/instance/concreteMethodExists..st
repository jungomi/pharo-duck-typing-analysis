accessing
concreteMethodExists: anOrderedCollection
	"Checks whether there exists a concrete method with the given argument types"

	| argsDict |
	argsDict := self assignArgsToSelectors: anOrderedCollection.
	concretes do: [ :each |
		each selectorTypes = argsDict ifTrue: [ ^ true ].
	].
	^ false