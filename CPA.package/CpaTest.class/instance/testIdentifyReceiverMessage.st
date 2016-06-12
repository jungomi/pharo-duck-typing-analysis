tests-identification
testIdentifyReceiverMessage
	helper createMocks.
	[ | types |
		types := Set new add: SmallInteger; yourself.
		self assert: (helper cpa identifyReceiver: (helper parse: 'TestClassMock myMethod')) equals: types.
	] ensure: [ helper deleteMocks. ].