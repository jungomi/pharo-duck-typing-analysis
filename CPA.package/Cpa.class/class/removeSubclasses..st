manipulating
removeSubclasses: aSet
	"Removes all classes for which an ancestor is also present in the set
	(keeps only the most abstract class)."

	| copy |
	copy := aSet copy.
	aSet do: [ :each | | parent |
		parent := each superclass.
		[ parent isNotNil ] whileTrue: [
			(aSet includes: parent) ifTrue: [
				copy remove: each.
				parent := nil.
			] ifFalse: [ parent := parent superclass. ].
		].
	].
	^ copy