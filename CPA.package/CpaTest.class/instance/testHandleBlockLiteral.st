tests-handling
testHandleBlockLiteral
	| block |
	block := '[ 0 ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: 0 class; yourself).
	block := '[ 0. true ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: (Set new add: true class; yourself).