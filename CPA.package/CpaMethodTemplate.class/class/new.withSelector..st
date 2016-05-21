as yet unclassified
new: aClass withSelector: aSelector
	| temp |
	temp := self new.
	temp recipient: aClass.
	temp selector: aSelector.
	^ temp