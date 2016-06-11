handling
handleBlockReceiver: aCpaBlock withSelector: aSelector andArgs: anOrderedCollection
	aSelector == #value ifTrue: [
		^ returnTypes setTypes: aCpaBlock valueTypes.
	].
	(Cpa class: aCpaBlock receiver hasInstanceMethod: aSelector) ifTrue: [
		self handleBlock: aCpaBlock method: (aCpaBlock receiver)>>aSelector withArgs: anOrderedCollection.
	].