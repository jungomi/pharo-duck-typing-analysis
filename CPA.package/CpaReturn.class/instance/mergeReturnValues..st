adding
mergeReturnValues: aCpaReturn
	aCpaReturn hasValue ifTrue: [			
		aCpaReturn isUnknown ifTrue: [ ^ self addUnknown ].
		aCpaReturn isIncomplete ifTrue: [
			self addIncompleteTypes: aCpaReturn types.
		] ifFalse: [
			self addTypes: aCpaReturn types.
		].
	].