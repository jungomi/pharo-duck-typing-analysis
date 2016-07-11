comparing
hash
	^ (((self class hash
		bitXor: hasValue hash)
		bitXor: isUnknown hash)
		bitXor: isIncomplete hash)
		bitXor: types hash