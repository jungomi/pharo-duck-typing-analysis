accessing
classes
	"Returns a list of all classes in the repository"
	
	| classList |
	classList := Set new.
	templates do: [ :each |
		classList add: (each receiver).
	].
	^ classList