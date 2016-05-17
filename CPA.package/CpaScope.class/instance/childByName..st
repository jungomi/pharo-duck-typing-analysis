accessing
childByName: aName
	^ children detect: [ :each | each name = aName ].