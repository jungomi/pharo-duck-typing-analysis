tests-accessing
testVariableNodeByName
	| instTypes var varNode |
	instTypes := helper singletonSet: ByteString.
	var := 'variable'.
	helper cpa newScope: Cpa.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode equals: nil.
	helper cpa addTypes: helper types toVariable: var.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: varNode values types equals: helper types.
	helper cpa addTypes: instTypes toInstanceVariable: var atClass: Cpa.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: varNode values types equals: instTypes.