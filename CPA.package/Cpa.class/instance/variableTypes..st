accessing
variableTypes: aName
	"Returns the types of a variable visible in the current scope"

	^ (self variableNodeByName: aName) types.