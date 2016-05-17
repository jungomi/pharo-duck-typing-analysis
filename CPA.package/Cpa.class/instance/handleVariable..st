handling
handleVariable: aVariableNode
	| variableName |
	variableName := aVariableNode name.
	(variables keys includes: variableName) ifFalse: [ self newVariable: variableName ].