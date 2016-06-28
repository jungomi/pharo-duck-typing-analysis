handling
handleBlock: aBlockNode
	"Evaluates the block and sets the return values to the types of the last statement (implicit return)"

	self newBlockScope: #block.
	aBlockNode statements do: [ :each |
		self processNode: each.
		returnTypes setType: (CpaBlock new: returnTypes types).
	].
	self upOneScope.