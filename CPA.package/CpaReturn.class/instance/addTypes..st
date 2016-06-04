as yet unclassified
addTypes: aSet
	hasValue ifFalse: [ ^ self setTypes: aSet. ].
	isUnknown ifTrue: [ ^ self setIncompleteTypes: aSet. ].
	types addAll: aSet.