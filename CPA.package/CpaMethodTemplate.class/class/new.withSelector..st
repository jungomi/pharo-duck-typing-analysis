instance creation
new: aClass withSelector: aSelector
	| temp selectors |
	temp := self new.
	temp receiver: aClass.
	temp selector: aSelector.
	selectors := temp splitSelector.
	temp numArgs: (selectors ifNil: [ 0 ] ifNotNil: [ selectors size ]).
	^ temp