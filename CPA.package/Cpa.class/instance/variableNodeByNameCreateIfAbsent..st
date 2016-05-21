accessing
variableNodeByNameCreateIfAbsent: aName
	"Returns the node in the graph by its name"
	"TODO: come up with a less preposterous method name"
	
	| scope |
	scope := currentScope.
	[ scope isNotNil ] whileTrue: [
		(scope containsVariable: aName) ifTrue: [
			^ scope variableNodeByName: aName.
		].
		scope := (scope parent).
	].
	^ self newLocalVariable: aName.