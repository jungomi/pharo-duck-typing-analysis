tests-handling
testHandleAssignmentLiteral
	| assignment varNode |
	assignment := 'variable := 0'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode isNil.
	self assert: (varNode types includes: 0 class).
	assignment := 'variable := 3.14'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode isNil.
	self assert: (varNode types includes: 0 class).
	self assert: (varNode types includes: 3.14 class).
	assignment := 'variable := true'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode isNil.
	self assert: (varNode types includes: 0 class).
	self assert: (varNode types includes: 3.14 class).
	self assert: (varNode types includes: true class).