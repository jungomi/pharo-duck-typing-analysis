tests-identification
testIdentifyReceiverVariable
	| types |
	self assert: (helper cpa identifyReceiver: (helper parse: 'Object')) equals: Object.
	self assert: (helper cpa identifyReceiver: (helper parse: 'Cpa')) equals: Cpa.
	
	types := Set new add: SmallInteger; add: Float; yourself.
	self assert: (helper cpa identifyReceiver: (helper parse: 'variable')) equals: Set new.
	helper cpa addTypes: types toVariable: 'variable'.
	self assert: (helper cpa identifyReceiver: (helper parse: 'variable')) equals: types.