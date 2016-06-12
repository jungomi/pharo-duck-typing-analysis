tests-as yet unclassified
testUpOneScope
	helper createMocks.
	[ | initialScope secondScope thirdScope |
		initialScope := helper cpa currentScope.
		helper cpa newScope: helper mock.
		secondScope := helper cpa currentScope.
		helper cpa newScope: helper subMock.
		thirdScope := helper cpa currentScope.
		helper cpa newScope: #anotherScope.
		self assert: helper cpa currentScope id equals: #anotherScope.
		helper cpa upOneScope.
		self assert: helper cpa currentScope equals: thirdScope.
		helper cpa upOneScope.
		self assert: helper cpa currentScope equals: secondScope.
		helper cpa upOneScope.
		self assert: helper cpa currentScope equals: initialScope.
		helper cpa upOneScope.
		self assert: helper cpa currentScope equals: initialScope.
	] ensure: [ helper deleteMocks ].