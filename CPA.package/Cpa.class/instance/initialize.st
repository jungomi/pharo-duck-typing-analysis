initialization
initialize
	super initialize.
	globalScope := CpaScope new: #global.
	currentScope := globalScope.
	repository := CpaMethodRepository new.
	returnTypes := CpaReturn new.
	instanceVariableTypes := Dictionary new.
	methodFailed := false.