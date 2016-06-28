tests-handling
testHandleAssignmentUnknown
	| assignment varNode |
	assignment := 'variable := unknownVariable'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode isNil.
	self assert: varNode values hasValue.
	self assert: varNode values isUnknown.
	