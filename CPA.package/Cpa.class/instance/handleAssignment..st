handling
handleAssignment: anAssignmentNode
	"TODO: different names to distinguish between CpaNode and RBNode, and refactor!"
	| typesAdded typeSet valueNode variableNode variableName |
	valueNode := anAssignmentNode value.
	variableNode := anAssignmentNode variable.
	valueNode class == RBVariableNode ifTrue: [ | cpaValueNode cpaVariableNode |
		cpaValueNode := self variableNodeByNameCreateIfAbsent: valueNode name.
		cpaVariableNode := self variableNodeByNameCreateIfAbsent: variableNode name.
		cpaValueNode addOutgoingNode: cpaVariableNode.
		cpaVariableNode addIncomingNode: cpaValueNode.
		typeSet := cpaValueNode types.
	] ifFalse: [
		valueNode class == RBLiteralValueNode ifTrue: [
			typeSet := Set new add: (valueNode value class); yourself.
		] ifFalse: [
			self processNode: valueNode.
			(returnTypes hasValue and: returnTypes isUnknown not) ifTrue: [
				typeSet := returnTypes types.
			] ifFalse: [
				typeSet := Set new.
			].
		].
	].
	variableName := variableNode name.
	typesAdded := self addTypes: typeSet toVariable: variableName.
	typesAdded > 0 ifTrue: [
		(self variableNodeByName: variableName) propagate.
	].
	returnTypes unset.