identification
identifyArgumentTypes: anOrderedCollection
	| argTypes |
	argTypes := OrderedCollection new.
	anOrderedCollection do: [ :each | | receiver |
		receiver := self identifyReceiver: each.
		receiver class == CpaNode ifTrue: [
			receiver := receiver values.
			receiver hasValue ifFalse: [ receiver setUnknown ].
		].
		argTypes add: receiver.
	].
	^ argTypes