accessing
variables
	"Returns a dictionary with the variable names as keys associated to another dictionary
	containing the scope it was declared in and its types"
	
	| dict scopes |
	dict := Dictionary new.
	scopes := Stack new push: globalScope; yourself.
	[ scopes isNotEmpty ] whileTrue: [ | currScope |
		currScope := scopes pop.
		currScope children do: [ :each | scopes push: each ].
		currScope variables keysAndValuesDo: [ :name :variable | | values |
			values := variable values asSet.
			(dict at: name ifAbsentPut: Dictionary new) at: currScope id put: values.
		].
	].
	^ dict