removing
removeType: aClass
	hasValue ifTrue: [
		(types includes: aClass) ifTrue: [
			types remove: aClass.
			types ifEmpty: [
				isIncomplete ifTrue: [ self setUnknown. ] ifFalse: [ self unset. ].
			].
		].
	].