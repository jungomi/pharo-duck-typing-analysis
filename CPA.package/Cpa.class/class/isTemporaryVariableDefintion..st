as yet unclassified
isTemporaryVariableDefintion: aVariableNode
	"Returns whether the variable is temporary"
	
	"try-catch"
	[
		^ (aVariableNode parent leftBar) < (aVariableNode start)
			and: (aVariableNode start) < (aVariableNode parent rightBar)
	] on: MessageNotUnderstood do: [ ^ false. ].