tests-integration
testMethodSuccess
	helper createMocks.
	[ | cpa template concrete |
		cpa := Cpa processExpression: 'TestClassMock new myMethod'.
		template := cpa repository methodTemplateOf: (helper mock)>>#myMethod.
		self assert: template isNotNil.
		concrete := template concreteMethodWithArgs: OrderedCollection new.
		self assert: concrete isNotNil.
		self deny: concrete failed.
		cpa := Cpa processExpression: 'TestClassMock new methodSendingKey: #key -> #value'.
		template := cpa repository methodTemplateOf: (helper mock)>>#methodSendingKey:.
		self assert: template isNotNil.
		concrete := template concreteMethodWithArgs:
			(helper singletonOrderedCollection: (helper singletonSet: (#key -> #value) class)).
		self assert: concrete isNotNil.
		self deny: concrete failed.
	] ensure: [ helper deleteMocks ].