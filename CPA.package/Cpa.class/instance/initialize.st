initialization
initialize
	super initialize.
	graph := CpaGraph new.
	variables := Dictionary new.
	globalScope := CpaScope new.
	globalScope id: #global.
	currentScope := globalScope.
	repository := CpaMethodRepository new.
	returnTypes := CpaReturn new.