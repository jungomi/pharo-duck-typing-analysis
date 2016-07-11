tests-accessing
testVariablesWithName
	| var variables types |
	var := 'variable'.
	self assert: (helper cpa variablesWithName: var) isEmpty.
	helper cpa addTypes: helper types toVariable: var.
	variables := helper cpa variablesWithName: var.
	self assert: variables size equals: 1.
	self assert: (variables at: #global) equals: helper types.
	helper cpa newScope: #nextScope.
	types := helper singletonSet: ByteString.
	helper cpa newLocalVariable: var.
	helper cpa addTypes: types toVariable: var.
	variables := helper cpa variablesWithName: var.
	self assert: variables size equals: 2.
	self assert: (variables at: #global) equals: helper types.
	self assert: (variables at: #nextScope) equals: types.