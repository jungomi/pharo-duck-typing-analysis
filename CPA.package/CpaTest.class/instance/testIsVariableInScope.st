tests-testing
testIsVariableInScope
	| var1 var2 var3 |
	var1 := 'firstScopeVariable'.
	var2 := 'secondScopeVariable'.
	var3 := 'outOfScopeVariable'.
	helper cpa newLocalVariable: var1.
	helper cpa newScope: #secondScope.
	helper cpa newLocalVariable: var2.
	self assert: (helper cpa isVariableInScope: var1).
	self assert: (helper cpa isVariableInScope: var2).
	self deny: (helper cpa isVariableInScope: var3).
	helper cpa upOneScope.
	self assert: (helper cpa isVariableInScope: var1).
	self deny: (helper cpa isVariableInScope: var2).
	self deny: (helper cpa isVariableInScope: var3).