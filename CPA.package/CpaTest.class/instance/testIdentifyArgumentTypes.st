tests-identification
testIdentifyArgumentTypes
	helper createMocks.
	[ | args argTypes result |
		args := #('[ true ]' 'true' '3.14' 'TestClassMock myMethod' 'self' 'super' 'Object' 'variable') asOrderedCollection.
		args := args collect: [ :each | helper parse: each ].
		argTypes := #(CpaBlock True Float SmallInteger TestSubClassMock #super Object TestClassMock) asOrderedCollection.
		argTypes := argTypes collect: [ :each | each asClassIfAbsent: [ each ] ].
		argTypes at: 4 put: (Set new add: (argTypes at: 4); yourself).
		argTypes at: 8 put: (Set new add: (argTypes at: 8); yourself).
		helper cpa newScope: helper subMock.
		helper cpa addTypes: (Set new add: helper mock; yourself) toVariable: 'variable'.
		result := helper cpa identifyArgumentTypes: args.
		result at: 1 put: (result at: 1) class.
		self assert: result equals: argTypes.
	] ensure: [ helper deleteMocks ].