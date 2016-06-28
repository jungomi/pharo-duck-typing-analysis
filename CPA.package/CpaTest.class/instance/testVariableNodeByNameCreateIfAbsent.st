tests-accessing
testVariableNodeByNameCreateIfAbsent
	| varNode |
	varNode := helper cpa variableNodeByNameCreateIfAbsent: 'variable'.
	self assert: varNode class equals: CpaNode.
	self deny: varNode values hasValue.