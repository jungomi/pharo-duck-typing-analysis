tests-handling
testHandleBlockAssignment
	| block |
	block := '[ variable := anotherVariable ]'.
	helper cpa addTypes: helper types toVariable: 'anotherVariable'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types size equals: 1.
	helper cpa returnTypes types do: [ :each |
		self assert: each class equals: CpaBlock.
		self assert: each valueTypes equals: helper types.
	].
	block := '[ variable := unknownVariable ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types size equals: 1.
	helper cpa returnTypes types do: [ :each |
		self assert: each class equals: CpaBlock.
		self assert: each valueTypes equals: Set new.
	].
	block := '[ variable := anotherVariable. variable := unknownVariable ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types size equals: 1.
	helper cpa returnTypes types do: [ :each |
		self assert: each class equals: CpaBlock.
		self assert: each valueTypes equals: helper types.
	].