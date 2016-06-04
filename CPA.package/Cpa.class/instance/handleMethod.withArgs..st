handling
handleMethod: aMethod withArgs: anOrderedCollection
	| argTypes temp conc |
	argTypes := self identifyArgumentTypes: anOrderedCollection.
	temp := repository methodTemplateOf: aMethod.
	temp ifNil: [
		temp := repository createTemplateFromClass: (aMethod methodClass)  withSelector: (aMethod selector)
	].
	conc := temp concreteMethodWithArgs: argTypes.
	conc ifNil: [
		conc := temp createConcreteMethodWithArgs: argTypes.
		self newScope: aMethod.
		self processNode: (RBParser parseCompiledMethod: aMethod).
		self upOneScope.
		returnTypes hasValue ifTrue: [
			conc returnTypes: returnTypes types.
		] ifFalse: [
			conc returnTypes: Set new.
		].
	].
	^ returnTypes setTypes: (conc returnTypes)