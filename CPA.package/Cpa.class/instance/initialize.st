initialization
initialize
	super initialize.
	graph := CpaGraph new.
	globalScope := CpaScope new: #global.
	currentScope := globalScope.
	repository := CpaMethodRepository new.
	returnTypes := CpaReturn new.
	instanceVariableTypes := Dictionary new.
	ducks := Set new.