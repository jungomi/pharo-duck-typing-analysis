instance-creation
processMethod: aMethod
	| cpa |
	cpa := self new.
	cpa processNode: (RBParser parseCompiledMethod: aMethod).
	^ cpa