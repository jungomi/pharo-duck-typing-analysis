identification
identifySuperReceiver: aSelector
	"Finds the method that is called from super"

	currentScope recipient isClass ifFalse: [ ^ nil ].
	^ Cpa class: currentScope recipient superclass respondsTo: aSelector.