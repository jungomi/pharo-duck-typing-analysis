handling
handleAssignment: anAssignmentNode
	"TODO: different names to distinguish between CpaNode and RBNode, and refactor!"
	| typesAdded typeSet valueNode variableNode variableName |
	valueNode := anAssignmentNode value.
	variableNode := anAssignmentNode variable.
	valueNode class == RBVariableNode ifTrue: [ | cpaValueNode cpaVariableNode |
		cpaValueNode := self variableNodeByName: (valueNode name).
		cpaVariableNode := self variableNodeByName: (variableNode name).
		cpaValueNode addIncomingNode: cpaVariableNode.
		cpaVariableNode addOutgoingNode: cpaValueNode.
		typeSet := cpaValueNode types.
	] ifFalse: [
		valueNode class == RBLiteralValueNode ifTrue: [
			typeSet := Set new add: (valueNode value class); yourself.
		] ifFalse: [
			self processNode: valueNode.
			(returnTypes hasValue and: returnTypes hasMultipleTypes) ifTrue: [
				typeSet := returnTypes types.
			] ifFalse: [
				typeSet := Set new add: (returnTypes types); yourself.
			].
		].
	].
	variableName := variableNode name.
	typesAdded := self addTypes: typeSet toVariable: variableName.
	typesAdded > 0 ifTrue: [
		(self variableNodeByName: variableName) propagate.
	].
	returnTypes unset.