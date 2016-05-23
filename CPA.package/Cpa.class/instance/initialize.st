initialization
initialize
	super initialize.
	graph := CpaGraph new.
	globalScope := CpaScope new.
	globalScope id: #global.
	currentScope := globalScope.
	repository := CpaMethodRepository new.
	returnTypes := CpaReturn new.
	instanceVariableTypes := Dictionary new.
	ducks := Set new.