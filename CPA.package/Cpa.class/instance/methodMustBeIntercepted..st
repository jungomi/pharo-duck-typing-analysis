testing
methodMustBeIntercepted: aMethod
	self isCurrentlyInBlockMethod ifFalse: [ ^ false ].
	^ aMethod == ((currentScope block receiver)>>#value).