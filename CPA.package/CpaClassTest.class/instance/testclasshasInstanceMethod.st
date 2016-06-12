tests-class methods
testclasshasInstanceMethod
	self assert: (Cpa class: helper mock hasInstanceMethod: #instanceMethod).
	self deny: (Cpa class: helper mock hasInstanceMethod: #classMethod).
	self deny: (Cpa class: helper mock hasInstanceMethod: #noMethod).