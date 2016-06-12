tests-identification
testIdentifyReceiverLiteral
	self assert: (helper cpa identifyReceiver: (helper parse: '1')) equals: 1 class.
	self assert: (helper cpa identifyReceiver: (helper parse: '3.14')) equals: 3.14 class.
	self assert: (helper cpa identifyReceiver: (helper parse: '''string''')) equals: 'string' class.
	self assert: (helper cpa identifyReceiver: (helper parse: 'true')) equals: true class.