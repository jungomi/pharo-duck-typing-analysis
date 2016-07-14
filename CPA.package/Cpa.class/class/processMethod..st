instance-creation
processMethod: aMethod
	| cpa |
	cpa := self new.
	cpa processMethod: aMethod.
	^ cpa