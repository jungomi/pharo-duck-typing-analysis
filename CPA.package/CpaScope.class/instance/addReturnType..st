adding
addReturnType: aClass
	returnTypes hasValue ifFalse: [ ^ returnTypes setType: aClass. ].
	returnTypes isUnknown ifTrue: [ ^ returnTypes setIncompleteType: aClass. ].
	returnTypes types add: aClass.