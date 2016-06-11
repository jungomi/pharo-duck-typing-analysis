as yet unclassified
class: aClass hasInstanceMethod: aSelector
	(aClass methodDict keys includes: aSelector) ifTrue: [ ^ true ].
	^ false.