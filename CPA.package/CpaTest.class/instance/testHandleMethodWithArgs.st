tests-handling
testHandleMethodWithArgs
	helper createMocks.
	[ | instance actualValue method template args concrete |
		instance := helper mock new.
		actualValue := Set new add: instance myMethod class; yourself.
		method := (helper mock)>>#myMethod.
		template := helper cpa repository methodTemplateOf: method.
		args := OrderedCollection new.
		self assert: template equals: nil.
		helper cpa handleMethod: method withArgs: args.
		self assert: helper cpa returnTypes hasValue.
		self assert: helper cpa returnTypes types equals: actualValue.
		template := helper cpa repository methodTemplateOf: method.
		self assert: template isNotNil.
		concrete := template concreteMethodWithArgs: args.
		self assert: concrete returnTypes types equals: helper cpa returnTypes types.
	] ensure: [ helper deleteMocks ].