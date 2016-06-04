as yet unclassified
addIncompleteTypes: aSet
	(hasValue not or: isUnknown) ifTrue: [ ^ self setIncompleteTypes: aSet. ].
	types addAll: aSet.
	isIncomplete := true.