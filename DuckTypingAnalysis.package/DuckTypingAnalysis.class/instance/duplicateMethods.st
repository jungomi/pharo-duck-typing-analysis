accessing
duplicateMethods
	^ newMethodsDict select: [ :each | each size > 1 ].