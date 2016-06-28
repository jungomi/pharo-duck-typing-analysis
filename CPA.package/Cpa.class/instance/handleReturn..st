handling
handleReturn: aNode
	self processNode: aNode value.
	currentScope returnTypes mergeReturnValues: returnTypes.