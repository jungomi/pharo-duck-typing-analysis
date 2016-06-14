| cpa var |

cpa := Cpa processExpression: '| var othervar| var := DuckTypingAnalysis new. othervar := var'.
cpa := Cpa processExpression: '| var | var := DuckTypingAnalysis new analyseClass: DuckTypingAnalysis'.
cpa variableTypes: 'var'.
cpa variableTypes: 'othervar'.

cpa := Cpa processExpression: '| var | var := NonExistingClass new'.
cpa := Cpa processExpression: '| var | var := DuckTypingAnalysis new nonExistingMethod'.

cpa := Cpa processExpression: 'true ifTrue: [ |var| var := ''hi'' ].'.
cpa := Cpa processExpression: 'true ifTrue: [ |var| var := ''hi''. ^ var ].'.
cpa := Cpa processExpression: '[ true ] whileTrue: [ self halt ].'.

cpa := Cpa processExpression: '| duck |
  duck := Dictionary new.
  duck := Set new.
  duck add: Object'.

cpa := Cpa processExpression: 'Cpa class: Object hasMethod: #add:'.

cpa := Cpa processMethod: CpaNode>>#propagate.
cpa := Cpa processExpression: 'CpaNode new propagate.'.
cpa := Cpa processExpression: '| var | var := Set new'.

cpa := Cpa processExpression: '| var | var := [ ''hi'' ]'.
var := [ 'hi' ].
cpa := Cpa processExpression: '| var | var := true ifTrue: [ 1 ] ifFalse: [ ''string'' ]'.
var := true ifTrue: [ 1 ] ifFalse: [ 'string' ].
#Smalltalk asClass.
cpa := Cpa processExpression: '#dictionary asClassIfAbsent: [ ^ nil ].'.
