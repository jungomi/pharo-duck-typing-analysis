handling
handleBlock: aBlockNode
	"Evaluates the block and sets the return values to the types of the last statement (implicit return)"

	| numStatements |
	self newBlockScope: #block.
	numStatements := aBlockNode statements size.
	aBlockNode statements withIndexDo: [ :each :index |
		self processNode: each.
		index = numStatements ifTrue: [
			returnTypes hasValue ifFalse: [
				each class == RBAssignmentNode ifTrue: [
					returnTypes setTypes: (self variableNodeByName: each variable).
				].
				each class == RBVariableNode ifTrue: [
					returnTypes setTypes: (self variableNodeByName: each).
				].
				each class == RBLiteralValueNode ifTrue: [ returnTypes setType: (each value class) ].
			].
		].
	].
	self upOneScope.