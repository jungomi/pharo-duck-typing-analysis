tests-identification
testIdentifyReceiverVariable
	| receiver |
	self assert: (helper cpa identifyReceiver: (helper parse: 'Object'))
		equals: (helper singletonSet: Object class).
	self assert: (helper cpa identifyReceiver: (helper parse: 'Cpa'))
		equals: (helper singletonSet: Cpa class).
	receiver := helper cpa identifyReceiver: (helper parse: 'variable').
	self assert: (receiver isKindOf: CpaNode).
	self deny: receiver values hasValue.
	helper cpa addTypes: helper types toVariable: 'variable'.
	receiver := helper cpa identifyReceiver: (helper parse: 'variable').
	self assert: (receiver isKindOf: CpaNode).
	self assert: receiver values hasValue.
	self assert: receiver values types equals: helper types.