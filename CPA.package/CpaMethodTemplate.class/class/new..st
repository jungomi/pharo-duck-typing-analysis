instance creation
new: aClass
	| temp |
	temp := self new.
	temp receiver: aClass.
	^ temp