handling
handleClass: aClass selector: aSelector
	"TODO: refactor the duplicate parts and find initialize method that is called by new"
	aSelector == #new ifTrue: [
		^ (aClass methodDict keys includes: #initialize) ifTrue: [
			self processNode: (RBParser parseMethod: ((aClass>>#initialize) asString)).
		].
	].
	aSelector == #new: ifTrue: [
		^ (aClass methodDict keys includes: #initialize:) ifTrue: [
			self processNode: (RBParser parseMethod: ((aClass>>#initialize:) asString)).
		].
	].	
	self processNode: (RBParser parseMethod: (aClass>>aSelector asString)).