tests-handling
testHandleReturnLiteral
	| return |
	return := '^ 0'.
	self deny: helper cpa currentScope returnTypes hasValue.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: (helper cpa currentScope returnTypes types includes: 0 class).
	return := '^ 3.14'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: (helper cpa currentScope returnTypes types includes: 0 class).
	self assert: (helper cpa currentScope returnTypes types includes: 3.14 class).
	return := '^ true'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: (helper cpa currentScope returnTypes types includes: 0 class).
	self assert: (helper cpa currentScope returnTypes types includes: 3.14 class).
	self assert: (helper cpa currentScope returnTypes types includes: true class).
	