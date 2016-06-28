tests-handling
testHandleBlockVariable
	| block |
	block := '[ variable ]'.
	helper cpa addTypes: helper types toVariable: 'variable'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types size equals: 1.
	helper cpa returnTypes types do: [ :each |
		self assert: each class equals: CpaBlock.
		self assert: each valueTypes equals: helper types.
	].
	block := '[ unknownVariable ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types size equals: 1.
	helper cpa returnTypes types do: [ :each |
		self assert: each class equals: CpaBlock.
		self assert: each valueTypes equals: Set new.
	].