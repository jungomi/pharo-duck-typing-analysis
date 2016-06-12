handling
handleVariable: aVariableNode
	| variableName |
	variableName := aVariableNode name.
	variableName := variableName asClassIfAbsent: [
		(self isVariableInScope: variableName) ifFalse: [ self newLocalVariable: variableName ].
		^ returnTypes unset.
	].
	returnTypes setType: variableName.