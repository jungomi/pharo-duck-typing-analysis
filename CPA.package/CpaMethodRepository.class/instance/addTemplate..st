adding
addTemplate: aMethodTemplate
	| method |
	method := (aMethodTemplate receiver)>>(aMethodTemplate selector).
	templates add: method -> aMethodTemplate.