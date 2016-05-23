as yet unclassified
class: aClass hasMethod: aSelector
	(aClass methodDict keys includes: aSelector) ifTrue: [ ^ true ].
	(aClass class methodDict keys includes: aSelector) ifTrue: [ ^ true ].
	^ false.