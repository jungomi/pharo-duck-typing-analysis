tests-identification
testIdentifyReceiverSelf
	helper createMocks.
	[
		self assert: (helper cpa identifyReceiver: (helper parse: 'self'))
			equals: (helper singletonSet: nil).
		helper cpa newScope: helper mock.
		self assert: (helper cpa identifyReceiver: (helper parse: 'self'))
			equals: (helper singletonSet: helper mock).
		helper cpa newScope: helper subMock.
		self assert: (helper cpa identifyReceiver: (helper parse: 'self'))
			equals: (helper singletonSet: helper subMock).
		helper cpa newScope: helper subSubMock.
		self assert: (helper cpa identifyReceiver: (helper parse: 'self'))
			equals: (helper singletonSet: helper subSubMock).
	] ensure: [ helper deleteMocks. ].
