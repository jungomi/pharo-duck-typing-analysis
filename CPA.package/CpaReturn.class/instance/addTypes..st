adding
addTypes: aSet
	aSet ifEmpty: [ ^ self addUnknown ].
	hasValue ifFalse: [ ^ self setTypes: aSet. ].
	isUnknown ifTrue: [ ^ self setIncompleteTypes: aSet. ].
	types addAll: aSet.