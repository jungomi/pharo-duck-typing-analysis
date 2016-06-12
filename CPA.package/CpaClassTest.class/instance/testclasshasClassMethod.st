tests-class methods
testclasshasClassMethod
	self assert: (Cpa class: helper mock hasClassMethod: #classMethod).
	self deny: (Cpa class: helper mock hasClassMethod: #instanceMethod).
	self deny: (Cpa class: helper mock hasClassMethod: #noMethod).