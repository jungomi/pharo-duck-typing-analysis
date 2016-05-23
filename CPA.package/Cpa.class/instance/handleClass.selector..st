handling
handleClass: aClass selector: aSelector
	"TODO: refactor the duplicate parts and find initialize method that is called by new"
	self addClassInstanceVariables: aClass.
	aSelector == #new ifTrue: [
		(Cpa class: aClass hasMethod: #initialize) ifTrue: [
			self newScope: aClass>>#initialize.
			self processNode: (RBParser parseCompiledMethod: (aClass>>#initialize)).
			self upOneScope.
		].
		^ returnTypes setType: aClass.
	].
	aSelector == #new: ifTrue: [
		(Cpa class: aClass hasMethod: #initialize:) ifTrue: [
			self newScope: aClass>>#initialize:.
			self processNode: (RBParser parseCompiledMethod: (aClass>>#initialize:)).
			self upOneScope.
		].
		^ returnTypes setType: aClass.
	].
	(Cpa class: aClass hasMethod: aSelector) ifTrue: [
		self newScope: aClass>>aSelector.
		self processNode: (RBParser parseCompiledMethod: aClass>>aSelector).
		self upOneScope.
		returnTypes hasValue ifFalse: [ returnTypes setType: aClass ].
	].