handling
handleAssignment: anAssignmentNode
	| typesAdded typeSet rbValueNode rbVariableNode variableName |
	rbValueNode := anAssignmentNode value.
	rbVariableNode := anAssignmentNode variable.
	rbValueNode class == RBVariableNode ifTrue: [ | cpaValueNode cpaVariableNode |
		cpaValueNode := self variableNodeByNameCreateIfAbsent: rbValueNode name.
		cpaVariableNode := self variableNodeByNameCreateIfAbsent: rbVariableNode name.
		cpaValueNode addOutgoingNode: cpaVariableNode.
		cpaVariableNode addIncomingNode: cpaValueNode.
		typeSet := cpaValueNode types.
	] ifFalse: [
		rbValueNode class == RBLiteralValueNode ifTrue: [
			typeSet := Set new add: rbValueNode value class; yourself.
		] ifFalse: [
			self processNode: rbValueNode.
			(returnTypes hasValue and: returnTypes isUnknown not) ifTrue: [
				typeSet := returnTypes types.
			] ifFalse: [
				typeSet := Set new.
			].
		].
	].
	variableName := rbVariableNode name.
	typesAdded := self addTypes: typeSet toVariable: variableName.
	typesAdded > 0 ifTrue: [
		(self variableNodeByName: variableName) propagate.
	].
	returnTypes unset.