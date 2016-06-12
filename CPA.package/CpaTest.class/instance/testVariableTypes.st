tests-accessing
testVariableTypes
	| var varNode |
	var := 'variable'.
	varNode := helper cpa variableTypes: var.
	self assert: varNode equals: nil.
	helper cpa addTypes: helper types toVariable: var.
	varNode := helper cpa variableTypes: var.
	self assert: varNode equals: helper types.