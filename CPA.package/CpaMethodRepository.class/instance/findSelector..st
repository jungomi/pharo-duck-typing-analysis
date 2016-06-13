accessing
findSelector: aSelector
	"Finds all templates that use the given selector"
	
	| tempSet |
	tempSet := Set new.
	templates do: [ :each |
		each selectors == aSelector ifTrue: [
			tempSet add: (each recipient)
		].
	].
	^ tempSet