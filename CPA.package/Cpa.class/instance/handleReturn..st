handling
handleReturn: aNode
	self processNode: aNode value.
	returnTypes hasValue ifTrue: [
		currentScope returnTypes mergeReturnValues: returnTypes.
	] ifFalse: [
		currentScope returnTypes addUnknown.
	].