tests-handling
testHandleVariable
	| var varNode |
	var := 'variable'.
	helper cpa addTypes: helper types toVariable: var.
	helper cpa handleVariable: (helper parse: var).
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: varNode types equals: helper types.
	var := 'unknownVariable'.
	helper cpa handleVariable: (helper parse: var).
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: varNode types isEmpty.
	var := 'Object'.
	helper cpa handleVariable: (helper parse: var).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (helper singletonSet: Object class).
