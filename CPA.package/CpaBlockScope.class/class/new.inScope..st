instance creation
new: aName inScope: aCpaScope
	| block |
	block := self new: aName.
	block methodScope: aCpaScope.
	^ block