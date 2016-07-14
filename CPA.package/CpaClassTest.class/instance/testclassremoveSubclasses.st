tests-class methods
testclassremoveSubclasses
	| set expected result |
	set := Set new add: helper mock; add: helper subMock; add: helper otherMock; yourself.
	expected := Set new add: helper mock; add: helper otherMock; yourself.
	result := Cpa removeSubclasses: set.
	self assert: result equals: expected.