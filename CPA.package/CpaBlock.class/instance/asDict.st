converting
asDict
	| dict |
	dict := Dictionary new.
	dict at: #block put: self receiver.
	dict at: #value put: valueTypes.
	^ dict