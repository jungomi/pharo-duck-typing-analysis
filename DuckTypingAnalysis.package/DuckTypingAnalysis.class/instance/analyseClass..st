analyzing
analyseClass: aClass
  "Checks for new methods defined in a class and adds it to newMethodsDict"

	| newlyDefinedMethods |
	newlyDefinedMethods := aClass methodDictionary keys reject: [ :each |
		aClass superclass canUnderstand: each
	].
	newlyDefinedMethods do: [ :each | self addNewMethod: each fromClass: aClass ]