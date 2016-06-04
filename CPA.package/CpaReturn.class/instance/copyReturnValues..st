as yet unclassified
copyReturnValues: aCpaReturn
	aCpaReturn hasValue ifFalse: [ ^ self unset. ].
	aCpaReturn isUnknown ifTrue: [ ^ self setUnknown. ].
	aCpaReturn isIncomplete ifTrue: [
		self setIncompleteTypes: aCpaReturn types.
	] ifFalse: [
		self setTypes: aCpaReturn types.
	].