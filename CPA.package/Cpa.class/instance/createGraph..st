adding
createGraph: aString
	"Creates a graph from a program given as string"
	
	| newGraph tree |
	tree := RBParser parseExpression: aString.
	newGraph := CpaGraph new.
	self processNode: tree.