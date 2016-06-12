tests-adding
testAddTypesToVariable
	| types typesTwo numAdded var varNode |
	types := Set new add: SmallInteger; yourself.
	typesTwo := Set new add: Float; yourself.
	var := 'variable'.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode equals: nil.
	numAdded := helper cpa addTypes: types toVariable: var.
	self assert: numAdded equals: types size.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: varNode types equals: types.
	numAdded := helper cpa addTypes: typesTwo toVariable: var.
	self assert: numAdded equals: typesTwo size.
	varNode := helper cpa variableNodeByName: var.
	self assert: varNode class equals: CpaNode.
	self assert: (varNode types includes: SmallInteger).
	self assert: (varNode types includes: Float).
	numAdded := helper cpa addTypes: typesTwo toVariable: var.
	self assert: numAdded equals: 0.