handling
handleAssignment: anAssignmentNode
	| typesAdded typeSet variableName |
	anAssignmentNode class == RBLiteralValueNode ifTrue: [
		typeSet := Set new add: (anAssignmentNode value value class); yourself.
	] ifFalse: [
		typeSet := self processNode: (anAssignmentNode value).
	].
	variableName := anAssignmentNode variable name.
	typesAdded := self addTypes: typeSet toVariable: variableName.
	typesAdded > 0 ifTrue: [
		self variableNodeByNameCreateIfAbsent: variableName propagate.
	].