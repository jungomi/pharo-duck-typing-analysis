instance creation
new: aName
	| scope |
	scope := self new.
	scope id: aName.
	^ scope