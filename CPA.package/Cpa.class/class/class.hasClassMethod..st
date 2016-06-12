testing
class: aClass hasClassMethod: aSelector
	(aClass class methodDict keys includes: aSelector) ifTrue: [ ^ true ].
	^ false.