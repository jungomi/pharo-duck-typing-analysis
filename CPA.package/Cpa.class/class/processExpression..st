instance-creation
processExpression: aString
	| cpa |
	cpa := self new.
	cpa processNode: (RBParser parseExpression: aString).
	^ cpa