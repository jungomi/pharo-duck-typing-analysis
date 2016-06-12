tests-handling
testHandleReturnVariable
	| return |
	self deny: helper cpa currentScope returnTypes hasValue.
	return := '^ unknownVariable'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: helper cpa currentScope returnTypes isUnknown.
	return := '^ variable'.
	helper cpa addTypes: helper types toVariable: 'variable'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: helper cpa currentScope returnTypes types equals: helper types.