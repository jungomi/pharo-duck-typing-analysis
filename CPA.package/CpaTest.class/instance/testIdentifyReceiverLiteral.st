tests-identification
testIdentifyReceiverLiteral
	self assert: (helper cpa identifyReceiver: (helper parse: '1'))
		equals: (helper singletonSet: 1 class).
	self assert: (helper cpa identifyReceiver: (helper parse: '3.14'))
		equals: (helper singletonSet: 3.14 class).
	self assert: (helper cpa identifyReceiver: (helper parse: '''string'''))
		equals: (helper singletonSet: 'string' class).
	self assert: (helper cpa identifyReceiver: (helper parse: 'true'))
		equals: (helper singletonSet: true class).