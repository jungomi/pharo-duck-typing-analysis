instance creation
new: aMethodTemplate
	| concrete |
	concrete := self new.
	concrete template: aMethodTemplate.
	^ concrete