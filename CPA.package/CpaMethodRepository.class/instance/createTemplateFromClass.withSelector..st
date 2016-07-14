adding
createTemplateFromClass: aClass withSelector: aSelector
	| temp args varNames |
	temp := CpaMethodTemplate new: aClass withSelector: aSelector.
	args := (RBParser parseCompiledMethod: aClass>>aSelector) arguments.
	temp numArgs: args size.
	varNames := args collect: [ :each | each name ].
	temp variables: (temp assignToSelectors: varNames).
	templates at: aClass>>aSelector put: temp.
	^ temp