# CpaNode

`CpaNode` represents a node/vertex of a variable in the graph. It contains the
types that have been assigned to the variable and the incoming and outgoing
edges from other nodes or to them respectively. The types can be propagated
through the outgoing edges, the propagation stops when no new type has been
added to a node.

## Public API and Key Messages

- `addIncomingNode: CpaNode` - adds an incoming edge from the `CpaNode`.
- `addOutgoingNode: CpaNode` - adds an outgoing edge to the `CpaNode`.
- `propagate` - propagates the types through the outgoing edges.

## Instance Variables

- `incomingNodes: Set` - the nodes from which an incoming edge exists.
- `outgoingNodes: Set` - the nodes to which an incoming edge exists.
- `types: Set` - the types assigned to the variable.
