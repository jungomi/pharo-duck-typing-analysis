tests-testing
testClassMustBeInterceptedAtSelector
	| block |
	block := CpaBlock new.
	helper cpa newScope: #blockMethod ofBlock: block.
	self assert: (helper cpa classMustBeIntercepted: block receiver atSelector: #value).
	self deny: (helper cpa classMustBeIntercepted: Cpa atSelector: #value).
	self deny: (helper cpa classMustBeIntercepted: block receiver atSelector: #anotherSelector).
	helper cpa upOneScope.
	self deny: (helper cpa classMustBeIntercepted: block receiver atSelector: #value).
	self deny: (helper cpa classMustBeIntercepted: Cpa atSelector: #value).
	self deny: (helper cpa classMustBeIntercepted: block receiver atSelector: #anotherSelector).