identification
identifyReceiver: aNode
	"Returns a set containing the possible receivers"
	| receivers |
	receivers := Set new.
	aNode class == RBLiteralValueNode ifTrue: [ ^ receivers add: aNode value class; yourself ].
	aNode class == RBVariableNode ifTrue: [
		aNode name == #Smalltalk ifTrue: [ ^ receivers add: Smalltalk class; yourself ].
		aNode name asClassIfPresent: [ :cl | ^ receivers add: cl class; yourself ].
		^ (self variableNodeByNameCreateIfAbsent: aNode name) values types.
	].
	aNode class == RBMessageNode ifTrue: [
		self handleMessage: aNode.
		^ (returnTypes hasValue and: returnTypes isUnknown not) ifTrue: [
			returnTypes types.
		] ifFalse: [
			Set new.
		].
	].
	aNode class == RBSuperNode ifTrue: [ ^ receivers add: #super; yourself ].
	aNode class == RBSelfNode ifTrue: [
		^ currentScope class == CpaSuperMethodScope ifTrue: [
			receivers add: currentScope originalReceiver; yourself.
		] ifFalse: [
			receivers add: currentScope receiver; yourself.
		].
	].
	aNode class == RBBlockNode ifTrue: [
		self handleBlock: aNode.
		^ receivers add: (CpaBlock new: returnTypes types); yourself.
	].
	"Is there any other possible scenario?"
	^ receivers add: nil; yourself.