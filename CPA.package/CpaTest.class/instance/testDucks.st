tests-integration
testDucks
	helper createMocks.
	[ | cpa types ducks |
		types := Set new add: helper mock; add: helper otherMock; yourself.
		cpa := Cpa processExpression: '| var |
			var := TestClassMock new.
			var := TestClassOtherMock new.
			var myMethod'.
		ducks := cpa ducks.
		self assert: ducks isNotEmpty.
		self assert: (ducks at: #var) isNotEmpty.
		self assert: ((ducks at: #var) at: #global) equals: types.
		self assert: (cpa ducksOfVariable: #var) equals: (ducks at: #var).
		cpa := Cpa processExpression: '| var |
			var := TestClassMock new.
			var := TestClassSubMock new.
			var myMethod'.
		self assert: cpa ducks isEmpty.
	] ensure: [ helper deleteMocks ].