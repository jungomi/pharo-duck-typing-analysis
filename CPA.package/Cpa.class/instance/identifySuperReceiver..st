identification
identifySuperReceiver: aSelector
	"Finds the method that is called from super"

	currentScope receiver isClass ifFalse: [ ^ nil ].
	^ Cpa class: currentScope receiver superclass respondsTo: aSelector.