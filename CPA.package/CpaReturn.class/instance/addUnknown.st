adding
addUnknown
	hasValue ifFalse: [ ^ self setUnknown. ].
	isUnknown ifFalse: [ ^ isIncomplete := true. ].