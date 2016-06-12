tests-handling
testHandleMethodWithArgs
	helper createMocks.
	[ | method template args concrete |
		method := (helper mock)>>#myMethod.
		template := helper cpa repository methodTemplateOf: method.
		args := OrderedCollection new.
		self assert: template equals: nil.
		helper cpa handleMethod: method withArgs: args.
		self assert: helper cpa returnTypes hasValue.
		self assert: helper cpa returnTypes types equals: (Set new add: SmallInteger; yourself).
		template := helper cpa repository methodTemplateOf: method.
		self assert: template isNotNil.
		concrete := template concreteMethodWithArgs: args.
		self assert: concrete returnTypes types equals: helper cpa returnTypes types.
	] ensure: [ helper deleteMocks ].