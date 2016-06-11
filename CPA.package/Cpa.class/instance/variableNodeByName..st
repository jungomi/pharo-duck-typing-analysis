accessing
variableNodeByName: aName
	"Returns the node in the graph by its name"
	
	| scope recipient |
	currentScope class == CpaSuperMethodScope ifTrue: [
		recipient := currentScope originalReceiver.
	] ifFalse: [
		recipient := currentScope recipient.
	].
	recipient ifNotNil: [ | instNode |
		instNode := self instanceVariableNodeByName: aName OfClass: recipient.
		instNode ifNotNil: [ ^ instNode ].
	].
	scope := currentScope.
	[ scope isNotNil ] whileTrue: [
		(scope containsVariable: aName) ifTrue: [
			^ scope variableNodeByName: aName.
		].
		scope := scope parent.
	].

	^ nil