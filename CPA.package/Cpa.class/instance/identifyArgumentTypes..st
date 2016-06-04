identification
identifyArgumentTypes: anOrderedCollection
	| argTypes |
	argTypes := OrderedCollection new.
	anOrderedCollection do: [ :each |
		argTypes add: (self identifyReceiver: each).
	].
	^ argTypes