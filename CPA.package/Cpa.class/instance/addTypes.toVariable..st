adding
addTypes: aSet toVariable: aName
	"Adds types to a variable's typeset and returns the number of new types added"

	| typesDiff variable |
	variable := self variableNodeByNameCreateIfAbsent: aName.
	typesDiff := aSet difference: variable types.
	typesDiff do: [ :each | variable addType: each ].
	
	^ typesDiff size