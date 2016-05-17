adding
newVariable: aString
	| variableNode |
	variableNode := CpaNode new.
	variables add: aString -> variableNode.
	^ variableNode