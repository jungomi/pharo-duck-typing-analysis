adding
newLocalVariable: aString
	| variableNode |
	variableNode := CpaNode new.
	currentScope variables add: aString -> variableNode.
	^ variableNode