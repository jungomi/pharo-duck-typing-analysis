tests-handling
testHandleAssignmentLiteral
	| assignment varNode |
	assignment := 'variable := 0'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode == nil.
	self assert: (varNode types includes: SmallInteger).
	assignment := 'variable := 3.14'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode == nil.
	self assert: (varNode types includes: SmallInteger).
	self assert: (varNode types includes: Float).
	assignment := 'variable := true'.
	helper cpa handleAssignment: (helper parse: assignment).
	varNode := helper cpa variableNodeByName: 'variable'.
	self deny: varNode == nil.
	self assert: (varNode types includes: SmallInteger).
	self assert: (varNode types includes: Float).
	self assert: (varNode types includes: True).