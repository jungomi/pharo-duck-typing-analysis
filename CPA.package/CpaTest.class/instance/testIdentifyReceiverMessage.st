tests-identification
testIdentifyReceiverMessage
	helper createMocks.
	[ | actualValue types |
		actualValue := helper mock new myMethod class.
		types := Set new add: actualValue; yourself.
		self assert: (helper cpa identifyReceiver: (helper parse: 'TestClassMock myMethod')) equals: types.
	] ensure: [ helper deleteMocks. ].