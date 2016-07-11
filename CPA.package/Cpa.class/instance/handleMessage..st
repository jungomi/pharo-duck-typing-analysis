handling
handleMessage: aMessageNode
	| receiver variable types oneSuccess |
	variable := nil.
	receiver := self identifyReceiver: aMessageNode receiver.
	receiver class == CpaNode ifTrue: [
		variable := receiver.
		receiver := variable values types.
		(variable values hasValue not or: variable values isUnknown) ifTrue: [
			^ variable ducks setTypes: Set new.
		].
		variable ducks hasValue ifFalse: [
			receiver size < 2
				ifTrue: [ variable ducks setTypes: Set new. ]
				ifFalse: [ variable ducks setTypes: receiver copy. ].
		].
	].
	types := CpaReturn new.
	oneSuccess := false.
	receiver do: [ :each |
		self methodFailed: false.
		each class == CpaBlock ifTrue: [
			self handleBlockReceiver: each withSelector: aMessageNode selector
				andArgs: aMessageNode arguments.
		].
		each == #super ifTrue: [ | superReceiver |
			superReceiver := self identifySuperReceiver: aMessageNode selector.
			superReceiver ifNotNil: [
				self handleClass: superReceiver selector: aMessageNode selector
					superOf: currentScope receiver withArgs: aMessageNode arguments.
			].
		].
		each isClass ifTrue: [
			self handleClass: each selector: aMessageNode selector
				withArgs: aMessageNode arguments.
		].
		variable ifNotNil: [
			(methodFailed and: (variable ducks types includes: each)) ifTrue: [
				variable ducks removeType: each.
				variable ducks hasValue ifTrue: [
					(variable ducks isUnknown
						or: (variable ducks types size == 1 and: variable ducks isIncomplete not)) ifTrue: [
							variable ducks setTypes: Set new.
						].
				] ifFalse: [ variable ducks setTypes: Set new. ].
			].
		].
		methodFailed ifFalse: [ oneSuccess := true ].
		types mergeReturnValues: returnTypes.
	].
	self methodFailed: oneSuccess not.
	^ returnTypes copyReturnValues: types.