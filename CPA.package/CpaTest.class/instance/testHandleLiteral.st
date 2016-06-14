tests-handling
testHandleLiteral
	helper cpa handleLiteral: (helper parse: '0').
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: 0 class; yourself).
	helper cpa handleLiteral: (helper parse: '3.14').
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: 3.14 class; yourself).
	helper cpa handleLiteral: (helper parse: 'true').
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: true class; yourself).