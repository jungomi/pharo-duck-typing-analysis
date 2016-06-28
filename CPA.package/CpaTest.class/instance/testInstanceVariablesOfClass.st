tests-accessing
testInstanceVariablesOfClass
	| var classVars |
	var := 'variable'.
	classVars := helper cpa instanceVariablesOfClass: Cpa.
	self assert: classVars equals: nil.
	helper cpa addTypes: helper types toInstanceVariable: var atClass: Cpa.
	classVars := helper cpa instanceVariablesOfClass: Cpa.
	self assert: classVars class equals: Dictionary.
	self assert: (classVars keys includes: var).
	self assert: (classVars at: var) class equals: CpaNode.
	self assert: (classVars at: var) values hasValue.
	self assert: (classVars at: var) values types equals: helper types.