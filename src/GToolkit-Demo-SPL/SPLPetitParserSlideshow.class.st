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
SPLPetitParserSlideshow >> asSmallCode: aString [
	^ aString asRopedText
		glamorousMonospace;
		fontSize: 20
]

{ #category : #slides }
SPLPetitParserSlideshow >> buildingTheAST: aSlide [
	<gtSlide>
	<text: '# Building the AST with parser actions

The parser we have created just recognizes SPL programs, but doesn''t perform any actions. Now we''d like to build an abstract syntax tree for the programs that are recognized.

In our very first example we saw that actions can be specified with the `==>` double arrow operator, which points to a block (*i.e.,* an anonymous function) that can transform the parsed data into something useful. We''ll define a *subclass* of our basic grammar parser that decorates each parsing expression with an action. Note that the `SPLParser` `printStmt` method inherits `printStmt` from the superclass and adds the action.

For each grammar rule we''ll create an instance of an `SPLNode` subclass that will store the interesting bits in the instance variables of the AST node. In this case we create an `SPLPrintStatement` node and store the second part that was parse, namely the expression to be printed.

Now when we parse a bit of code with our refined parser expressions we get a proper AST node instead of an array of data.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Building the AST with parser actions')
]

{ #category : #page }
SPLPetitParserSlideshow >> buildingTheASTPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Building the AST with parser actions')
		addSnippet: (LeTextSnippet new
				string: 'The current parser, {{gtClass:name=SPLGrammar}}, just recognizes the grammar, but does nothing with it.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'We define a subclass, {{gtClass:name=SPLParser}}, that builds AST nodes.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'Actions are specified with the `==>` operation, like this, where we build a {{gtClass:name=SPLPrintStatement}} node for a `print` statement in {{gtMethod:name=SPLParser>>#printStmt|expanded}}';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'Note that we only want the second part of the node that has been parsed by the inherited production, namely the expression.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'All the rules look like this.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'SPLParser new printStmt parse: ''print "hello";''.';
				yourself);
		yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> classExtraction: aSlide [
	<gtSlide>
	<text: '## Extracting a parser class

Once we have a working script, we can apply a refactoring transformation to turn it into a class.

We initialize any recursive parsers, and then create a self-contained script that does not refer to any outside classe sor variables. We can right-click inside the script to `Extract PetitParser class`.

This creates a class in which each parsing expression is defined as a method, and its value is cached as an instance variable.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Extracting a parser class')
]

{ #category : #page }
SPLPetitParserSlideshow >> classExtractionPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Extracting a parser class')
		addSnippet: (LeTextSnippet new
				string: 'At some point to continue developing the parser, it should be turned into a class, so we can write tests and deploy the parser.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'The class can be extracted automatically. First we initialize any recursive productions.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'expression := PP2UnresolvedNode new.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'We create a snippet that contains *only* definitions of rules, with no reference to outside classes or variables.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'boolean := ''true'' asPParser trim / ''false'' asPParser trim.
integer := #digit asPParser plus , $. asPParser not trim.
float := $- asPParser optional , #digit asPParser plus , $. asPParser
		, #digit asPParser plus trim.
number := integer / float.
parenthesizedExpression := $( asPParser trim , expression , $) asPParser trim.
primary := parenthesizedExpression / boolean / number.
factor := primary , ($/ asPParser trim / $* asPParser trim , primary) star.
term := factor , (''-'' asPParser trim / ''+'' asPParser trim , factor) star.
expression := term.
exprStmt := expression , $; asPParser trim.
program := exprStmt star end.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'We extract the class and test it.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'program parse: ''3+4*6;''';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'Note that the resulting parser class is a subclass of {{gtClass:name=PP2CompositeNode}}, it has both a method and a slot for each production, and a `start` method is automatically generated.';
				yourself);
		yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> coda: aSlide [
	<gtSlide>
	<text: '# Coda

You can explore the SPL case study for yourself by downloading Glamorous Toolkit from [gtoolkit.com](https://gtoolkit.com) and going to the page “PetitParser SPL case study” in the GT Book.'>
	^ aSlide textAndElement
		elementWeight: 0.5;
		setPriority;
		newTextWithFormat: (self asHeader: 'Explore on your own ...') bold , self cr
				, (self
						asText: 'You can find the details by downloading GT from gtoolkit.com and visiting the “PetitParser SPL case study” page.');
		element: [ (LeDatabase gtBook pageNamed: 'PetitParser SPL case study') asPreviewElement ]
]

{ #category : #slides }
SPLPetitParserSlideshow >> debuggingParsers: aSlide [
	<gtSlide>
	<text: '## Debugging parsers

Here''s a slightly buggy version of our `print` statement parser that fails with this input.

The result is a PetitParser “Failure” object that shows us the execution trace of the parser at the point where it failed. If we inspect this, we can walk through the tree to see how far it got.

We discover that after recognizing the “print” string, it expects a quotation mark for the start of a string, instead of whitespace. We fix this by adding the missing `trim` to the `print` parser.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Debugging parsers')
]

{ #category : #page }
SPLPetitParserSlideshow >> debuggingParsersPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Debugging parsers')
		addSnippet: (LeTextSnippet new
				string: 'The following parser fails to parse the print statement.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'We can debug it by inspecting the error, and stepping through the execution trace.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'string := $" asPParser , $" asPParser negate plus , $" asPParser.

printStmt := ''print'' asPParser , string , $; asPParser trim.

printStmt end parse: ''print "hello";''.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'After debugging, we see that there is a whitespace `trim` missing ...';
				yourself);
		yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> fibonacci: aSlide [
	<gtSlide>
	<text: '## Fibonacci in SPL

Here''s a Fibonacci program in SPL.

Since SPL doesn''t have procedures, we cannot define a Fibonacci function, but we can make it into a program. Also SPL programs don''t take arguments, so we have to encode the argument as a variable in the first line.

The algorithm simply keeps track of the last two Fibonacci values, printing out each new value computed, and terminating when we reach the required number of iterations.

Notice how the semantics of the `while` statement has been implemented by *unfolding* the while into an if statement where the “then” part contains one iteration of the body followed by another copy of the while loop.
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Fibonacci in SPL')
]

{ #category : #page }
SPLPetitParserSlideshow >> fibonacciPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Fibonacci in SPL')
		addSnippet: (LeTextSnippet new
				string: 'Here is a more complex example. Note especially how the `while` statement is reduced.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'SPL fibonacci.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'Look at the history view to explore the reductions in detail.';
				yourself);
		yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingBooleans: aSlide [
	<gtSlide>
	<text: '## Parsing Booleans

To parse a character or a string, we just send it the message `asParser`.

Here we create two parsers, one which will parse the string `''true''`, and the other `''false''`.

We compose them with the *ordered choice* operator, `/`, to parse either `true` or `false`.'>
	^ aSlide headingAndCode
		setPriority;
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
<text:
'# Parsing grammar rules

Now we have parsing expressions for all the SPL tokens except strings. We can proceed to the actual grammar rules.

The `trim` operator makes it easy to get rid of whitespace following a token. The `end` operator will match the end of input, making sure that everything is parsed.'>
	^ aSlide headingAndCode
		setPriority;
		heading: 'Parsing grammar rules';
		elementWeight: 0.3;
		snippetPadding: 5;
		addTextSnippet: 'We continue to implement parsers for declarations and statements.';
		addTextSnippet: 'The `trim` operator is used to trim away whitespace.
The `end` operator ensure that all the input is consumed.';
		addCodeSnippet: 'string := $" asPParser , $" asPParser negate plus , $" asPParser.

printStmt := ''print'' asPParser trim , string , $; asPParser trim.

printStmt end parse: ''print "hello";'''
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingIntegersAndFloats: aSlide [
	<gtSlide>
	<text: '## Parsing Integers and Floats

PetitParser makes use of numerous operators, or *combinators* to compose parsing expressions.

The `optional` operator creates a new parser that will parser either zero or one token. The `plus` operators will parse ` or more tokens.

The `not` operator does not consume a token, but simply fails if it sees the token, otherwise it succeeds. Here we make sure that an integer will only be recognized if there is no trailing period. If we add a period, the parse will fail.

Parsing floats is similar, but in this case we *do* want the dot to be parsed.'>
	^ aSlide headingAndCode
		setPriority;
		heading: 'Parsing Integers and Floats';
		snippetPadding: 5;
		addTextSnippet: 'Note the use of the `optional`  and `plus` operators.';
		addTextSnippet: 'The `not` operator ensures no period follows an integer,
but no input will be consumed.';
		addCodeSnippet: 'integer := $- asPParser optional ,
		#digit asPParser plus , 
		$. asPParser not.
integer parse: ''42''.';
		addTextSnippet: 'Floats are similar, but with a period.';
		addCodeSnippet: 'float := $- asPParser optional , 
		#digit asPParser plus , 
		$. asPParser, #digit asPParser plus.
float parse: ''3.14''.'
]

{ #category : #slides }
SPLPetitParserSlideshow >> parsingKeywords: aSlide [
	<gtSlide>
<text:
'## Parsing Keywords and Identifiers

Here we use the `not` combinator to make sure we don''t accidentally recognize the token `and` in identifiers such as `android` or `andy`.'>
	^ aSlide headingAndCode
		setPriority;
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
	<text: '## Parsing Numbers

We can now combine the parsing expressions to recognize numbers as either integers or floats.

Note that the choice operator is strictly ordered. It will *first* attempt to parse an integer, and *only if that fails* will it try to parse a float.'>
	^ aSlide headingAndCode
		setPriority;
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
	<text: '# Parsing tokens

PetitParser is a *scannerless* parser.

This means we do not have a separate scanner for individual tokens based on regular expressions, but instead we use parsing expressions for tokens as well.

We''ll introduce parsing expressions for all of the SPL tokens, namely Boolens, integers, floats, strings, keywords and identifiers.'>
	^ aSlide text
		setPriority;
		textMargin: 10;
		newTextWithFormat: (self asHeader: 'Parsing tokens');
		newTextWithFormat: (self
				asText: 'PetitParser is a scannerless parser, so we introduce parsing expressions also for tokens.')
]

{ #category : #slides }
SPLPetitParserSlideshow >> partialGrammarScript: aSlide [
	<gtSlide>
	<text: '# Prototyping the SPL grammar parser as a script

We continue to iteratively prototype the various SPL grammar rules until we have a complete grammar implemented as PetitParser parsing expressions.

Note that we must take special care with recursive grammar rules, as we cannot use parsers that have not yet been defined.

To break the recursion, the first time we introduce a recursive parser, such as `expression`, we define it as an instance of `PP2UnresolvedNode`. Then, once we have defined the other parsers that it needs for its own definition (and that use it recurseively, we *redefine* it use `def:`.

We can see that `expression` is later redefined as `term`.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Prototyping the SPL grammar parser as a script')
]

{ #category : #page }
SPLPetitParserSlideshow >> partialGrammarScriptPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Prototyping the SPL grammar parser as a script')
		addSnippet: (LeTextSnippet new
				string: 'We iteratively prototype our parser as a script.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'Note that recursive productions, like `expression`, have to be initialized and then redefined.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'boolean := ''true'' asPParser trim / ''false'' asPParser trim.
integer := #digit asPParser plus , $. asPParser not trim.
float := $- asPParser optional , #digit asPParser plus , $. asPParser
		, #digit asPParser plus trim.
number := integer / float.

"A recursive production must be initialized."
expression := PP2UnresolvedNode new.

parenthesizedExpression := $( asPParser trim , expression , $) asPParser trim.
primary := parenthesizedExpression / boolean / number.
factor := primary , ($/ asPParser trim / $* asPParser trim , primary) star.
term := factor , (''-'' asPParser trim / ''+'' asPParser trim , factor) star.

"Redefine the recursive production."
expression def: term.

exprStmt := expression , $; asPParser trim.
program := exprStmt star end.

"A simple test case."
program parse: ''6 * (3 + 4);''.';
				yourself);
		yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> reductionStepsScenery: aSlide [
	<gtSlide>
	<text: '## An example of semantic reduction steps

Semantic reductions specify how a program state, consisting of an AST of a program fragment, and a context consisting of the environment of variables bindings, and the output stream thus far, are transformed to a new state.

Here we see that, if an expression can be reduced, then a print statement with that expression must reduce that expression first. On the other hand, if the expression is already fully reduced to a value, we simply add that value to the output, replacing the print statement by the value.

Another rule will allow us to discard that value and replace it by whatever continuation follows (if any).

Instead of formally writing down all the transformation rules, instead we directly implement them in Smalltalk.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Semantic rules for reducing a print statement';
		element: [ SPLPetitParserSlideshow new splReductionScenery ]
]

{ #category : #slides }
SPLPetitParserSlideshow >> runningAnSPLProgram: aSlide [
	<gtSlide>
	<text: '## Running an SPL program

To run an SPL program, we create a new context holding the AST of the program as its continuation, and an empty environment and output. If we inspect this object, we can then step through the execution, and also explore the history of all the reductions steps.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Running an SPL program')
]

{ #category : #page }
SPLPetitParserSlideshow >> runningAnSPLProgramPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Running an SPL program')
		addSnippet: (LeTextSnippet new
				string: 'To run a program, we parse it, and then run it in a *context* that tracks (1) the executing code, (2) the environment, and (3) the output.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'SPLContext for: ''var x = 3; print x + 4;''.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'As we step through the execution, we see the code being *reduced* step by step, while the environment and output are updated.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'We can also see the history of all the states.';
				yourself);
		yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> semanticsOfPrinting: aSlide [
	<gtSlide>
	<text: '## The semantics of printing

Every SPL AST node has a `stepInContext:` method that allows it perform one reduction step, and return a new, reduced AST.

Let''s just look at one of these, namely that of the `print` statement. A print statement prints the value of an expression. The reduction step, then, should check if the expressions value is already known, in which case we can just print it. If not, we have to perform a reduction step.

In the first case we return the AST for the reduced expression, which will be discarded in the next step, and in the second case, we return a new print statement AST with the expression redcued by one step. In either case we make some small progress.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'The semantics of printing')
]

{ #category : #slides }
SPLPetitParserSlideshow >> semanticsOfPrintingPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'The semantics of printing')
	addSnippet: (LeTextSnippet new
			string: 'A print statement prints the value of an expression.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'If the expression has been *reduced* to a value, then we can just print it, and return the AST of the expression.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'If not, then we replace the expression by a new one that has been reduced by one step.';
			yourself);
	addSnippet: (LeElementSnippet new
			code: '(SPLPrintStatement>>#stepInContext:) gtSourceFor:  GtPhlowProtoView new';
			codeVisible: false;
			elementHeight: 221;
			codeHeight: 50;
			yourself);
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> semanticsOfSPL: aSlide [
	<gtSlide>
	<text: '# SPL Semantics

We don''t just want to parse SPL programs, but we also want to execute them.

This can be done in numerous ways. We could generate bytecode for a virtual machine for an existing language, like Java, or we could directly compile SPL programs to machine code.

Another approach is to *interpret* SPL programs by transforming them, step-by-step, to simpler programs. This approach is called *Structural Operational Semantics*. We''d like to see each step of the execution, so we use what is called “small step” semantics.

SPL programs don''t take any input except what is specified in the source code itself. Programs have variables, so we need to track the bindings of variables to values, and we need to track any output that is produced. That means that the *context* of a running SPL program consists in three parts: 
(1) the current “continuation”, *i.e.,* the “rest of the program” to be executed,
(2) the environment of variables and their values, and
(3) the output so far.

When we start executing, the continuation is the full program, the environment is empty, and so is the output.

When the program ends, the continuation is empty (the empty program), the environment contains the set of all variables and their final values, and the output is the final list of everything that has been printed.'>
	^ aSlide text
		horizontalWeight: 0.6;
		textMargin: 5;
		setPriority;
		newTextWithFormat: (self asHeader: 'SPL Semantics');
		newTextWithFormat: (self asText: 'We use “small-step” ')
				, (self asText: 'Structural Operational Semantics') italic
				, (self
						asText: ' to model the execution of an SPL program as a sequence of steps from one program state to the next.');
		newTextWithFormat: (self asText: 'Every program state is a ') , (self asText: 'context') italic
				, (self asText: ' consisting of three parts:');
		newTextWithFormat: (self asText: '1.  The rest of the code') bold;
		newTextWithFormat: (self asText: 'The list of statements left to be executed.');
		newTextWithFormat: (self asText: '2. The environment') bold;
		newTextWithFormat: (self asText: 'A dictionary of variables and values.');
		newTextWithFormat: (self asText: '3. The output') bold;
		newTextWithFormat: (self asText: 'The collection of printed output strings.')
]

{ #category : #accessing }
SPLPetitParserSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."

	<gtExample>
	<return: #Array>
	^ #(#title: whatIsPP: splGrammar: splExample: parsingTokens: parsingBooleans: parsingIntegersAndFloats: parsingNumbers: parsingKeywords: parsingGrammarRules: debuggingParsers: partialGrammarScript: classExtraction: writingTests: buildingTheAST: theASThierarchy: semanticsOfSPL: reductionStepsScenery: semanticsOfPrinting: runningAnSPLProgram: fibonacci: coda:)
]

{ #category : #slides }
SPLPetitParserSlideshow >> splExample: aSlide [
	<gtSlide>
	<text: '## An SPL example

SPL does not have procedures or objects, but it has loops, however, so it is still Turing-complete.'>
	^ aSlide text
		horizontalWeight: 0.75;
		textMargin: 10;
		setPriority;
		newTextWithFormat: (self asHeader: 'An SPL example');
		newTextWithFormat: (self asText: 'SPL is a minimal language with variables, expressions, ')
				, (self asCode: 'if') , (self asText: ', ') , (self asCode: 'while')
				, (self asText: ' and ') , (self asCode: 'print')
				, (self asText: ' statements, but no procedures or classes.');
		newTextWithFormat: (self
				asCode: '// Compute the factorial of arg

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
	<text: '## SPL Grammar

SPL is a simple, structured programming language with a compact grammar.'>
	^ aSlide text
		horizontalWeight: 1;
		textMargin: 10;
		setPriority;
		newTextWithFormat: (self asHeader: 'SPL Grammar');
		newTextWithFormat: (self
				asSmallCode: 'program        := declaration* EOF ;
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

{ #category : #scenery }
SPLPetitParserSlideshow >> splReductionScenery [
	"NB: Generated by GtScenery>>#storeAsExampleMethod -- do not edit."

	<gtExample>
	<noTest>
	| scenery item1 item2 item3 item4 item5 item6 item7 item8 item9 item10 item11 |
	scenery := GtScenery new.
	item1 := scenery
			addSceneryItem: (GtSceneryTextLabelStencil new
					label: '<print e, env, out>';
					width: 121.67251603688464) asItem.
	item1 position: 104.90226236979174 @ 344.9063618977864.
	item1 extent: 121.67251603688464 @ 28.0.
	item2 := scenery
			addSceneryItem: (GtSceneryShapeStencil new
					geometry: BlRectangleGeometry new;
					backgroundColorSelector: #black) asItem.
	item2 position: 102.3768310546875 @ 339.813954671224.
	item2 extent: 322.3955702182981 @ 2.0.
	item3 := scenery
			addSceneryItem: (GtSceneryTextLabelStencil new
					label: '<e,env,out>';
					width: 84.20973764640391) asItem.
	item3 position: 144.115556675002 @ 306.5425516764323.
	item3 extent: 84.20973764640391 @ 28.0.
	item4 := scenery
			addSceneryItem: (GtSceneryTextLabelStencil new
					label: '<e'',env'',out''>';
					width: 92.66339908197381) asItem.
	item4 position: 299.2138878968681 @ 306.31961743927246.
	item4 extent: 92.66339908197381 @ 28.0.
	item5 := scenery
			addSceneryItem: (GtSceneryTextLabelStencil new
					label: '<print e'', env'', out''>';
					width: 127.56517309480688) asItem.
	item5 position: 299.82520423106445 @ 344.6003135610237.
	item5 extent: 127.56517309480688 @ 28.0.
	item6 := scenery
			addSceneryItem: (GtSceneryShapeStencil new
					geometry: BlRectangleGeometry new;
					backgroundColorSelector: #black) asItem.
	item6 position: 118.1089988565237 @ 443.86885768753086.
	item6 extent: 280.7751292250923 @ 2.0.
	item7 := scenery
			addSceneryItem: (GtSceneryTextLabelStencil new
					label: 'isValue(v)';
					width: 81.7199179286091) asItem.
	item7 position: 224.16167204167948 @ 413.019139297555.
	item7 extent: 81.7199179286091 @ 28.0.
	item8 := scenery
			addSceneryItem: (GtSceneryTextLabelStencil new
					label: '<print v, env, out>';
					width: 122.08343617317871) asItem.
	item8 position: 115.69436267970269 @ 448.94664204274807.
	item8 extent: 122.08343617317871 @ 28.0.
	item9 := scenery
			addSceneryItem: (GtSceneryTextLabelStencil new
					label: '<v, env, (out,v)>';
					width: 119.76527778841603) asItem.
	item9 position: 291.4401130187551 @ 449.30572949473736.
	item9 extent: 119.76527778841603 @ 28.0.
	item10 := scenery
			addSceneryItem: (GtSceneryMindMapNodeStencil new
					label: 'e is not fully evaluated, so reduce it one step (possibly updating the environment and the output)';
					width: 170.2723444160792) asItem.
	item10 position: -91.53504780209973 @ 239.11014811197913.
	item10 extent: 170.2723444160792 @ 82.0.
	item11 := scenery
			addSceneryItem: (GtSceneryMindMapNodeStencil new
					label: 'e is a fully reduced value v, so add it to the output';
					width: 167.83151753743505) asItem.
	item11 position: -89.22905821876645 @ 414.10246785481775.
	item11 extent: 167.83151753743505 @ 46.0.
	scenery
		addConnectionWithStencil: (GtSceneryStraightArcStencil new
				curvatureFraction: 0)
		from: item3
		to: item4.
	scenery
		addConnectionWithStencil: (GtSceneryStraightArcStencil new
				curvatureFraction: 0)
		from: item1
		to: item5.
	scenery
		addConnectionWithStencil: (GtSceneryStraightArcStencil new
				curvatureFraction: 0)
		from: item8
		to: item9.
	scenery storeStringMethodName: 'SPLPetitParserSlideshow>>#splReductionScenery'.
	^ scenery
]

{ #category : #slides }
SPLPetitParserSlideshow >> theASThierarchy: aSlide [
	<gtSlide>
	<text: '## The SPL AST hierarchy

We introduce an AST node class for every different syntactic element of the SPL  grammar. Each leaf node can pretty-print itself, and can also perform an interpretation step.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'The SPL AST hierarchy')
]

{ #category : #page }
SPLPetitParserSlideshow >> theASThierarchyPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'The SPL AST hierarchy')
		addSnippet: (LeTextSnippet new
				string: 'Each node can handle pretty printing, and supports step-by-step interpretation.';
				yourself);
		addSnippet: (LeExampleSnippet new
				exampleBehaviorName: #SPLCaseStudyExamples;
				exampleSelector: #splNodeHierarchy;
				noCode: true;
				previewShowSelector: #gtLiveFor:;
				previewHeight: 700);
		addSnippet: (LeTextSnippet new
				string: 'Each node can handle pretty printing, and supports step-by-step interpretation.';
				yourself);
		yourself
]

{ #category : #slides }
SPLPetitParserSlideshow >> title: aSlide [
	<gtSlide>
	<text: '# Building composable parsers with PetitParser

This slideshow is for the PetitParser lecture of the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.

The slideshow can be explored live by downloading [GToolkit](https://gtoolkit.com) and inspecting:
```
SPLPetitParserSlideshow new
```
'>
	^ aSlide titleWithFooter
		setPriority;
		titleBottomPadding: 30;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Building composable parsers');
		subtitleWithFormat: (self asTitle: 'with PetitParser');
		footerWithFormat: (self asBigText: 'oscar.nierstrasz@feenk.com')
]

{ #category : #slides }
SPLPetitParserSlideshow >> whatIsPP: aSlide [
	<gtSlide>
	<text: '# What is PetitParser?

[PetitParser](https://scg.unibe.ch/research/helvetia/petitparser) is a parsing framework that combines several related parsing technologies: scannerless parsers, parser combinators, parsing expression grammars and packrat parsers.

The core idea is that parsers can be composed to form more complex parsers. That makes it convenient to develop and debug parsers.

In this example the `number` parser is composed of a `#digit` parser, and converts the parsed string to a number. The `addition` parser is composed of `number` and `+` parsers and performs the addition.'>
	^ aSlide headingAndCode
		setPriority;
		heading: 'What is PetitParser?';
		addTextSnippet: 'PetitParser models parsers as *composable* objects.';
		addCodeSnippet: 'number := #digit asPParser plus  token
	==> [ :token | token  value asNumber ].

addition := (number , $+ asPParser  , number)
	==> [ :nodes | nodes first + nodes last ].

addition parse: ''3+4'''
]

{ #category : #slides }
SPLPetitParserSlideshow >> writingTests: aSlide [
	<gtSlide>
	<text: '## Writing parser tests

We write tests to ensure that each parsing expression and every grammar rule works as expected.

It''s good practice to subclass `PP2CompositeNodeExamples`, a class that offers some utilities for testing parsers. In this example we simply test that a small program source can be parsed by the `program` parser, but not by `declaration` or `statement`.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Writing parser tests')
]

{ #category : #page }
SPLPetitParserSlideshow >> writingTestsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Writing parser tests')
		addSnippet: (LeTextSnippet new
				string: 'We write tests to verify that code snippets are correctly parsed by certain production rules and not others. ';
				yourself);
		addSnippet: (LeExampleSnippet new
				exampleBehaviorName: #SPLGrammarExamples;
				exampleSelector: #whileProgram);
		addSnippet: (LeTextSnippet new
				string: 'We check that this sample code is parsed as a `program`, and not as a `statement` or a `declaration`.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'After completing and testing all the parser rules, we end up with {{gtClass:name=SPLGrammar}} and {{gtClass:name=SPLGrammarExamples}}.';
				yourself);
		yourself
]
