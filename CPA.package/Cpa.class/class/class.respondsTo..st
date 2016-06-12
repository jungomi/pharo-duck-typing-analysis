testing
class: aClass respondsTo: aSelector
	"Returns the receiver of the selector or nil if class does not respond to it"

	| receiver |
	receiver := aClass.
	[ receiver isNotNil ] whileTrue: [
		(Cpa class: receiver hasInstanceMethod: aSelector) ifTrue: [ ^ receiver ].
		(Cpa class: receiver hasClassMethod: aSelector) ifTrue: [ ^ receiver class ].
		receiver := receiver superclass.
	].
	^ nil