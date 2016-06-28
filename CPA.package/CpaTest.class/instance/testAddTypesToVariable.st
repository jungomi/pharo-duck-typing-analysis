tests-adding
testAddTypesToVariable
	| types typesTwo numAdded var varNode |
	types := helper singletonSet: SmallInteger.
	typesTwo := helper singletonSet: Float.
	var := 'variable'.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode equals: nil.
	numAdded := helper cpa addTypes: types toVariable: var.
	self assert: numAdded equals: types size.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: varNode values types equals: types.
	numAdded := helper cpa addTypes: typesTwo toVariable: var.
	self assert: numAdded equals: typesTwo size.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: (varNode values includes: SmallInteger).
	self assert: (varNode values includes: Float).
	numAdded := helper cpa addTypes: typesTwo toVariable: var.
	self assert: numAdded equals: 0.