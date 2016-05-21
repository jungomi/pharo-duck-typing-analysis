as yet unclassified
createConcreteMethod: aDictionary
	| concreteMethod |
	concreteMethod := CpaConcreteMethod new.
	concreteMethod recipient: recipient.
	concreteMethod selector: selector.
	"selectors do: [ :each | concreteMethod initializeSelector: each with: (aDictionary at: each) ]"
	^ concreteMethod