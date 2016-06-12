handling
handleReturn: aNode
	self processNode: aNode value.
	returnTypes hasValue ifTrue: [
		currentScope returnTypes mergeReturnValues: returnTypes.
	] ifFalse: [ | node |
		node := aNode value.
		node class == RBLiteralValueNode ifTrue: [ currentScope returnTypes addType: node value class ].
		node class == RBAssignmentNode ifTrue: [ | varNode |
			varNode := self variableNodeByName: node variable name.
			varNode types isEmpty ifTrue: [
				currentScope returnTypes addUnknown.
			] ifFalse: [
				currentScope returnTypes addTypes: varNode types.
			].
		].
		node class == RBVariableNode ifTrue: [ | varNode |
				varNode := self variableNodeByName: node name.
			varNode ifNil: [
				currentScope returnTypes addUnknown
			] ifNotNil: [
				varNode types isEmpty ifTrue: [
					currentScope returnTypes addUnknown.
				] ifFalse: [
					currentScope returnTypes addTypes: varNode types.
				].
			].
		].
	].