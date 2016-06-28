adding
mergeTypes: aCpaReturn intoVariable: aName
	"Merge the types to a variable's typeset and returns the number of new types added"

	| typesDiff variable |
	variable := self variableNodeByNameCreateIfAbsent: aName.
	typesDiff := aCpaReturn difference: variable values.
	variable values mergeReturnValues: aCpaReturn.
	
	^ typesDiff size