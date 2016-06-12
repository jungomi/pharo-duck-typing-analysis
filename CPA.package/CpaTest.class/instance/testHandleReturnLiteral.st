tests-handling
testHandleReturnLiteral
	| return |
	return := '^ 0'.
	self deny: helper cpa currentScope returnTypes hasValue.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: (helper cpa currentScope returnTypes types includes: SmallInteger).
	return := '^ 3.14'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: (helper cpa currentScope returnTypes types includes: SmallInteger).
	self assert: (helper cpa currentScope returnTypes types includes: Float).
	return := '^ true'.
	helper cpa handleReturn: (helper parse: return).
	self assert: helper cpa currentScope returnTypes hasValue.
	self assert: (helper cpa currentScope returnTypes types includes: SmallInteger).
	self assert: (helper cpa currentScope returnTypes types includes: Float).
	self assert: (helper cpa currentScope returnTypes types includes: True).
	