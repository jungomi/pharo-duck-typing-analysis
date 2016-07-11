comparing
= aCpaReturn
	^ self class == aCpaReturn class
		and: [ hasValue = aCpaReturn hasValue
			and: [ isUnknown = aCpaReturn isUnknown
				and: [ isIncomplete = aCpaReturn isIncomplete
					and: types = aCpaReturn types ] ] ].