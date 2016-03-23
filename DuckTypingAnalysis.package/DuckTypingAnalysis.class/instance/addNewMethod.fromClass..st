adding
addNewMethod: aMethod fromClass: aClass
	"Adds a method and its corresponding class to the dictionary of new methods"

	(newMethodsDict at: aMethod ifAbsentPut: Set new) add: aClass