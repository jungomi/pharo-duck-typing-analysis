filtering
siblings
	"Finds all siblings in the duplicate methods and groups them by their parent class under the 	 	 	corresponding method"
	
	| dict |
	dict := Dictionary new.
	self duplicateMethods keysAndValuesDo: [ :key :value | | eachDict |
		eachDict := Dictionary new.
		value do: [ :eachClass |
			(eachDict at: eachClass superclass ifAbsentPut: Set new) add: eachClass
		].
		dict add: key -> eachDict.
	].
	dict := dict collect: [ :each | each select: [ :eachSet | eachSet size > 1 ] ].
	^ dict select: [ :each | each size > 0 ]