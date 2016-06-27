tests-identification
testIdentifyReceiverBlock
	| expected |
	expected := Set new add: CpaBlock; yourself.
	self assert: ((helper cpa identifyReceiver: (helper parse: '[ true ]')) collect: [ :each | each class ])
		equals: expected.
	self assert: ((helper cpa identifyReceiver: (helper parse: '[ [ true ] ]')) collect: [ :each | each class ])
		equals: expected.