| cpa var |

"Assignment of another variable"
cpa := Cpa processExpression: '| var othervar |
  var := Cpa new.
  othervar := var'.
cpa variables.

"Successful duck types"
cpa := Cpa processExpression: '| var |
  var := Cpa new.
  var := CpaScope new.
  var returnTypes.'.
cpa ducks.

"No ducks, because Dictionary add: Object failed (Object doesn't respond to key)"
cpa := Cpa processExpression: '| duck |
  duck := Dictionary new.
  duck := Set new.
  duck add: Object'.
cpa ducks.

"Unknown type in variable because of non-existing class"
cpa := Cpa processExpression: '| var | var := NonExistingClass new'.
cpa variables.

cpa := Cpa processExpression: 'true ifTrue: [ |var| var := ''hi'' ].'.
cpa variables.

"Return within blocks affect the enclosing return value"
cpa := Cpa processExpression: 'true ifTrue: [ |var| var := ''hi''. ^ var ].'.

cpa := Cpa processExpression: 'Cpa class: Object hasMethod: #add:'.

"Insufficient information (parameter types are unknown)"
cpa := Cpa processMethod: CpaNode>>#propagate.
cpa := Cpa processExpression: 'CpaNode new propagate.'.
cpa := Cpa processExpression: '| var | var := Set new'.

"Blocks are technically BlockClosure types but the value must also be known
as they are accessed by primitives, therefore a CpaBlock is returned instead"
cpa := Cpa processExpression: '| var | var := [ ''hi'' ]'.
cpa variables.
var := [ 'hi' ].

"Blocks receivers are also handled by primitives, hence also returning a CpaBlock"
cpa := Cpa processExpression: '| var | var := true ifTrue: [ 1 ] ifFalse: [ ''string'' ]'.
cpa variables.
var := true ifTrue: [ 1 ] ifFalse: [ 'string' ].

cpa := Cpa processExpression: '#dictionary asClassIfAbsent: [ ^ nil ].'.
