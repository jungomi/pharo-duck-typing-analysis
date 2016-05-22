as yet unclassified
addConcrete: aConcreteMethod at: aClass withSelector: aSelector
	"Adds a concrete type set to the corresponding template and creates it if it doesn't exist"

	| method |
	method := aClass>>aSelector.
	(templates includes: method) ifTrue: [ 
		(templates at: method) addConrete: aConcreteMethod.
	] ifFalse: [
		| temp |
		temp := CpaMethodTemplate new: aClass withSelector: aSelector.
		temp addConcrete: aConcreteMethod.
		temp at: method put: temp.
	].