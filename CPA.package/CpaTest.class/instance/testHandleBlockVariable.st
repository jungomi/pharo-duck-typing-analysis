tests-handling
testHandleBlockVariable
	| block |
	block := '[ variable ]'.
	helper cpa addTypes: helper types toVariable: 'variable'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: helper types.
	block := '[ unknownVariable ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes isUnknown.	