as yet unclassified
new: aClass
	| temp |
	temp := self new.
	temp receiver: aClass.
	^ temp