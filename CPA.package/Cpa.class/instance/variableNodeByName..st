accessing
variableNodeByName: aName
	"Returns the node in the graph by its name"
	
	| scope receiver |
	currentScope class == CpaSuperMethodScope ifTrue: [
		receiver := currentScope originalReceiver.
	] ifFalse: [
		receiver := currentScope receiver.
	].
	receiver ifNotNil: [ | instNode |
		instNode := self instanceVariableNodeByName: aName OfClass: receiver.
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