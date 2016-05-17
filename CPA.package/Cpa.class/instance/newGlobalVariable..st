adding
newGlobalVariable: aString
	| variableNode |
	variableNode := CpaNode new.
	globalScope variables add: aString -> variableNode.
	^ variableNode