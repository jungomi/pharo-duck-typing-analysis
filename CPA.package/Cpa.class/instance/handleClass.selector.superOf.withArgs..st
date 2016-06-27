handling
handleClass: aClass selector: aSelector superOf: anotherClass withArgs: anOrderedCollection
	"Handles a super call, this is only called when the (super) receiver has already been identified"

	| receiver selector subClass |
	self halt.
	(self classMustBeIntercepted: aClass atSelector: aSelector) ifTrue: [
		^ returnTypes setTypes: currentScope block valueTypes.
	].
	receiver := aClass.
	selector := aSelector.
	subClass := anotherClass.
	(receiver class == Metaclass and: selector == #new) ifTrue: [
		(Cpa class: receiver hasMethod: selector) ifFalse: [
			receiver := receiver baseClass.
			selector := #initialize.
			subClass := subClass baseClass.
		].
	].
	self addClassInstanceVariables: anotherClass.
	self handleMethod: receiver>>selector superOf: subClass withArgs: anOrderedCollection.
	returnTypes hasValue ifFalse: [ returnTypes setType: anotherClass. ].