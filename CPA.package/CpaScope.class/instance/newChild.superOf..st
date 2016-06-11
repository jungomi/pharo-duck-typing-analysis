adding
newChild: aName superOf: aClass
	"Creates a child block method scope and sets its parent to the current scope"
	
	| child |
	child := CpaSuperMethodScope new: aName superOf: aClass.
	child parent: self.
	self addChild: child.
	^ child