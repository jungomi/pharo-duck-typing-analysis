testing
isCurrentlyInBlockMethod
	"Returns whether the current scope is a block method"
	
	^ currentScope class == CpaBlockMethodScope