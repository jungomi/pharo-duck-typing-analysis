handling
handleMethod: aMethod superOf: aClass withArgs: anOrderedCollection
	| argTypes temp conc |
	argTypes := self identifyArgumentTypes: anOrderedCollection.
	temp := repository methodTemplateOf: aMethod.
	temp ifNil: [
		temp := repository createTemplateFromClass: aMethod methodClass withSelector: aMethod selector.
	].
	conc := temp concreteMethodWithArgs: argTypes.
	conc ifNil: [
		conc := temp createConcreteMethodWithArgs: argTypes.
		self newScope: aMethod superOf: aClass.
		self createParameterVariables: temp withTypes: conc selectorTypes.
		self processNode: (RBParser parseCompiledMethod: aMethod).
		conc returnTypes copyReturnValues: currentScope returnTypes.
		self upOneScope.
	].
	returnTypes copyReturnValues: conc returnTypes.