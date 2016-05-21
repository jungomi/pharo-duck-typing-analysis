adding
upOneScope
	currentScope = globalScope ifFalse: [
		currentScope := currentScope parent.
	].