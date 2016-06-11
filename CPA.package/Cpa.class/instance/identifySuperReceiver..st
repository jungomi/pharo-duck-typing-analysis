identification
identifySuperReceiver: aSelector
	"Finds the method that is called from super"

	^ Cpa class: currentScope recipient superclass respondsTo: aSelector.