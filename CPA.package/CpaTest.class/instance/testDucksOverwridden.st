tests-integration
testDucksOverwridden
	helper createMocks.
	[ | cpa |
		cpa := Cpa processExpression: '| var |
			var := TestClassMock new.
			var := TestSubSubClassMock new.
			var methodOverridden'.
		self assert: cpa ducks isEmpty.
	] ensure: [ helper deleteMocks ].