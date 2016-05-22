handling
handleMessage: aMessageNode
	| receiver |
	receiver := self identifyReceiver: (aMessageNode receiver).
	receiver = 'super' ifTrue: [ ^ self handleSuper: (aMessageNode receiver) ].
	receiver isClass ifTrue: [ ^ self handleClass: receiver selector: (aMessageNode selector). ].
	receiver class == Set ifTrue: [ | types |
		types := Set new.
		receiver do: [ :each |
			self handleClass: each selector: (aMessageNode selector).
			types add: (returnTypes types).
		].
		^ returnTypes setTypes: types.
	].
	"Is this case even possible? If it is then it will probably fail anyways"
	self processNode: (RBParser parseCompiledMethod: (receiver>>(aMessageNode selector))).