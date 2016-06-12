tests-accessing
testInstanceVariableNodeByNameOfClass
	| var varNode |
	var := 'instanceVariable'.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode equals: nil.
	helper cpa addTypes: helper types toInstanceVariable: var atClass: Cpa.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode class equals: CpaNode.
	self assert: varNode types equals: helper types.