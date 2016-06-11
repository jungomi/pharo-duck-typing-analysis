handling
handleMessage: aMessageNode
	| receiver |
	receiver := self identifyReceiver: (aMessageNode receiver).
	receiver == #super ifTrue: [ receiver := self identifySuperReceiver: aMessageNode selector ].
	receiver isClass ifTrue: [
		"NOTE: return types are implicitely passed along"
		^ self handleClass: receiver selector: (aMessageNode selector) withArgs: (aMessageNode arguments).
	].
	receiver class == Set ifTrue: [ | types duck |
		types := CpaReturn new.
		duck := CpaDuck new: (aMessageNode selector).
		receiver do: [ :each |
			each class == CpaBlock ifTrue: [
				self handleBlockReceiver: each withSelector: aMessageNode selector andArgs: aMessageNode arguments.
			] ifFalse: [
				duck addType: each.
				self handleClass: each selector: (aMessageNode selector) withArgs: (aMessageNode arguments).
				types mergeReturnValues: returnTypes.
			].
		].
		duck numTypes > 1 ifTrue: [ self addDuck: duck. ].
		^ returnTypes copyReturnValues: types.
	].
	receiver class == CpaBlock ifTrue: [
		^ self handleBlockReceiver: receiver withSelector: aMessageNode selector andArgs: aMessageNode arguments.
	].
	"Is this case even possible? If it is then it will probably fail anyways"
	receiver ifNotNil: [
		self processNode: (RBParser parseCompiledMethod: (receiver>>(aMessageNode selector))).
	].