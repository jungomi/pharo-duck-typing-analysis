identification
identifyReceiver: aNode
	aNode class == RBVariableNode ifTrue: [ 
		^ aNode name asClassIfAbsent: [
			self variableNodeByNameCreateIfAbsent: (aNode name).
		].
	].
	aNode class == RBMessageNode ifTrue: [  ^ self handleMessage: aNode ].
	aNode class == RBSuperNode ifTrue: [ ^ 'super' ].
	"Is there any other possible scenario?"