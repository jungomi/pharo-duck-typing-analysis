accessing
ducks
	"Returns a dictionary with the variable names as keys associated to another dictionary
	containing the scope it was declared in and its possible duck types"
	
	| dict scopes |
	dict := Dictionary new.
	scopes := Stack new push: globalScope; yourself.
	[ scopes isNotEmpty ] whileTrue: [ | currScope |
		currScope := scopes pop.
		currScope children do: [ :each | scopes push: each ].
		currScope variables keysAndValuesDo: [ :name :variable | | duck |
			duck := Cpa removeSubclasses: variable ducks asSet.
			duck size > 1 ifTrue: [
				(dict at: name ifAbsentPut: Dictionary new) at: currScope id put: duck.
			].
		].
	].
	^ dict