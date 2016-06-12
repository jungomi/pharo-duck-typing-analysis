tests-handling
testHandleClassSelectorWithArgs
	helper createMocks.
	[ | mocks |
		mocks := Set new add: helper mock; add: helper subMock; yourself.
		mocks do: [ :each | | args |
			helper cpa handleClass: each selector: #myMethod withArgs: OrderedCollection new.
			self assert: helper cpa returnTypes hasValue.
			self assert: helper cpa returnTypes types equals: (Set new add: SmallInteger; yourself).
			helper cpa handleClass: each selector: #myMethodWithoutReturn withArgs: OrderedCollection new.
			self assert: helper cpa returnTypes hasValue.
			self assert: helper cpa returnTypes types equals: (Set new add: each; yourself).
			args := OrderedCollection new.
			args add: (helper parse: helper subMock asString).
			args add: (helper parse: '#myMethod').
			helper cpa handleClass: each selector: #myMethod:withArg: withArgs: args.
			self assert: helper cpa returnTypes hasValue.
			self assert: helper cpa returnTypes types equals: (Set new add: helper subMock; yourself).
		].
	] ensure: [ helper deleteMocks ].