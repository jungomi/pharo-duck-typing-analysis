accessing
variableNodeByNameCreateIfAbsent: aName
	"Returns the node in the graph by its name and creates it if necessary"
	
	^ (self variableNodeByName: aName) ifNil: [ self newLocalVariable: aName. ].
		