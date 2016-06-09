accessing
returnTypes
	"The block has no return types, therefore the return types of the enclosing method are used.
	Not entirely correct, but currently only used to keep track of the outer method."

	^ methodScope returnTypes