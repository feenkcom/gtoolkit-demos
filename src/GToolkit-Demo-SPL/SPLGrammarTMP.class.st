"
SPL is the toy language for the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.
I demonstrate a PetitParser implementation of the grammar.
My subclasses implement actions.
"
Class {
	#name : #SPLGrammarTMP,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'keyword',
		'identifier',
		'boolean',
		'integer',
		'float',
		'number',
		'string',
		'varDecl',
		'primary',
		'unary',
		'factor',
		'term',
		'comparison',
		'equality',
		'logicAnd',
		'logicOr',
		'assignment',
		'expression',
		'exprStmt',
		'printStmt',
		'ifStmt',
		'whileStmt',
		'block',
		'statement',
		'declaration',
		'program',
		'parenthesizedExpression',
		'negatedUnary',
		'assignmentExpression'
	],
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #grammar }
SPLGrammarTMP >> assignment [
	^ assignmentExpression / logicOr
]

{ #category : #grammar }
SPLGrammarTMP >> assignmentExpression [
	^ identifier trim , $= asPParser trim , assignment
]

{ #category : #grammar }
SPLGrammarTMP >> block [
	^ '{' asPParser trim , declaration star , $} asPParser trim
]

{ #category : #grammar }
SPLGrammarTMP >> boolean [
	^ 'true' asPParser trim / 'false' asPParser trim
]

{ #category : #grammar }
SPLGrammarTMP >> comparison [
	^ term
		, ('>=' asPParser trim / '>' asPParser trim / '<=' asPParser trim
				/ '<' asPParser trim , term) star
]

{ #category : #grammar }
SPLGrammarTMP >> declaration [
	^ varDecl / statement
]

{ #category : #grammar }
SPLGrammarTMP >> equality [
	^ comparison , ('!=' asPParser trim / '==' asPParser trim , comparison) star
]

{ #category : #grammar }
SPLGrammarTMP >> exprStmt [
	^ expression , $; asPParser trim
]

{ #category : #grammar }
SPLGrammarTMP >> expression [
	^ assignment
]

{ #category : #grammar }
SPLGrammarTMP >> factor [
	^ unary , ($/ asPParser trim / $* asPParser trim , unary) star
]

{ #category : #grammar }
SPLGrammarTMP >> float [
	^ ($- asPParser optional , #digit asPParser plus , $. asPParser
		, #digit asPParser plus) trim
]

{ #category : #grammar }
SPLGrammarTMP >> identifier [
	^ keyword not , #letter asPParser , #word asPParser star
]

{ #category : #grammar }
SPLGrammarTMP >> ifStmt [
	^ 'if' asPParser trim , $( asPParser trim , expression , $) asPParser trim
		, statement , ('else' asPParser trim , statement) optional
]

{ #category : #grammar }
SPLGrammarTMP >> integer [
	^ (#digit asPParser plus , $. asPParser not) trim
]

{ #category : #grammar }
SPLGrammarTMP >> keyword [
	^ ('var' asPParser , #letter asPParser not)
		/ ('if' asPParser , #letter asPParser not)
		/ ('else' asPParser , #letter asPParser not)
		/ ('while' asPParser , #letter asPParser not)
		/ ('true' asPParser , #letter asPParser not)
		/ ('false' asPParser , #letter asPParser not)
		/ ('and' asPParser , #letter asPParser not)
		/ ('or' asPParser , #letter asPParser not)
]

{ #category : #grammar }
SPLGrammarTMP >> logicAnd [
	^ equality , ('and' asPParser trim , equality) star
]

{ #category : #grammar }
SPLGrammarTMP >> logicOr [
	^ logicAnd , ('or' asPParser trim , logicAnd) star
]

{ #category : #grammar }
SPLGrammarTMP >> negatedUnary [
	^ ($! asPParser trim / $- asPParser trim , unary)
]

{ #category : #grammar }
SPLGrammarTMP >> number [
	^ integer / float
]

{ #category : #grammar }
SPLGrammarTMP >> parenthesizedExpression [
	"Introduced to have finer control over actions."

	^ $( asPParser trim , expression , $) asPParser trim
]

{ #category : #grammar }
SPLGrammarTMP >> primary [
	^ parenthesizedExpression / boolean / number / string / identifier
]

{ #category : #grammar }
SPLGrammarTMP >> printStmt [
	^ 'print' asPParser trim , expression , $; asPParser trim
]

{ #category : #grammar }
SPLGrammarTMP >> program [
	^ declaration star end
]

{ #category : #accessing }
SPLGrammarTMP >> start [
	^ program
]

{ #category : #grammar }
SPLGrammarTMP >> statement [
	^ ifStmt / printStmt / whileStmt / exprStmt / block
]

{ #category : #grammar }
SPLGrammarTMP >> string [
	^ $" asPParser , $" asPParser negate plus , $" asPParser
]

{ #category : #grammar }
SPLGrammarTMP >> term [
	^ factor , ('-' asPParser trim / '+' asPParser trim , factor) star
]

{ #category : #grammar }
SPLGrammarTMP >> unary [
	^ negatedUnary / primary
]

{ #category : #grammar }
SPLGrammarTMP >> varDecl [
	^ ('var' asPParser trim , identifier
		, ($= asPParser trim , expression) optional , $; asPParser trim)
		==> [ :node | 
			node third
				ifNil: [ SPLDeclaration for: node second ]
				ifNotNil: [ SPLInitializedDeclaration for: node second with: node third second ] ]
]

{ #category : #grammar }
SPLGrammarTMP >> whileStmt [
	^ 'while' asPParser trim , $( asPParser trim , expression , $) asPParser trim
		, statement
]
