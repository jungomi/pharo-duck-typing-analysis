accessing
variableTypes: aName
	"Returns the types of a variable visible in the current scope"

	| varNode |
	varNode := self variableNodeByName: aName.
	^ varNode ifNotNil: [ varNode types ].