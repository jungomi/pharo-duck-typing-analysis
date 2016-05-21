testing
isVariableInScope: aName
	| scope |
	scope := currentScope.
	[ scope isNotNil ] whileTrue: [
		(scope containsVariable: aName) ifTrue: [ ^ true ].
		scope := (scope parent).
	].
	^ false.