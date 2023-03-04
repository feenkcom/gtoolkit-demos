"
SPL is the toy language for the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.
I demonstrate a PetitParser implementation of the grammar.
My subclasses implement actions.
"
Class {
	#name : #SPLGrammar,
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
SPLGrammar >> assignment [
	^ assignmentExpression / logicOr
]

{ #category : #grammar }
SPLGrammar >> assignmentExpression [
	^ identifier trim , $= asPParser trim , assignment
]

{ #category : #grammar }
SPLGrammar >> block [
	^ '{' asPParser trim , declaration star , $} asPParser trim
]

{ #category : #grammar }
SPLGrammar >> boolean [
	^ 'true' asPParser trim / 'false' asPParser trim
]

{ #category : #grammar }
SPLGrammar >> comparison [
	^ term
		, ('>=' asPParser trim / '>' asPParser trim / '<=' asPParser trim
				/ '<' asPParser trim , term) star
]

{ #category : #grammar }
SPLGrammar >> declaration [
	^ varDecl / statement
]

{ #category : #grammar }
SPLGrammar >> equality [
	^ comparison , ('!=' asPParser trim / '==' asPParser trim , comparison) star
]

{ #category : #grammar }
SPLGrammar >> exprStmt [
	^ expression , $; asPParser trim
]

{ #category : #grammar }
SPLGrammar >> expression [
	^ assignment
]

{ #category : #grammar }
SPLGrammar >> factor [
	^ unary , ($/ asPParser trim / $* asPParser trim , unary) star
]

{ #category : #grammar }
SPLGrammar >> float [
	^ ($- asPParser optional , #digit asPParser plus , $. asPParser
		, #digit asPParser plus) trim
]

{ #category : #grammar }
SPLGrammar >> identifier [
	^ keyword not , #letter asPParser , #word asPParser star
]

{ #category : #grammar }
SPLGrammar >> ifStmt [
	^ 'if' asPParser trim , $( asPParser trim , expression , $) asPParser trim
		, statement , ('else' asPParser trim , statement) optional
]

{ #category : #grammar }
SPLGrammar >> integer [
	^ (#digit asPParser plus , $. asPParser not) trim
]

{ #category : #grammar }
SPLGrammar >> keyword [
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
SPLGrammar >> logicAnd [
	^ equality , ('and' asPParser trim , equality) star
]

{ #category : #grammar }
SPLGrammar >> logicOr [
	^ logicAnd , ('or' asPParser trim , logicAnd) star
]

{ #category : #grammar }
SPLGrammar >> negatedUnary [
	^ ($! asPParser trim / $- asPParser trim , unary)
]

{ #category : #grammar }
SPLGrammar >> number [
	^ integer / float
]

{ #category : #grammar }
SPLGrammar >> parenthesizedExpression [
	"Introduced to have finer control over actions."

	^ $( asPParser trim , expression , $) asPParser trim
]

{ #category : #grammar }
SPLGrammar >> primary [
	^ parenthesizedExpression / boolean / number / string / identifier
]

{ #category : #grammar }
SPLGrammar >> printStmt [
	^ 'print' asPParser trim , expression , $; asPParser trim
]

{ #category : #grammar }
SPLGrammar >> program [
	^ declaration star end
]

{ #category : #accessing }
SPLGrammar >> start [
	^ program
]

{ #category : #grammar }
SPLGrammar >> statement [
	^ ifStmt / printStmt / whileStmt / exprStmt / block
]

{ #category : #grammar }
SPLGrammar >> string [
	^ $" asPParser , $" asPParser negate plus , $" asPParser
]

{ #category : #grammar }
SPLGrammar >> term [
	^ factor , ('-' asPParser trim / '+' asPParser trim , factor) star
]

{ #category : #grammar }
SPLGrammar >> unary [
	^ negatedUnary / primary
]

{ #category : #grammar }
SPLGrammar >> varDecl [
	^ ('var' asPParser trim , identifier
		, ($= asPParser trim , expression) optional , $; asPParser trim)
		==> [ :node | 
			node third
				ifNil: [ SPLDeclaration for: node second ]
				ifNotNil: [ SPLInitializedDeclaration for: node second with: node third second ] ]
]

{ #category : #grammar }
SPLGrammar >> whileStmt [
	^ 'while' asPParser trim , $( asPParser trim , expression , $) asPParser trim
		, statement
]
