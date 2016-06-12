tests-testing
testIsCurrentlyInBlockMethod
	| block |
	block := CpaBlock new.
	self deny: helper cpa isCurrentlyInBlockMethod.
	helper cpa newScope: #superScope superOf: CpaBlock.
	self deny: helper cpa isCurrentlyInBlockMethod.
	helper cpa newBlockScope: #aBlock.
	self deny: helper cpa isCurrentlyInBlockMethod.
	helper cpa newScope: #blockMethod ofBlock: block.
	self assert: helper cpa isCurrentlyInBlockMethod.