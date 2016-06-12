tests-handling
testHandleBlockAssignment
	| block |
	block := '[ variable := anotherVariable ]'.
	helper cpa addTypes: helper types toVariable: 'anotherVariable'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: helper types.
	block := '[ variable := unknownVariable ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes isUnknown.	
	block := '[ variable := anotherVariable. variable := unknownVariable ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: helper types.