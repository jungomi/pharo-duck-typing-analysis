handling
handleClass: aClass selector: aSelector withArgs: anOrderedCollection
	| receiver selector |
	(self classMustBeIntercepted: aClass atSelector: aSelector) ifTrue: [
		^ returnTypes setTypes: currentScope block valueTypes.
	].
	receiver := aClass.
	selector := aSelector.
	(receiver class == Metaclass and: selector == #new) ifTrue: [
		(Cpa class: receiver hasMethod: selector) ifFalse: [
			receiver := receiver baseClass.
			selector := #initialize.
		].
	].
	self addClassInstanceVariables: receiver.
	receiver := Cpa class: receiver respondsTo: selector.
	receiver ifNil: [
		self methodFailed: true.
		^ returnTypes setUnknown.
	].
	(((aClass class == Metaclass and: selector == #initialize) and: receiver == aClass baseClass)
		or: (Cpa class: aClass hasMethod: selector)) ifTrue: [
		self handleMethod: receiver>>selector withArgs: anOrderedCollection.
	] ifFalse: [
		self handleMethod: receiver>>selector superOf: aClass withArgs: anOrderedCollection.
	].
	returnTypes hasValue ifFalse: [
		(aClass class == Metaclass and: aSelector == #new) ifTrue: [
			returnTypes setType: aClass baseClass.
		] ifFalse: [
			returnTypes setType: aClass.
		].
	].