accessing
instanceVariableNodeByName: aVariableName OfClass: aClass
	^ (instanceVariableTypes at: aClass ifAbsent: [ ^ nil ]) at: aVariableName ifAbsent: [ ^ nil ].