adding
addClassInstanceVariables: aClass
	"Adds the class and all instance variables if the class did not exist"

	instanceVariableTypes at: aClass ifAbsent: [ | instVars classDict |
		instVars := aClass instanceVariables.
		classDict := instanceVariableTypes at: aClass put: Dictionary new.
		instVars ifNotNil: [ instVars do: [ :each | classDict at: each put: CpaNode new ] ].
	].
