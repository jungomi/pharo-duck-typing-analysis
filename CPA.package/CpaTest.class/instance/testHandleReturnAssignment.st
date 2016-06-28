tests-handling
testHandleReturnAssignment
	| return |
	self deny: helper cpa currentScope returnTypes hasValue.
	return := '^ variable := unknownVariable'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: helper cpa currentScope returnTypes types equals: Set new.
	return := '^ variable := anotherVariable'.
	helper cpa addTypes: helper types toVariable: 'anotherVariable'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: helper cpa currentScope returnTypes types equals: helper types.