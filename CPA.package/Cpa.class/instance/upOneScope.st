as yet unclassified
upOneScope
	currentScope = globalScope ifFalse: [
		currentScope := currentScope parent.
	].