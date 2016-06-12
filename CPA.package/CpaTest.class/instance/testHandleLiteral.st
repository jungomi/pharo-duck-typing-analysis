tests-handling
testHandleLiteral
	helper cpa handleLiteral: (helper parse: '0').
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: SmallInteger; yourself).
	helper cpa handleLiteral: (helper parse: '3.14').
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: Float; yourself).
	helper cpa handleLiteral: (helper parse: 'true').
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: True; yourself).