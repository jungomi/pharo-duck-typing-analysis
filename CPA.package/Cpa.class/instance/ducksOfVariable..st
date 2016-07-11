accessing
ducksOfVariable: aName
	"Returns a dictionary	containing the scope the variable was declared in and the duck types"

	^ self ducks at: aName ifAbsent: [ Dictionary new. ]