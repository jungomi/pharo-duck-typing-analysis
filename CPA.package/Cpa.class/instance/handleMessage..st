handling
handleMessage: aMessageNode
	| receiver |
	receiver := self identifyReceiver: aMessageNode receiver.
	receiver isClass ifTrue: [
		"NOTE: return types are implicitly passed along"
		^ self handleClass: receiver selector: aMessageNode selector withArgs: aMessageNode arguments.
	].
	receiver class == Set ifTrue: [ | types duck |
		types := CpaReturn new.
		duck := CpaDuck new: aMessageNode selector.
		receiver do: [ :each |
			each class == CpaBlock ifTrue: [
				self handleBlockReceiver: each withSelector: aMessageNode selector andArgs: aMessageNode arguments.
			].
			each == #super ifTrue: [ | superReceiver |
				superReceiver := self identifySuperReceiver: aMessageNode selector.
				superReceiver ifNotNil: [
					self handleClass: superReceiver selector: aMessageNode selector
						superOf: currentScope receiver withArgs: aMessageNode arguments.
				].
			].
			each isClass ifTrue: [
				self handleClass: each selector: aMessageNode selector withArgs: aMessageNode arguments.
			].
			duck addType: each.
			types mergeReturnValues: returnTypes.
		].
		duck numTypes > 1 ifTrue: [ self addDuck: duck. ].
		^ returnTypes copyReturnValues: types.
	].
	"Is this case even possible? If it is then it will probably fail anyways"
	receiver ifNotNil: [
		self processNode: (RBParser parseCompiledMethod: receiver>>(aMessageNode selector)).
	].
