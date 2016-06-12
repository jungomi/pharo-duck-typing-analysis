tests-identification
testIdentifySuperReceiver
	helper createMocks.
	[
		self assert: (helper cpa identifySuperReceiver: #myMethod) equals: nil.
		helper cpa newScope: helper mock.
		self assert: (helper cpa identifySuperReceiver: #myMethod) equals: nil.
		helper cpa newScope: helper subMock.
		self assert: (helper cpa identifySuperReceiver: #myMethod) equals: helper mock.
		helper cpa newScope: helper subSubMock.
		self assert: (helper cpa identifySuperReceiver: #myMethod) equals: helper mock.
		helper cpa newScope: true.
		self assert: (helper cpa identifySuperReceiver: #myMethod) equals: nil.
		helper cpa newScope: #symbol.
		self assert: (helper cpa identifySuperReceiver: #myMethod) equals: nil.
	] ensure: [ helper deleteMocks ].