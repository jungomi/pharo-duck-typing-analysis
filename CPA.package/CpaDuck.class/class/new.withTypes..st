instance creation
new: aSelector withTypes: aSet
	| duck |
	duck := self new.
	duck selector: aSelector.
	duck types: aSet.
	^ duck.