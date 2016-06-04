adding
addReturnTypes: aSet
	returnTypes hasValue ifFalse: [ ^ returnTypes setTypes: aSet. ].
	returnTypes isUnknown ifTrue: [ ^ returnTypes setIncompleteTypes: aSet. ].
	returnTypes types addAll: aSet.