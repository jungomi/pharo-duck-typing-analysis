tests-handling
testHandleAssignmentVariable
	| assignment varNode |
	assignment := 'variable := anotherVariable'.
	helper cpa addTypes: helper types toVariable: 'anotherVariable'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode isNil.
	self assert: varNode types equals: helper types.