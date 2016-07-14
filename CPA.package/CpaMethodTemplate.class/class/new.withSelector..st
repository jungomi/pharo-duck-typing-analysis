instance creation
new: aClass withSelector: aSelector
	| temp |
	temp := self new.
	temp receiver: aClass.
	temp selector: aSelector.
	"This does not work properly for operators (e.g. ->, +) but gives a good default"
	(aSelector matchesRegex: '.*\:') ifTrue: [
		temp numArgs: temp splitSelector size.
	] ifFalse: [
		temp numArgs: 0.
	].
	^ temp