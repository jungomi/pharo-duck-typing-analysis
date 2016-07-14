mocking
createMocks
	mock := Object subclass: #TestClassMock instanceVariableNames: 'instVar'.
	mock compile: 'initialize instVar := 0'.
	mock compile: 'instanceMethod ^ true'.
	mock class compile: 'classMethod ^ true'.
	mock compile: 'myMethod ^ 0'.
	mock compile: 'mySelfMethod ^ self myMethod'.
	mock compile: 'myMethod: aClass withArg: aSelector ^ aClass new'.
	mock compile: 'myMethodWithoutReturn instVar := 0'.
	mock compile: 'methodSendingKey: anAssociation ^ anAssociation key'.
	mock compile: 'methodOverridden ^ 1'.
	subMock := mock subclass: #TestSubClassMock instanceVariableNames: 'subInstVar'.
	subMock compile: 'methodOverridden ^ 2'.
	subSubMock := subMock subclass: #TestSubSubClassMock.
	subSubMock compile: 'myMethod ^ super myMethod + 2'.
	otherMock := Object subclass: #TestClassOtherMock.
	otherMock compile: 'myMethod ^ 5'.