initialization
initialize
	super initialize.
	graph := CpaGraph new.
	variables := Dictionary new.
	globalScope := CpaScope new.
	globalScope name: #global.
	currentScope := globalScope.