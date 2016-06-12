tests-adding
testNewGlobalVariable
	| var varNode |
	var := 'variable'.
	self deny: (helper cpa globalScope variables includes: var).
	varNode := helper cpa newGlobalVariable: var.
	self assert: (helper cpa globalScope variables includes: varNode).
	helper cpa newScope: #anotherScope.
	var := 'anotherVariable'.
	varNode := helper cpa newGlobalVariable: var.
	self assert: (helper cpa globalScope variables includes: varNode).
	self deny: (helper cpa currentScope variables includes: varNode).