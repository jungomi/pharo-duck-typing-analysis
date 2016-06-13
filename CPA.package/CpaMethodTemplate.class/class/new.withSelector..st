as yet unclassified
new: aClass withSelector: aSelector
	| temp |
	temp := self new.
	temp receiver: aClass.
	temp selector: aSelector.
	(aSelector matchesRegex: '.*\:') ifTrue: [
		temp numArgs: (temp splitSelector size).
	] ifFalse: [
		temp numArgs: 0.
	].
	^ temp