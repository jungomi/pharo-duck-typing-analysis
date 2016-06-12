tests-adding
testAddClassInstanceVariables
	helper createMocks.
	[ | classVars |
		classVars := helper cpa instanceVariablesOfClass: helper subSubMock.
		self assert: classVars equals: nil.
		helper cpa addClassInstanceVariables: helper subSubMock.
		classVars := helper cpa instanceVariablesOfClass: helper subSubMock.
		self assert: classVars class equals: Dictionary.
		self assert: (classVars keys includes: 'instVar').
		self assert: (classVars keys includes: 'subInstVar').
	] ensure: [ helper deleteMocks ].