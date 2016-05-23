adding
addNewDuck: aSelector
	| duck |
	duck := CpaDuck new: aSelector.
	ducks add: duck.
	^ duck.