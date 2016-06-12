tests-handling
testHandleMethodSuperOfWithArgs
	helper createMocks.
	[ | method template args varNode |
		method := (helper mock)>>#myMethodWithoutReturn.
		template := helper cpa repository methodTemplateOf: method.
		args := OrderedCollection new.
		helper cpa addClassInstanceVariables: helper subMock.
		self assert: template equals: nil.
		helper cpa handleMethod: method superOf: helper subMock withArgs: args.
		self deny: helper cpa returnTypes hasValue.
		template := helper cpa repository methodTemplateOf: method.
		self assert: template isNotNil.
		self assert: (template concreteMethodWithArgs: args) isNotNil.
		varNode := helper cpa instanceVariableNodeByName: 'instVar' OfClass: helper subMock.
		self assert: varNode isNotNil.
		varNode := helper cpa instanceVariableNodeByName: 'instVar' OfClass: helper mock.
		self assert: varNode equals: nil.
	] ensure: [ helper deleteMocks ].