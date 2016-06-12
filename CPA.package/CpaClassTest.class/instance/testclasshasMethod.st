tests-class methods
testclasshasMethod
	self assert: (Cpa class: helper mock hasMethod: #classMethod).
	self assert: (Cpa class: helper mock hasMethod: #instanceMethod).
	self deny: (Cpa class: helper mock hasMethod: #noMethod).