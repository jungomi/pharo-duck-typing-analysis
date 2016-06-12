tests-identification
testIdentifyReceiverSelf
	helper createMocks.
	[
		self assert: (helper cpa identifyReceiver: (helper parse: 'self')) equals: nil.
		helper cpa newScope: helper mock.
		self assert: (helper cpa identifyReceiver: (helper parse: 'self')) equals: helper mock.
		helper cpa newScope: helper subMock.
		self assert: (helper cpa identifyReceiver: (helper parse: 'self')) equals: helper subMock.
		helper cpa newScope: helper subSubMock.
		self assert: (helper cpa identifyReceiver: (helper parse: 'self')) equals: helper subSubMock.
	] ensure: [ helper deleteMocks. ].