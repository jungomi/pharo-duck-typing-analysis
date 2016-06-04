converting
assignArgsToSelectors: anOrderedCollection
	"Creates a dictionary with the argument types assigned to the corresponding selectors"

	| typesDict |
	typesDict := Dictionary new.
	((anOrderedCollection size ~= numArgs) or: (anOrderedCollection size == 0)) ifTrue: [ ^ typesDict ].
	(self splitSelector) withIndexDo: [ :each :index |
		typesDict at: each put: (anOrderedCollection at: index)
	].
	^ typesDict
	