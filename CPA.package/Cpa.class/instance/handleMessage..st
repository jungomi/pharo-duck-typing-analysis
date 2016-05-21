handling
handleMessage: aMessageNode
	| receiver |
	receiver := self identifyReceiver: (aMessageNode receiver).
	receiver = 'super' ifTrue: [ ^ self handleSuper: (aMessageNode receiver) ].
	receiver isClass ifTrue: [ ^ self handleClass: receiver selector: (aMessageNode selector). ].
	"Is this case even possible? If it is then it will probably fail anyways"
	self processNode: (RBParser parseMethod: ((receiver>>(aMessageNode selector)) asString)).