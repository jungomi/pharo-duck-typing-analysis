handling
handleMessage: aMessageNode
	| receiver |
	receiver := self identifyReceiver: (aMessageNode receiver).
	receiver = 'super' ifTrue: [ ^ self handleSuper: (aMessageNode receiver) ].
	receiver isClass ifTrue: [
		"TODO: handle wrong selectors (probably because of parameters)"
		^ (receiver respondsTo: (aMessageNode selector)) ifTrue: [
			self handleClass: receiver selector: (aMessageNode selector).
		].
	].
	receiver class == Set ifTrue: [ | types |
		types := Set new.
		receiver do: [ :each |
			self handleClass: each selector: (aMessageNode selector).
			types add: (returnTypes types).
		].
		^ types isNotEmpty ifTrue: [ returnTypes setTypes: types. ].
	].
	"Is this case even possible? If it is then it will probably fail anyways"
	receiver isNotNil ifTrue: [
		self processNode: (RBParser parseCompiledMethod: (receiver>>(aMessageNode selector))).
	].