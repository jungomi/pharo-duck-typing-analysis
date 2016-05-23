instance creation
new: aSelector
	| duck |
	duck := self new.
	duck selector: aSelector.
	^ duck.