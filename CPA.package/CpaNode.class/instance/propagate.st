propagation
propagate
	"Propagate types to all outgoing nodes"
	
	outgoingNodes do: [ :each | | diff |
		diff := types difference: (each types).
		diff do: [ :eachType | each addType: eachType ].
		diff ifNotEmpty: [ each propagate ]
	]