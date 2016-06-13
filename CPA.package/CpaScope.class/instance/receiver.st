accessing
receiver
	"Returns the receiver (class) of the id (compiled method), i.e. the first word in its name"

	(id name) regex: '\w+' matchesDo: [ :each | ^ each asClassIfAbsent: [ ^ nil ] ].
	^ nil