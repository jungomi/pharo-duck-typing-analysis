as yet unclassified
class: aClass hasClassMethod: aSelector
	(aClass class methodDict keys includes: aSelector) ifTrue: [ ^ true ].
	^ false.