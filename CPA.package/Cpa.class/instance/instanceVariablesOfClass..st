accessing
instanceVariablesOfClass: aClass
	^ instanceVariableTypes at: aClass ifAbsent: [ nil ].