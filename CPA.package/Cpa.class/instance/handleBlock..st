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
				each class == RBLiteralValueNode ifTrue: [ returnTypes setType: (each value class) ].
				each class == RBAssignmentNode ifTrue: [ | varNode |
					varNode := self variableNodeByName: each variable name.
					varNode types isEmpty ifTrue: [
						returnTypes setUnknown.
					] ifFalse: [
						returnTypes setTypes: varNode types.
					].
				].
				each class == RBVariableNode ifTrue: [ | varNode |
					varNode := self variableNodeByName: each name.
					varNode ifNil: [
						returnTypes setUnknown
					] ifNotNil: [
						varNode types isEmpty ifTrue: [
							returnTypes setUnknown.
						] ifFalse: [
							returnTypes setTypes: varNode types.
						].
					].
				].
			].
		].
	].
	self upOneScope.