handling
handleBlock: aCpaBlock method: aMethod withArgs: anOrderedCollection
	| argTypes temp conc |
	argTypes := self identifyArgumentTypes: anOrderedCollection.
	temp := repository methodTemplateOf: aMethod.
	temp ifNil: [
		temp := repository createBlockTemplateFromClass: aMethod methodClass withSelector: aMethod selector.
	].
	conc := temp concreteMethodWithArgs: argTypes andValue: aCpaBlock valueTypes.
	conc ifNil: [
		conc := temp createConcreteMethodWithArgs: argTypes andValue: aCpaBlock valueTypes.
		self newScope: aMethod ofBlock: aCpaBlock.
		self createParameterVariables: temp withTypes: conc selectorTypes.
		self processNode: (RBParser parseCompiledMethod: aMethod).
		conc returnTypes copyReturnValues: currentScope returnTypes.
		self upOneScope.
	].
	returnTypes copyReturnValues: conc returnTypes.