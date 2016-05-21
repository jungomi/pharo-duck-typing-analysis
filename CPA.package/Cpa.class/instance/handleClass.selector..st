handling
handleClass: aClass selector: aSelector
	"TODO: refactor the duplicate parts and find initialize method that is called by new"
	aSelector == #new ifTrue: [
		^ (aClass methodDict keys includes: #initialize) ifTrue: [
			self newScope: aClass>>#initialize.
			self processNode: (RBParser parseMethod: ((aClass>>#initialize) asString)).
			self upOneScope.
		].
	].
	aSelector == #new: ifTrue: [
		^ (aClass methodDict keys includes: #initialize:) ifTrue: [
			self newScope: aClass>>#initialize:.
			self processNode: (RBParser parseMethod: ((aClass>>#initialize:) asString)).
			self upOneScope.
		].
	].	
	self newScope: aClass>>aSelector.
	self processNode: (RBParser parseMethod: (aClass>>aSelector asString)).
	self upOneScope.