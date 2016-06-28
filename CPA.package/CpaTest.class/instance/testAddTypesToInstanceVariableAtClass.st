tests-adding
testAddTypesToInstanceVariableAtClass
	| types typesTwo  var varNode |
	types := helper singletonSet: SmallInteger.
	typesTwo := helper singletonSet: Float.
	var := 'instanceVariable'.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode equals: nil.
	helper cpa addTypes: types toInstanceVariable: var atClass: Cpa.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode class equals: CpaNode.
	self assert: varNode values types equals: types.
	helper cpa addTypes: typesTwo toInstanceVariable: var atClass: Cpa.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode class equals: CpaNode.
	self assert: (varNode values includes: SmallInteger).
	self assert: (varNode values includes: Float).