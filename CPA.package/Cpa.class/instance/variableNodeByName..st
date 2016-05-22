accessing
variableNodeByName: aName
	"Returns the node in the graph by its name"
	
	| scope recipient |
	scope := currentScope.
	recipient := scope recipient.
	recipient ifNotNil: [ | instNode |
		instNode := self instanceVariableNodeByName: aName OfClass: recipient.
		instNode ifNotNil: [ ^ instNode ].
	].
	[ scope isNotNil ] whileTrue: [
		(scope containsVariable: aName) ifTrue: [
			^ scope variableNodeByName: aName.
		].
		scope := (scope parent).
	].

	^ nil