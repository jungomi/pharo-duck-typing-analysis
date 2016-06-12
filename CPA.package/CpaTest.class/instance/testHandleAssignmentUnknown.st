tests-handling
testHandleAssignmentUnknown
	| assignment varNode |
	assignment := 'variable := unknownVariable'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode == nil.
	self assert: varNode types isEmpty.
	