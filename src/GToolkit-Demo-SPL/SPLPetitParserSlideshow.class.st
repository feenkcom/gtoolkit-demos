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
SPLPetitParserSlideshow >> debuggingParsers: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #debuggingParsers:);
		heading: 'What is PetitParser?'

]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingBooleans: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #parsingBooleans:);
		heading: 'Parsing Booleans';
		snippetPadding: 5;
		addTextSnippet: 'To create a parser for a string, just send it `asParser`.';
		addCodeSnippet: '''true'' asPParser.
''false'' asPParser.';
		addTextSnippet: 'We can compose parsers with the `/` ordered choice operator.';
		addCodeSnippet: 'boolean := ''true'' asPParser 
		/ ''false'' asPParser.
boolean parse: ''true''.'
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingGrammarRules: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #parsingGrammarRules:);
		heading: 'Parsing grammar rules';
		elementWeight: 0.3;
		snippetPadding: 5;
		addTextSnippet: 'We continue to implement parsers for declarations and statements.';
		addTextSnippet: 'The `trim` operator is used to trim away whitespace. The `end` operator ensure that all the input is consumed.';
		addCodeSnippet: 'string := $" asPParser , $" asPParser negate plus , $" asPParser.

printStmt := ''print'' asPParser trim , string , $; asPParser trim.

printStmt end parse: ''print "hello";'''
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingIntegersAndFloats: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #parsingIntegersAndFloats:);
		heading: 'Parsing Integers and Floats';
		snippetPadding: 5;
		addTextSnippet: 'Note the use of the `optional`  and `plus` operators.
The `not` operator ensures no period follows an integer,
but no input will be consumed.';
		addCodeSnippet: 'integer := $- asPParser optional ,
		#digit asPParser plus , 
		$. asPParser not.
integer parse: ''42''.';
		addTextSnippet: 'Floats are similar, but with a period.';
		addCodeSnippet: 'float := $- asPParser optional , 
		#digit asPParser plus , 
		$. asPParser, #digit asPParser plus.'
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingKeywords: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #parsingKeywords:);
		heading: 'Parsing Keywords and Identifiers';
		snippetPadding: 5;
		elementWeight: 0.4;
		addTextSnippet: 'We want to distinguish keywords and identifiers, so we use the `not` operator to ensure that a keyword is not followed by another letter.';
		
		addCodeSnippet: 'keyword := (''var'' asPParser , #letter asPParser not)
		/ (''if'' asPParser , #letter asPParser not)
		/ (''else'' asPParser , #letter asPParser not)
		/ (''while'' asPParser , #letter asPParser not)
		/ (''true'' asPParser , #letter asPParser not)
		/ (''false'' asPParser , #letter asPParser not)
		/ (''and'' asPParser , #letter asPParser not)
		/ (''or'' asPParser , #letter asPParser not).

identifier := keyword not, #letter asPParser, #word asPParser star.

identifier end parse: ''andy''.'
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingNumbers: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #parsingNumbers:);
		heading: 'Parsing Numbers';
		snippetPadding: 5;
		addTextSnippet: 'Numbers are an ordered choice of integers and floats.';
		
		addCodeSnippet: 'integer := $- asPParser optional , 
	#digit asPParser plus , $. asPParser not.
	
float := $- asPParser optional , 
	#digit asPParser plus , $. asPParser,
	#digit asPParser plus.
		
number := integer / float.

number parse: ''-3.14''.'
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingTokens: aSlide [
	<gtSlide>
	^ aSlide text
		priority: (self priorityFor: #parsingTokens:);
		newTextWithFormat: (self asHeader: 'Parsing tokens');
		newTextWithFormat: (self asText: 'PetitParser is a scannerless parser, so we introduce parsing expressions also for tokens.')
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
			parsingBooleans:
			parsingIntegersAndFloats:
			parsingNumbers:
			parsingKeywords:
	
		parsingGrammarRules:
			debuggingParsers:
	)
]

{ #category : #slides }
SPLPetitParserSlideshow >> splExample: aSlide [
	<gtSlide>
	^ aSlide text
		horizontalWeight: 1;
		priority: (self priorityFor: #splExample:);
		newTextWithFormat: (self asText: 'SPL is a minimal language with variables, expressions, ')
				, (self asCode: 'if') , (self asText: ', ') , (self asCode: 'while')
				, (self asText: ' and ') , (self asCode: 'print')
				, (self asText: ' statements, but no procedures or classes.');
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
		addTextSnippet: 'PetitParser models parsers as *composable* objects.';
		addCodeSnippet: 'number := #digit asPParser plus  token
	==> [ :token | token  value asNumber ].

addition := (number , $+ asPParser  , number)
	==> [ :nodes | nodes first + nodes last ].

addition parse: ''3+4'''
]
