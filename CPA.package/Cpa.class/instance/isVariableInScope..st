testing
isVariableInScope: aName
	| scope |
	scope := currentScope.
	[ scope hasParent ] whileTrue: [
		(scope containsVariable: aName) ifTrue: [ ^ true ].
		scope := (scope parent).
	].
	^ false.