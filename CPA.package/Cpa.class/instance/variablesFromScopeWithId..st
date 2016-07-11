accessing
variablesFromScopeWithId: aName
	"Returns a dictionary containing the its variables and their types"
	
	| dict scopes |
	dict := Dictionary new.
	scopes := Stack new push: globalScope; yourself.
	[ scopes isNotEmpty ] whileTrue: [ | currScope |
		currScope := scopes pop.
		currScope children do: [ :each | scopes push: each ].
		currScope id = aName ifTrue: [
			currScope variables keysAndValuesDo: [ :name :variable |
				dict at: name put: variable values asSet.
			].
			^ dict.
		].
	].
	^ dict