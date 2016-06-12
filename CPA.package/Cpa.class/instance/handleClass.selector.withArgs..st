handling
handleClass: aClass selector: aSelector withArgs: anOrderedCollection
	| receiver selector |
	self addClassInstanceVariables: aClass.
	(self classMustBeIntercepted: aClass atSelector: aSelector) ifTrue: [
		^ returnTypes setTypes: currentScope block valueTypes.
	].
	selector := aSelector.
	aSelector == #new ifTrue: [
		(Cpa class: aClass hasClassMethod: #new) ifTrue: [
			^ self handleMethod: (aClass class)>>#new withArgs: anOrderedCollection.
		].
		selector := #initialize.
	].
	receiver := Cpa class: aClass respondsTo: selector.
	receiver ifNil: [ ^ returnTypes setUnknown. ].
	(Cpa class: aClass hasMethod: selector) ifTrue: [
		self handleMethod: receiver>>selector withArgs: anOrderedCollection.
	] ifFalse: [
		self handleMethod: receiver>>selector superOf: aClass withArgs: anOrderedCollection.
	].
	returnTypes hasValue ifFalse: [ returnTypes setType: aClass. ].