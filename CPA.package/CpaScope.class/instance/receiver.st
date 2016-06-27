accessing
receiver
	"Returns the receiver (class) of the id (compiled method), i.e. the first word in its name"

	id name regex: '\w+' matchesDo: [ :each | | receiverClass |
		receiverClass := each asClassIfAbsent: [ nil ].
		^ (id name matchesRegex: '\w+\s+class.*') ifTrue: [
			receiverClass class.
		] ifFalse: [
			receiverClass.
		].
	].
	^ nil