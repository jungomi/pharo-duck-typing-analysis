tests-adding
testAddTypesToInstanceVariableAtClass
	| types typesTwo  var varNode |
	types := Set new add: SmallInteger; yourself.
	typesTwo := Set new add: Float; yourself.
	var := 'instanceVariable'.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode equals: nil.
	helper cpa addTypes: types toInstanceVariable: var atClass: Cpa.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode class equals: CpaNode.
	self assert: varNode types equals: types.
	helper cpa addTypes: typesTwo toInstanceVariable: var atClass: Cpa.
	varNode := helper cpa instanceVariableNodeByName: var OfClass: Cpa.
	self assert: varNode class equals: CpaNode.
	self assert: (varNode types includes: SmallInteger).
	self assert: (varNode types includes: Float).