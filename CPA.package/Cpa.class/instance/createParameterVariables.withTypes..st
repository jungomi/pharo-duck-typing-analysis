adding
createParameterVariables: aMethodTemplate withTypes: aDictionary
	"Creates local variables for each argument of the method"

	aMethodTemplate variables ifNotNil: [
		aMethodTemplate variables keysAndValuesDo: [ :selector :variable | | varNode types |
			varNode := self newLocalVariable: variable.
			types := aDictionary at: selector.
			types class == Set ifTrue: [
				varNode addTypes: types
			] ifFalse: [
				varNode addType: types.
			].
		].
	].
