tests-identification
testIdentifyReceiverSuper
	self assert: (helper cpa identifyReceiver: (helper parse: 'super'))
		equals: (helper singletonSet: #super).
