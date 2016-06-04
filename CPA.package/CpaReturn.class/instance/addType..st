as yet unclassified
addType: aClass
	hasValue ifFalse: [ ^ self setType: aClass. ].
	isUnknown ifTrue: [ ^ self setIncompleteType: aClass. ].
	types add: aClass.