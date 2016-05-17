accessing
variableNodeByNameCreateIfAbsent: aString
	"Returns the node in the graph by its name"
	"TODO: come up with a less preposterous method name"
	
	(variables keys includes: aString) ifFalse: [
		^ self newVariable: aString.
	].
	^ variables at: aString