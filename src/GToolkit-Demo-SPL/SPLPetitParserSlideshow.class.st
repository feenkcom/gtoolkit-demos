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

{ #category : #accessing }
SPLPetitParserSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		whatIsPP2:
		splGrammar:

		)
]

{ #category : #slides }
SPLPetitParserSlideshow >> splGrammar: aSlide [
	<gtSlide>
	^ aSlide text
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
SPLPetitParserSlideshow >> whatIsPP2: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #whatIsPP2:);
		heading: 'What is PetitParser2?';
		
		addTextSnippet: 'xxx';
		
		addCodeSnippet: 'integer := $- asPParser optional , #digit asPParser plus , $. asPParser not.';
		
		
		
		addCodeSnippet: '

float := $- asPParser optional , #digit asPParser plus , $. asPParser
		, #digit asPParser plus.
number := integer / float.'
]
