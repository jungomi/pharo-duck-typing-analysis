processing
processMethod: aMethod
	self newScope: aMethod.
	self processNode: (RBParser parseCompiledMethod: aMethod).
	returnTypes hasValue ifFalse: [
		returnTypes setType: currentScope receiver.
		currentScope returnTypes setType: currentScope receiver.
	].
	self upOneScope.