tests-integration
testMethodFailed
	helper createMocks.
	[ | cpa template concrete |
		cpa := Cpa processExpression: 'TestClassMock new methodSendingKey: Object'.
		template := cpa repository methodTemplateOf: (helper mock)>>#methodSendingKey:.
		self assert: template isNotNil.
		concrete := template concreteMethodWithArgs:
			(helper singletonOrderedCollection: (helper singletonSet: Object class)).
		self assert: concrete isNotNil.
		self assert: concrete failed.
	] ensure: [ helper deleteMocks ].