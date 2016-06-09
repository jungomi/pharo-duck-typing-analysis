adding
newChild: aName ofBlock: aCpaBlock
	"Creates a child block method scope and sets its parent to the current scope"
	
	| child |
	child := CpaBlockMethodScope new: aName withBlock: aCpaBlock.
	child parent: self.
	self addChild: child.
	^ child