as yet unclassified
asSet
	"Creates a Set representing the values, #unknown is signifies that at least one type is unknown"
	
	| set |
	set := Set new.
	hasValue ifTrue: [
		types do: [ :each | set add: each ].
		(isUnknown or: isIncomplete) ifTrue: [ set add: #unknown ].
	].
	^ set