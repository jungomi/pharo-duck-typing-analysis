tests-identification
testIdentifyReceiverBlock
	self assert: (helper cpa identifyReceiver: (helper parse: '[ true ]')) class equals: CpaBlock.
	self assert: (helper cpa identifyReceiver: (helper parse: '[ [ true ] ]')) class equals: CpaBlock.