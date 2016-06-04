as yet unclassified
createTemplateFromClass: aClass withSelector: aSelector
	| temp varNames |
	temp := CpaMethodTemplate new: aClass withSelector: aSelector.
	"TODO: This should probably be done in processNode instead"
	varNames := (RBParser parseCompiledMethod: aClass>>aSelector) arguments collect: [ :each | each name ].
	temp variables: (temp assignToSelectors: varNames).
	templates at: aClass>>aSelector put: temp.
	^ temp