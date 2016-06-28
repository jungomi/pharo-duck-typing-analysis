propagation
propagate
	"Propagate types to all outgoing nodes"
	
	outgoingNodes do: [ :each | | diff |
		diff := values difference: each values.
		diff do: [ :eachType | each addType: eachType ].
		diff ifNotEmpty: [ each propagate ]
	]