filtering
introducedByAllSubclasses
	"Returns all methods that are introduced by all subclasses of a class"
	
	| dict |
	dict := Dictionary new.
	self siblings keysAndValuesDo: [ :aMethod :aDict |
		aDict keysAndValuesDo: [ :aClass :siblings |
			aClass subclasses size = siblings size ifTrue: [
				(dict at: aClass ifAbsentPut: Set new) add: aMethod
			].
		].
	].
	^ dict.