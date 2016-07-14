processing
processExpression: aString
	self processNode: (RBParser parseExpression: aString).