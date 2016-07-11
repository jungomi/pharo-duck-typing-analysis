tests-accessing
testVariablesFromScopeWithId
	| scopeId variables |
	scopeId := 'scope'.
	helper cpa newScope: scopeId.
	helper cpa addTypes: helper types toVariable: #var1.
	helper cpa addTypes: helper types toVariable: #var2.
	variables := helper cpa variablesFromScopeWithId: scopeId.
	self assert: variables size equals: 2.
	self assert: (variables at: #var1) equals: helper types.
	self assert: (variables at: #var2) equals: helper types.