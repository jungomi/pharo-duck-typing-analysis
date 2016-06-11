identification
identifySuperReceiver: aSelector
	"Finds the method that is called from super"

	| receiver |
	receiver := currentScope recipient superclass.
	[ receiver isNotNil ] whileTrue: [
		(Cpa class: receiver hasMethod: aSelector) ifTrue: [ ^ receiver ].
		receiver := receiver superclass.
	].