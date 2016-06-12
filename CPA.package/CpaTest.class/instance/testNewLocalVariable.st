tests-adding
testNewLocalVariable
	| var varNode |
	var := 'variable'.
	self deny: (helper cpa currentScope variables includes: var).
	varNode := helper cpa newLocalVariable: var.
	self assert: (helper cpa currentScope variables includes: varNode).
	helper cpa newScope: #anotherScope.
	self deny: (helper cpa currentScope variables includes: var).
	self assert: (helper cpa currentScope parent variables includes: varNode).
	varNode := helper cpa newLocalVariable: var.
	self assert: (helper cpa currentScope variables includes: varNode).
