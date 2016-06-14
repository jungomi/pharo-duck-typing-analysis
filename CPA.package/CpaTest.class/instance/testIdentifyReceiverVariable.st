tests-identification
testIdentifyReceiverVariable
	self assert: (helper cpa identifyReceiver: (helper parse: 'Object')) equals: Object.
	self assert: (helper cpa identifyReceiver: (helper parse: 'Cpa')) equals: Cpa.
	
	self assert: (helper cpa identifyReceiver: (helper parse: 'variable')) equals: Set new.
	helper cpa addTypes: helper types toVariable: 'variable'.
	self assert: (helper cpa identifyReceiver: (helper parse: 'variable')) equals: helper types.