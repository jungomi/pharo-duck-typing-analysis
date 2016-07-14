instance-creation
processExpression: aString
	| cpa |
	cpa := self new.
	cpa processExpression: aString.
	^ cpa