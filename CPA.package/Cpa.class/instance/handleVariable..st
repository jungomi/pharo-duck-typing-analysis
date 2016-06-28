handling
handleVariable: aVariableNode
	| variableName |
	variableName := aVariableNode name.
	variableName asClassIfPresent: [ :cl |
		^ returnTypes setType: cl class.
	].
	(self isVariableInScope: variableName) ifFalse: [ self newLocalVariable: variableName ].
	returnTypes copyReturnValues: (self variableNodeByName: variableName) values.