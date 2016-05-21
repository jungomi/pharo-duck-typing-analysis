processing
processNode: aNode
	"aNode class == RBLiteralValueNode ifTrue: [ self handleLiteral: aNode ]."
	aNode class == RBVariableNode ifTrue: [ self handleVariable: aNode ].
	aNode class == RBAssignmentNode ifTrue: [  self handleAssignment: aNode ].
	aNode class == RBMessageNode ifTrue: [  self handleMessage: aNode ].
	
	aNode statements do: [ :each | self processNode: each ].