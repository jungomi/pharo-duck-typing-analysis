handling
handleAssignment: anAssignmentNode
	| typesAdded variableName cpaVar |
	self processNode: anAssignmentNode value.
	variableName := anAssignmentNode variable name.
	returnTypes hasValue ifFalse: [ returnTypes setUnknown. ].
	typesAdded := self mergeTypes: returnTypes intoVariable: variableName.
	cpaVar := self variableNodeByName: variableName.
	typesAdded > 0 ifTrue: [
		cpaVar propagate.
	].
	returnTypes copyReturnValues: cpaVar values.