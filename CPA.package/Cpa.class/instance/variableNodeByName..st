accessing
variableNodeByName: aName
	"Returns the node in the graph by its name"
	
	| scope |
	scope := currentScope.
	[ scope isNotNil ] whileTrue: [
		(scope containsVariable: aName) ifTrue: [
			^ scope variableNodeByName: aName.
		].
		scope := (scope parent).
	].

	^ nil