as yet unclassified
addConcrete: aDictionary atMethod: aMethod
	"Adds a concrete type set to the corresponding template"

	(templates at: aMethod) addConrete: aDictionary.