tests-handling
testHandleClassSelectorWithArgs
	helper createMocks.
	[ | mocks |
		mocks := Set new add: helper mock; add: helper subMock; yourself.
		mocks do: [ :each | | args actualValue instance |
			instance := each new.
			helper cpa handleClass: each selector: #myMethod withArgs: OrderedCollection new.
			actualValue := instance myMethod class.
			self assert: helper cpa returnTypes hasValue.
			self assert: helper cpa returnTypes types equals: (Set new add: actualValue; yourself).
			helper cpa handleClass: each selector: #myMethodWithoutReturn withArgs: OrderedCollection new.
			actualValue := instance myMethodWithoutReturn class.
			self assert: helper cpa returnTypes hasValue.
			self assert: helper cpa returnTypes types equals: (Set new add: actualValue; yourself).
			args := OrderedCollection new.
			args add: (helper parse: helper subMock asString).
			args add: (helper parse: '#myMethod').
			helper cpa handleClass: each selector: #myMethod:withArg: withArgs: args.
			actualValue := (instance myMethod: helper subMock withArg: #myMethod) class.
			self assert: helper cpa returnTypes hasValue.
			self assert: helper cpa returnTypes types equals: (Set new add: actualValue; yourself).
		].
	] ensure: [ helper deleteMocks ].