handling
handleClass: aClass selector: aSelector
	"TODO: refactor the duplicate parts and find initialize method that is called by new"
	aSelector == #new ifTrue: [
		(aClass methodDict keys includes: #initialize) ifTrue: [
			self newScope: aClass>>#initialize.
			self processNode: (RBParser parseCompiledMethod: (aClass>>#initialize)).
			self upOneScope.
		].
		^ returnTypes setType: aClass.
	].
	aSelector == #new: ifTrue: [
		(aClass methodDict keys includes: #initialize:) ifTrue: [
			self newScope: aClass>>#initialize:.
			self processNode: (RBParser parseCompiledMethod: (aClass>>#initialize:)).
			self upOneScope.
		].
		^ returnTypes setType: aClass.
	].	
	self newScope: aClass>>aSelector.
	self processNode: (RBParser parseCompiledMethod: aClass>>aSelector).
	self upOneScope.
	returnTypes hasValue ifFalse: [ returnTypes setType: aClass ].