tests-handling
testHandleBlockReceiverWithSelectorAndArgs
	| block |
	block := CpaBlock new: helper types.
	helper cpa handleBlockReceiver: block withSelector: #value andArgs: OrderedCollection new.
	self assert: helper cpa returnTypes hasValue.
	self assert: helper cpa returnTypes types equals: block valueTypes.
	self setUp.
	self testHandleBlockMethodWithArgs.
	