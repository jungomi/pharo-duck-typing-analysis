handling
handleVariable: aVariableNode
	| variableName |
	variableName := aVariableNode name.
	(self isVariableInScope: variableName) ifFalse: [ self newLocalVariable: variableName ].
	returnTypes unset.