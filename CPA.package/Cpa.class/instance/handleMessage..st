handling
handleMessage: aMessageNode
	| receiver |
	receiver := self identifyReceiver: (aMessageNode receiver).
	receiver = 'super' ifTrue: [ ^ self handleSuper: (aMessageNode receiver) ].
	receiver isClass ifTrue: [
		"TODO: handle wrong selectors (probably because of parameters)"
		"^ (Cpa class: receiver hasMethod: (aMessageNode selector)) ifTrue: [
				self handleClass: receiver selector: (aMessageNode selector).
			]."
		^ self handleClass: receiver selector: (aMessageNode selector).
	].
	receiver class == Set ifTrue: [ | types duck |
		types := Set new.
		duck := CpaDuck new: (aMessageNode selector).
		receiver do: [ :each |
			(Cpa class: each hasMethod: (aMessageNode selector)) ifTrue: [
				duck addType: each.
				self handleClass: each selector: (aMessageNode selector).
				types add: (returnTypes types).
			].
		].
		duck numTypes > 1 ifTrue: [ self addDuck: duck. ].
		^ types isNotEmpty ifTrue: [ returnTypes setTypes: types. ].
	].
	"Is this case even possible? If it is then it will probably fail anyways"
	receiver isNotNil ifTrue: [
		self processNode: (RBParser parseCompiledMethod: (receiver>>(aMessageNode selector))).
	].