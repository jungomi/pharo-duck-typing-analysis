adding
newBlockChild: aName
	"Creates a child block scope and sets its parent to the current scope"
	
	| child |
	child := CpaBlockScope new: aName inScope: methodScope.
	child parent: self.
	self addChild: child.
	^ child