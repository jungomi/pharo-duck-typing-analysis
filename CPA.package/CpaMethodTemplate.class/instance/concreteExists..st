accessing
concreteExists: aDictionary
	concretes do: [ :each |
		each selectorTypes = aDictionary ifTrue: [ ^ true ].
	].
	^ false