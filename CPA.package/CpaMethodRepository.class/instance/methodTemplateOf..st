accessing
methodTemplateOf: aMethod
	^ templates at: aMethod ifAbsent: [ nil ]