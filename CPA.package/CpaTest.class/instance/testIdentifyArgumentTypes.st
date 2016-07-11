tests-identification
testIdentifyArgumentTypes
	helper createMocks.
	[ | args argTypes result varTypes |
		varTypes := helper singletonSet: helper mock.
		args := #('[ true ]' 'true' '3.14' 'TestClassMock new myMethod' 'self' 'super' 'Object' 'variable' 'TestClassMock noMethod') asOrderedCollection.
		args := args collect: [ :each | helper parse: each ].
		argTypes := OrderedCollection new.
		argTypes add: (helper singletonSet: CpaBlock).
		argTypes add: (helper singletonSet: true class).
		argTypes add: (helper singletonSet: 3.14 class).
		argTypes add: (helper singletonSet: helper mock new myMethod class).
		argTypes add: (helper singletonSet: helper subMock).
		argTypes add: (helper singletonSet: #super).
		argTypes add: (helper singletonSet: Object class).
		argTypes add: varTypes.
		argTypes add: Set new.
		helper cpa newScope: helper subMock.
		helper cpa addTypes: varTypes toVariable: 'variable'.
		result := helper cpa identifyArgumentTypes: args.
		result at: 1 put: ((result at: 1) collect: [ :each | each class ]).
		result at: 8 put: ((result at: 8) types).
		self assert: result equals: argTypes.
	] ensure: [ helper deleteMocks ].
