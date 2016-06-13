adding
addTypes: aSet toInstanceVariable: aVariableName atClass: aClass
	((instanceVariableTypes at: aClass ifAbsentPut: Dictionary new)
		at: aVariableName ifAbsentPut: CpaNode new) addTypes: aSet.