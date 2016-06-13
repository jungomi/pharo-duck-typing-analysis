adding
addTemplate: aMethodTemplate
	| method |
	method := (aMethodTemplate recipient)>>(aMethodTemplate selector).
	templates add: method -> aMethodTemplate.