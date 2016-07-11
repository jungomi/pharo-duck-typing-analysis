tests-accessing
testVariables
	| var types |
	var := 'variable'.
	helper cpa addTypes: helper types toVariable: var.
	self assert: ((helper cpa variables at: #variable) at: #global) equals: helper types.
	helper cpa newScope: #nextScope.
	var := 'nextVariable'.
	types := helper singletonSet: ByteString.
	helper cpa addTypes: types toVariable: var.
	self assert: ((helper cpa variables at: #variable) at: #global) equals: helper types.
	self assert: ((helper cpa variables at: #nextVariable) at: #nextScope) equals: types.