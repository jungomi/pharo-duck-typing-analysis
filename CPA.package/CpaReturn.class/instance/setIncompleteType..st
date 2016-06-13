setting
setIncompleteType: aClass
	types := Set new add: aClass; yourself.
	hasValue := true.
	isUnknown := false.
	isIncomplete := true.