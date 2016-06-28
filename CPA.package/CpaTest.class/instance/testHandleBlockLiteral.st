tests-handling
testHandleBlockLiteral
	| block |
	block := '[ 0 ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types size equals: 1.
	helper cpa returnTypes types do: [ :each |
		self assert: each class equals: CpaBlock.
		self assert: each valueTypes equals: (helper singletonSet: 0 class).
	].
	block := '[ 0. true ]'.
	helper cpa handleBlock: (helper parse: block).
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types size equals: 1.
	helper cpa returnTypes types do: [ :each |
		self assert: each class equals: CpaBlock.
		self assert: each valueTypes equals: (helper singletonSet: true class).
	].