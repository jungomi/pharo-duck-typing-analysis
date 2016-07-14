accessing
ducksFromScopeWithId: aName
	"Returns a dictionary containing the variable names and their possible duck types"
	
	| dict scopes |
	dict := Dictionary new.
	scopes := Stack new push: globalScope; yourself.
	[ scopes isNotEmpty ] whileTrue: [ | currScope |
		currScope := scopes pop.
		currScope children do: [ :each | scopes push: each ].
		currScope id = aName ifTrue: [
			currScope variables keysAndValuesDo: [ :name :variable | | duck |
				duck := Cpa removeSubclasses: variable ducks asSet.
				duck size > 1 ifTrue: [
					dict at: name put: duck.
				].
				^ dict.
			].
		].
	].
	^ dict