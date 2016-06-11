adding
addClassInstanceVariables: aClass
	"Adds the class and all instance variables if the class did not exist"

	instanceVariableTypes at: aClass ifAbsent: [ | classDict currClass |
		classDict := instanceVariableTypes at: aClass put: Dictionary new.
		currClass := aClass.
		[ currClass isNotNil ] whileTrue: [ | instVars |
			instVars := currClass instanceVariables.
			instVars ifNotNil: [
				instVars do: [ :each | classDict at: each put: CpaNode new ].
			].
			currClass := currClass superclass.
		].
	].
