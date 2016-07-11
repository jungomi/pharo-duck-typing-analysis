converting
assignToSelectors: anOrderedCollection
	"Creates a dictionary with the items of the collection assigned to the corresponding selectors"

	| dict |
	dict := Dictionary new.
	((anOrderedCollection size ~= numArgs) or: (anOrderedCollection isEmpty)) ifTrue: [ ^ nil ].
	self splitSelector withIndexDo: [ :each :index |
		dict at: each put: (anOrderedCollection at: index)
	].
	^ dict
	