Class {
	#name : #SPLgrammar,
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
		'program'
	],
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #grammar }
SPLgrammar >> assignment [
	^ (identifier trim , $= asPParser trim , logicOr) / logicOr
]

{ #category : #grammar }
SPLgrammar >> block [
	^ '{' asPParser trim , $} asPParser trim	", declaration star"
]

{ #category : #grammar }
SPLgrammar >> boolean [
	^ 'true' asPParser trim / 'false' asPParser trim
]

{ #category : #grammar }
SPLgrammar >> comparison [
	^ term
		, ('>=' asPParser trim / '>' asPParser trim / '<=' asPParser trim
				/ '<' asPParser trim , term) star
]

{ #category : #grammar }
SPLgrammar >> declaration [
	^ varDecl / statement
]

{ #category : #grammar }
SPLgrammar >> equality [
	^ comparison , ('!=' asPParser trim / '==' asPParser trim , comparison) star
]

{ #category : #grammar }
SPLgrammar >> exprStmt [
	^ expression , $; asPParser trim
]

{ #category : #grammar }
SPLgrammar >> expression [
	^ assignment
]

{ #category : #grammar }
SPLgrammar >> factor [
	^ unary
]

{ #category : #grammar }
SPLgrammar >> float [
	^ ($- asPParser optional , #digit asPParser plus , $. asPParser
		, #digit asPParser plus) trim
]

{ #category : #grammar }
SPLgrammar >> identifier [
	^ keyword not , #letter asPParser , #word asPParser star
]

{ #category : #grammar }
SPLgrammar >> ifStmt [
	^ 'if' asPParser trim , $( asPParser trim , expression , $) asPParser trim
		, 'else' asPParser trim optional	", statement"	", statement"
]

{ #category : #grammar }
SPLgrammar >> integer [
	^ ($- asPParser optional , #digit asPParser plus , $. asPParser not) trim
]

{ #category : #grammar }
SPLgrammar >> keyword [
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
SPLgrammar >> logicAnd [
	^ equality , ('and' asPParser trim , equality) star
]

{ #category : #grammar }
SPLgrammar >> logicOr [
	^ logicAnd , ('or' asPParser trim , logicAnd) star
]

{ #category : #grammar }
SPLgrammar >> number [
	^ integer / float
]

{ #category : #grammar }
SPLgrammar >> primary [
	^ boolean / number / string / identifier
]

{ #category : #grammar }
SPLgrammar >> printStmt [
	^ 'print' asPParser trim , expression , $; asPParser trim
]

{ #category : #grammar }
SPLgrammar >> program [
	^ declaration star end
]

{ #category : #accessing }
SPLgrammar >> start [
	^ program
]

{ #category : #grammar }
SPLgrammar >> statement [
	^ ifStmt / printStmt / whileStmt / exprStmt / block
]

{ #category : #grammar }
SPLgrammar >> string [
	^ $" asPParser , $" asPParser negate plus , $" asPParser
]

{ #category : #grammar }
SPLgrammar >> term [
	^ factor , ('-' asPParser trim / '+' asPParser trim , factor) star
]

{ #category : #grammar }
SPLgrammar >> unary [
	^ primary
]

{ #category : #grammar }
SPLgrammar >> varDecl [
	^ 'var' asPParser trim , identifier , $; asPParser trim
]

{ #category : #grammar }
SPLgrammar >> whileStmt [
	^ 'while' asPParser trim , $( asPParser trim , expression , $) asPParser trim	", statement"
]
