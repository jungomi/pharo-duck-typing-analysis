instance creation
new: aSet
	| block |
	block := self new.
	block valueTypes: aSet.
	^ block