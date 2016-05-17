handling
handleMessage: aMessageNode
	| receiver |
	receiver := Cpa identifyReceiver: (aMessageNode receiver).
	receiver = 'super' ifTrue: [ ^ self handleSuper: (aMessageNode receiver) ].
	receiver isClass ifTrue: [ ^ self handleClass: receiver selector: (aMessageNode selector). ].
	self processNode: (RBParser parseMethod: ((receiver>>(aMessageNode selector)) asString)).