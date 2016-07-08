handling
handleMethod: aMethod withArgs: anOrderedCollection
	| argTypes temp conc |
	argTypes := self identifyArgumentTypes: anOrderedCollection.
	temp := repository methodTemplateOf: aMethod.
	temp ifNil: [
		temp := repository createTemplateFromClass: aMethod methodClass withSelector: aMethod selector.
	].
	conc := temp concreteMethodWithArgs: argTypes.
	conc ifNil: [
		conc := temp createConcreteMethodWithArgs: argTypes.
		self newScope: aMethod.
		self createParameterVariables: temp withTypes: conc selectorTypes.
		self processNode: (RBParser parseCompiledMethod: aMethod).
		conc failed: methodFailed.
		conc returnTypes copyReturnValues: currentScope returnTypes.
		self upOneScope.
	].
	self methodFailed: conc failed.
	returnTypes copyReturnValues: conc returnTypes.