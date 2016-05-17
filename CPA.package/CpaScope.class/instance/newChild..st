adding
newChild: aName
	"Creates a child scope and sets its parent to the current scope"
	
	| child |
	child := CpaScope new.
	child name: aName.
	child parent: self.
	self addChild: child.
	^ child