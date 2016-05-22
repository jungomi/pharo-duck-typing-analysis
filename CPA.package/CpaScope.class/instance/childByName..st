accessing
childByName: aName
	^ children detect: [ :each | each id = aName ].