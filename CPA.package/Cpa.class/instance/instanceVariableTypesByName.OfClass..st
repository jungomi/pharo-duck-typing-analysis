accessing
instanceVariableTypesByName: aVariableName OfClass: aClass
	^ (instanceVariableTypes at: aClass ifAbsent: [ ^ nil ]) at: aVariableName ifAbsent: [ ^ nil ].