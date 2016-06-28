querying
includes: aType
	(hasValue not or: isUnknown) ifTrue: [ ^ false ].
	^ types includes: aType