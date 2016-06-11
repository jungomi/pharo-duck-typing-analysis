testing
classMustBeIntercepted: aClass atSelector: aSelector
	self isCurrentlyInBlockMethod ifFalse: [ ^ false ].
	^ currentScope block receiver == aClass and: aSelector == #value.