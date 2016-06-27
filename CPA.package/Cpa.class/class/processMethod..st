instance-creation
processMethod: aMethod
	| cpa |
	cpa := self new.
	cpa newScope: aMethod.
	cpa processNode: (RBParser parseCompiledMethod: aMethod).
	cpa returnTypes hasValue ifFalse: [ | receiver |
		receiver := cpa currentScope receiver.
		cpa returnTypes setType: receiver.
		cpa currentScope returnTypes setType: receiver.
	].
	cpa upOneScope.
	^ cpa