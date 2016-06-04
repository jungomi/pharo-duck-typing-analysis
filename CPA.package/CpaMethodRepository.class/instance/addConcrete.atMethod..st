as yet unclassified
addConcrete: aConcreteMethod atMethod: aMethod
	"Adds a concrete type set to the corresponding template"

	(templates at: aMethod) addConreteMethod: aConcreteMethod.