instance creation
new: aName withBlock: aCpaBlock
	| scope |
	scope := self new.
	scope id: aName.
	scope block: aCpaBlock.
	^ scope