tests-handling
testHandleBlockMethodWithArgs
	helper createMocks.
	[ | block method template args concrete |
		block := CpaBlock new: helper types.
		method := (block receiver)>>#whileTrue.
		template := helper cpa repository methodTemplateOf: method.
		args := OrderedCollection new.
		self assert: template equals: nil.
		helper cpa handleBlock: block method: method withArgs: args.
		self deny: helper cpa returnTypes hasValue.
		template := helper cpa repository methodTemplateOf: method.
		self assert: template isNotNil.
		self assert: template class equals: CpaBlockMethodTemplate.
		concrete := template concreteMethodWithArgs: args.
		self deny: concrete returnTypes hasValue.
		self assert: concrete class equals: CpaConcreteBlockMethod.
		self assert: concrete valueTypes equals: block valueTypes.
	] ensure: [ helper deleteMocks ].