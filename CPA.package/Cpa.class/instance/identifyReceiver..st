identification
identifyReceiver: aNode
	aNode class == RBLiteralValueNode ifTrue: [ ^ aNode value class ].
	aNode class == RBVariableNode ifTrue: [ 
		^ aNode name asClassIfAbsent: [
			(self variableNodeByNameCreateIfAbsent: aNode name) types.
		].
	].
	aNode class == RBMessageNode ifTrue: [
		self handleMessage: aNode.
		^ returnTypes types.
	].
	aNode class == RBSuperNode ifTrue: [ ^ #super ].
	aNode class == RBSelfNode ifTrue: [
		^ currentScope class == CpaSuperMethodScope ifTrue: [
			currentScope originalReceiver.
		] ifFalse: [
			currentScope receiver.
		].
	].
	aNode class == RBBlockNode ifTrue: [
		self handleBlock: aNode.
		^ CpaBlock new: returnTypes types.
	].
	"Is there any other possible scenario?"
	^ nil