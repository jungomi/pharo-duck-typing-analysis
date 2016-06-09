handling
handleClass: aClass selector: aSelector withArgs: anOrderedCollection
	"TODO: refactor the duplicate parts and find initialize method that is called by new"
	self addClassInstanceVariables: aClass.
	aSelector == #new ifTrue: [
		(Cpa class: aClass hasMethod: #initialize) ifTrue: [
			self handleMethod: aClass>>#initialize withArgs: anOrderedCollection.
		].
		^ returnTypes setType: aClass.
	].
	aSelector == #new: ifTrue: [
		(Cpa class: aClass hasMethod: #initialize:) ifTrue: [
			self handleMethod: aClass>>#initialize: withArgs: anOrderedCollection.
		].
		^ returnTypes setType: aClass.
	].
	(Cpa class: aClass hasMethod: aSelector) ifTrue: [
		(self methodMustBeIntercepted: aClass>>aSelector) ifTrue: [
			^ returnTypes setTypes: currentScope block valueTypes.
		].
		self handleMethod: aClass>>aSelector withArgs: anOrderedCollection.
		returnTypes hasValue ifFalse: [ returnTypes setType: aClass ].
	].