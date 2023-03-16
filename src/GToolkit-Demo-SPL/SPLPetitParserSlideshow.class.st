"
I am the slideshow for the PetitParser lecture of the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.
"
Class {
	#name : #SPLPetitParserSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-SPL-Slideshows'
}

{ #category : #utility }
SPLPetitParserSlideshow class >> show [
	"Implement this here just so we can run it directly from the Coder."
	super show
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingTokens: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #parsingTokens:);
		heading: 'What is PetitParser?';
		addTextSnippet: 'PetitParser models parsers as composable objects.';
		addCodeSnippet: 'number := #digit asPParser plus  token
	==> [ :token | token  value asNumber ].

addition := (number , $+ asPParser  , number)
	==> [ :nodes | nodes first + nodes last ].

addition parse: ''3+4'''
]

{ #category : #accessing }
SPLPetitParserSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		whatIsPP:
		splGrammar:
		splExample:
		parsingTokens:
	)
]

{ #category : #slides }
SPLPetitParserSlideshow >> splExample: aSlide [
	<gtSlide>
	^ aSlide text
		horizontalWeight: 1;
		priority: (self priorityFor: #splExample:);
		newTextWithFormat: (self asText: 'SPL is a minimal language with variables, expressions, if, while and print statements, but no procedures or classes.');
		newTextWithFormat: (self
				asCode: '// Factorial in SPL -- computes the factorial of arg
var arg=5;
var x=arg;
var fact=1;
while (x>0) {
	fact = fact * x;
	x = x - 1;
}
print fact;
')
]

{ #category : #slides }
SPLPetitParserSlideshow >> splGrammar: aSlide [
	<gtSlide>
	^ aSlide text
		horizontalWeight: 1;
		priority: (self priorityFor: #splGrammar:);
		newTextWithFormat: (self asHeader: 'SPL Grammar');
		newTextWithFormat: (self
				asCode: 'program        := declaration* EOF ;
declaration    := varDecl
               | statement ;
varDecl        := "var" IDENTIFIER ( "=" expression )? ";" ;
statement      := exprStmt
               | ifStmt
               | printStmt
               | whileStmt
               | block ;
exprStmt       := expression ";" ;
ifStmt         := "if" "(" expression ")" statement ( "else" statement )? ;
printStmt      := "print" expression ";" ;
whileStmt      := "while" "(" expression ")" statement ;
block          := "{" declaration* "}" ;
expression     := assignment ;
assignment     := IDENTIFIER "=" assignment
               | logic_or ;
logic_or       := logic_and ( "or" logic_and )* ;
logic_and      := equality ( "and" equality )* ;
equality       := comparison ( ( "!=" | "==" ) comparison )* ;
comparison     := term ( ( ">" | ">=" | "<" | "<=" ) term )* ;
term           := factor ( ( "-" | "+" ) factor )* ;
factor         := unary ( ( "/" | "*" ) unary )* ;
unary          := ( "!" | "-" ) unary
               | primary ;
primary        := "true" | "false" | NUMBER | STRING
               | "(" expression ")"
               | IDENTIFIER ;
')
]

{ #category : #slides }
SPLPetitParserSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	
	^ (aSlide title)
		priority: (self priorityFor: #titleSlideFor:);
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'Building composable parsers');
		subtitleWithFormat: (self asTitle: 'with PetitParser')
]

{ #category : #slides }
SPLPetitParserSlideshow >> whatIsPP: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #whatIsPP:);
		heading: 'What is PetitParser?';
		addTextSnippet: 'PetitParser models parsers as composable objects.';
		addCodeSnippet: 'number := #digit asPParser plus  token
	==> [ :token | token  value asNumber ].

addition := (number , $+ asPParser  , number)
	==> [ :nodes | nodes first + nodes last ].

addition parse: ''3+4'''
]
