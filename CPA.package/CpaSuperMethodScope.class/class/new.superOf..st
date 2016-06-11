instance creation
new: aName superOf: aClass
	| superScope |
	superScope := self new: aName.
	superScope originalReceiver: aClass.
	^ superScope