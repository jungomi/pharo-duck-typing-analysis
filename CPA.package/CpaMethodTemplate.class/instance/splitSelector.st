accessing
splitSelector
	"Returns an ordered collection of all selectors in the 'combined' selector"
	
	| list |
	list := OrderedCollection new.
	(selector matchesRegex: '.*\:') ifTrue: [
		selector regex: '\w+\:' matchesDo: [ :each |
			list add: (each asSymbol).
 	 	].
	] ifFalse: [
		list add: selector.
	].
	^ list
