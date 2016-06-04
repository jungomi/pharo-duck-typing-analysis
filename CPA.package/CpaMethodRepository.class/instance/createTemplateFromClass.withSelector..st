as yet unclassified
createTemplateFromClass: aClass withSelector: aSelector
	| temp |
	temp := CpaMethodTemplate new: aClass withSelector: aSelector.
	templates at: aClass>>aSelector put: temp.
	^ temp