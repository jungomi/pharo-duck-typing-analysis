accessing
variablesWithName: aName
	"Returns a dictionary	containing the scope it was declared in and its types"

	^ self variables at: aName ifAbsent: [ Dictionary new. ]