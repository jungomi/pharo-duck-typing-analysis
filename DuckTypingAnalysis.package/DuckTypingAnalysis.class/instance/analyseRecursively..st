analyzing
analyseRecursively: aClass
	self analyseClass: aClass.
	aClass subclassesDo: [ :each | self analyseRecursively: each ].