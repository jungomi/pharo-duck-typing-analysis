tests-accessing
testVariableNodeByNameCreateIfAbsent
	| varNode |
	varNode := helper cpa variableNodeByNameCreateIfAbsent: 'variable'.
	self assert: varNode class equals: CpaNode.
	self assert: varNode types equals: Set new.