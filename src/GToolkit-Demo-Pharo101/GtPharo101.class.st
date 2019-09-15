"
I am a tutorial presentation for beginners.
"
Class {
	#name : #GtPharo101,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #adding }
GtPharo101 >> addArraysSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Arrays';
				firstText: 'Literal Arrays are created at parse time').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Array Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"Creates an Array with 3 elements"
#(1 2 3).' . '"Creates an Array with 4 elements, the forth one being another Array"
#(1 2 3 #(4 5 6)) size.'.
							'"Creates an empty Array"
#() isEmpty.' . '#(1 2 3) first.' . '#(4 5 6) last.' . '"Replacing World with Pharo by specifying the index in the array"
#(''hello'' ''World'') at: 2 put: ''Pharo''; yourself.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addBasicTypesSlidesIn: aSlider [
	aSlider addSlide: (GtTitleSlide new
				titleText: ('Pharo 101' asRopedText fontSize: 70);
				subtitleText: ('Basic types' asRopedText fontSize:50; foreground: Color gray)).
	self addNumbersSlidesIn: aSlider.
	self addCharactersSlidesIn: aSlider.
	self addStringsSlidesIn: aSlider.
	self addSymbolsSlidesIn: aSlider.
	self addArraysSlidesIn: aSlider.
	self addDynamicArraysSlidesIn: aSlider.
]

{ #category : #adding }
GtPharo101 >> addBinaryMessagesSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Binary messages';
				firstText: 'They look like anObject aMessage anotherObject';
				secondText: 'And they are operands containing characters like +, *, &, |, <, =, >').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Binary messages examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"In this case, the message * is sent to 21 with 2 as argument"
21 * 2.' . 'Date today + 42 weeks.' .
'"The operand & is also a binary message. Here it is sent to true with false as argument"
true & false.'.
							'"Here, the message is <="
41 <= 42.' . 
'"The message comma applies to ''ab'' with the argument being ''cd''"
''ab'',''cd''.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addBlockAssignationSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Blocks assignment';
				firstText: 'Blocks can be assgined to a variable and can be executed later').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Block assignation examples';
				element: [ GtPlaygroundSlide new
						snippets: {'x := [:a | a + 2]' . 'x value: 40'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addBlockExecutionSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Blocks execution';
				firstText: 'We can execute a block by sending value messages to it').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Blocks examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'[ 40 + 2 ] value'. '[ :x | x + 2 ] value: 40.' . '[ :x :y | x + y ] value: 40 value: 2.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addBlocksSlidesIn: aSlider [
	aSlider addSlide: (GtTitleSlide new
				titleText: ('Pharo 101' asRopedText fontSize: 70);
				subtitleText: ('Blocks' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addSlide: (GtTextSlide new
				firstText: 
					'Blocks are anonymous methods that can be stored into variables and executed on demand.';
				secondText: 'Blocks are delimited by square brackets [].').
	self addBlockExecutionSlidesIn: aSlider.
	self addBlockAssignationSlidesIn: aSlider.
]

{ #category : #adding }
GtPharo101 >> addCascadeOperatorSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Cascade operator';
				firstText: 'The cascade operator is useful to send messages to the same receiver.';
				secondText: 'It is denoted with ;.').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Cascade operator examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"Both + messages are sent to 2"
40 + 3; + 2.' . '"The one above is equivalent to: "
40 + 3. 40 + 2.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addCharactersSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Characters';
				firstText: 'A character can be instantiated using $ operator').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Character examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'$A.' . '$A class.' . '$A charCode.' . '"You can print all 256 characters of the ASCII extended set"
Character allByteCharacters.'.
							'"Showing the ASCII code of the space character"
Character space charCode.'.
							'"Showing the ASCII code of the new-line character"
Character cr charCode.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addConditionalsAndLoopsSlidesIn: aSlider [
	aSlider addSlide: (GtTitleSlide new
				titleText: ('Pharo 101' asRopedText fontSize: 70);
				subtitleText: ('Conditionals and Loops' asRopedText fontSize:50; foreground: Color gray)).
	self addConditionalsSlidesIn: aSlider.
	self addLoopsSlidesIn: aSlider.
	self addIteratorsSlidesIn: aSlider.
]

{ #category : #adding }
GtPharo101 >> addConditionalsSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				firstText: 'Conditionals just messages sent to Boolean objects';
				secondText: 'The main messages are ifTrue: , ifFalse: , ifTrue:ifFalse:').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Conditionals examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{('1 < 2 ' , Character cr asString , '	ifTrue:[ 42 ]'
								, Character cr asString , '	ifFalse: [ 100 ].').
							('$a > $b' , Character cr asString , '	ifTrue:[ 100 ]'
								, Character cr asString , '	ifFalse:[ 42 ].')};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addDynamicArraysSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Dynamic arrays';
				firstText: 'Dynamic arrays are created at execution time').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Dynamic arrays examples';
				element: [ GtPlaygroundSlide new
						snippets: {'{ (40 + 2). (6 * 6 + 6) }.' . '{(2+3) . (6*6) . ''Hello'', ''world''} size.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addInstantiationSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText:
					('Instantiation' asRopedText
						fontSize: 50;
						foreground: Color gray)).
	aSlider
		addSlide:
			(GtTextSlide new
				firstText: 'Objects are instances of their class';
				secondText:
					'Usually, we send the message #new to a class to create an instance of that class').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Instantiation examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{
							'"The message #new creates an instance of the class it is sent to. In this case, it results in an OrderedCollection with 0 elements."
collection := OrderedCollection new.' .
							'"The message #allInstances answers an array with all the instances of the class it is sent to"
BrButton allInstances size.'.};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addIteratorsSlidesIn: aSlider [
	| doExample enterChar |
	enterChar := Character cr asString.
	doExample := 'y := 0.' , enterChar
		, '#(11 38 3 -2 10) do: [ :each | y := y + each ].' , enterChar , 'y.'.
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Iterators';
				firstText:
					'Iterators are collection messages that evaluate the argument block for each element').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Iterators examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{doExample.
							'#(11 38 3 -2 10) collect: [ :each | each abs ].'.
							'#(11 38 3 -2 10) select: [ :each | each odd ].'.
							'#(11 38 3 -2 10) reject: [ :each | each > 10 ].'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addKeywordMessagesSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Keyword messages';
				firstText: 'They look like anObject aKey: anotherObject aKey2: anotherObject2').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Keyword messages examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"The message between:and: is sent to object 42 with 41 and 43 as arguments"
42 between: 41 and: 43' . '"The message is r:g:b: sent to Color (i.e., the object representing the class Color)"
Color r: 0 g: 0.42 b: 0'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addLoopsSlidesIn: aSlider [
	| firstExample secondExample thirdExample enterChar |
	enterChar := Character cr asString.
	firstExample := '"In this case, i gets every value from 1 to 10, and gets added to x"
x := 0.' , enterChar , '1 to: 10 do: [:i | x := x+i ].' , enterChar
		, 'x.'.
	secondExample := '"Similarly, but i gets only every other value ( 1, 3, .. )"
x := 0.' , enterChar , '1 to: 10 by: 2 do: [:i | x := x+i ].'
		, enterChar , 'x.'.
	thirdExample := '"In this case, i goes from 10 to 0, getting every other value"
x := 0.' , enterChar , '10 to: 0 by: -2 do: [:i | x := x+i ].'
		, enterChar , 'x.'.
	aSlider
		addSlide:
			(GtTextSlide new
				firstText: 'Loops are high-level collection iterators, implemented as regular methods';
				secondText: 'Two basic loops are to:do: and to:by:do:').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Loops Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{firstExample.
							secondExample.
							thirdExample};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addMathematicalPrecedenceSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Mathematical precedence';
				firstText: 'Traditional precedence rules from mathematics do not apply in Pharo';
				secondText:
					'Messages are executed from left to right. Only parentheses can change this').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Mathematical precedence examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"First we do (2 * 20) and then we add 2 to the result"
2 * 20 + 2.' .
'"But here, we do (3 + 18) first and then multiply the result with 2"
3 + 18 * 2.'.
							'"Here, we first we do (87 - 3) and then divide the result by 2"
87 - 3 / 2.'.
'"Using the parentheses changes the order"
2 + (2 * 20).' };
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addMessagesExecutionOrderSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Messages execution order';
				firstText: 'Unary messages take precedence over Binary which take precendence over Keywords.';
				secondText:
					'Between messages of similar precedence, they are executed from left to right').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Messages execution order examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"This is equivalent to: (6 + (6 squared)), where squared is an Unaru message and + is a Binary"
6 + 6 squared.'.
							'"This is equivalent to: (2 raisedTo: (3+2)), where + is a Binary message and raisedTo: is a Keyword"
2 raisedTo: 3 + 2.'.
							'"These are all Unary messages, so they are executed in order. This is equivalent to: (((-3 abs) negated) reciprocal)."
-3 abs negated reciprocal.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addMessagesSlidesIn: aSlider [
	aSlider addSlide: (GtTitleSlide new
				titleText: ('Pharo 101' asRopedText fontSize: 70);
				subtitleText: ('Messages' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addSlide: (GtTextSlide new
				firstText: 'Messages are sent to objects.';
				secondText: 'There are three types of messages: Unary, Binary and Keyword').
	self addUnaryMessagesSlidesIn: aSlider.
	self addBinaryMessagesSlidesIn: aSlider.
	self addKeywordMessagesSlidesIn: aSlider.
	self addMessagesExecutionOrderSlidesIn: aSlider.
	self addParenthesesSlidesIn: aSlider.
	self addMathematicalPrecedenceSlidesIn: aSlider.
	self addCascadeOperatorSlidesIn: aSlider.
]

{ #category : #adding }
GtPharo101 >> addNumbersSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Numbers';
				firstText: '2, 42, 2/84 ... are all Numbers';
				secondText:
					'They all respond to many messages evaluating mathematical expressions').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Number examples';
				element: [ GtPlaygroundSlide new
						snippets: {'40 + 2.' . '42 factorial.' . '2/84.' . '42 class maxVal.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addParenthesesSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Parentheses';
				firstText: 'They can change the order of execution').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Parentheses examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"Instead of executing (3 squared) first being an Unary message, using the parentheses we do th (2+3) first even though it is a Binary message"
(2+3) squared.'.
							'"Doing the Keyword message first and then the Binary one"
(2 raisedTo: 3) + 2.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addReflectionSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText:
					('Reflection' asRopedText
						fontSize: 50;
						foreground: Color gray)).
	aSlider
		addSlide:
			(GtTextSlide new
				firstText: 'It allows us to inspect and change the system at runtime').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Reflection examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"For example, we can see all the methods implemented in a class"
GtPharo101 selectors.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addStringsSlidesIn: aSlider [
	| accessingBook concatenationBook |
	accessingBook := self
		createBookFrom: {'''Hello world'' at: 1.' . '''Hello world'' at: 11.'}.
	concatenationBook := self
		createBookFrom: {'''Hello'','' world''.' . '''Strings are'','' cool''.'}.
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Strings';
				firstText: 'A String is a collection of characters';
				secondText: 'To create them, you can use single quotes').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'String examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'''This is a string''.' . '''This is a string'' size.'.
							'''abc'' asUppercase.' . '''Hello world'' reverse.'};
						asElement ]).
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'You can access each character using at: message';
				element: (GtInspector createOnPlayBook: accessingBook)).
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'And you can concatenate strings using the comma operator';
				element: (GtInspector createOnPlayBook: concatenationBook))
]

{ #category : #adding }
GtPharo101 >> addSymbolsSlidesIn: aSlider [	
	aSlider addSlide: (GtTextSlide new
		subtitle: 'Symbols';
		firstText: 'A Symbol is a String which is guaranteed to be globally unique.';
		secondText: 'There is one and only one Symbol #MySymbol, but there can be several ''MySymbol'' String objects').
	aSlider addSlide: (GtTextAndElementSlide new
		text: 'Symbol examples';
		element: [ 
			GtPlaygroundSlide new 
				snippets: {
					'"Turns the String into a Symbol"
''MySymbol'' asSymbol.'. 
							'"Turns the Symbol into a String"
#MySymbol asString.'.
							'"Message == return true is the two objects are the SAME"
(2 asString) == (2 asString).'. 
							'(2 asString) asSymbol == (2 asString) asSymbol.'};
				asElement ]).
]

{ #category : #adding }
GtPharo101 >> addUnaryMessagesSlidesIn: aSlider [	
	aSlider addSlide: (GtTextSlide new
		subtitle: 'Unary messages';
		firstText: 'They appear simply as anObject aMessage').
	aSlider addSlide: (GtTextAndElementSlide new
		text: 'Unary messages examples';
		element: [GtPlaygroundSlide new snippets: {'42 class.'. 'false not.'. 'Date today.'. 'Float pi.'}; asElement ]).
]

{ #category : #accessing }
GtPharo101 >> create [
	| show |
	
	show := GtSlideShow new.
	show addSlide: (GtTitleSlide new
				titleText: ('Pharo 101' asRopedText fontSize: 70)).
	
	self addBasicTypesSlidesIn: show.
	self addMessagesSlidesIn: show.
	self addBlocksSlidesIn: show.
	self addConditionalsAndLoopsSlidesIn: show.
	self addInstantiationSlidesIn: show.
	self addReflectionSlidesIn: show.
	
	show addSlide: (GtTitleSlide new
				titleText: ('Enjoy programming with Pharo' asRopedText fontSize: 70)).
	
	^ show.
]

{ #category : #adding }
GtPharo101 >> createBookFrom: aCollection [
	| aBook |
	aBook := GtPlayBook newDefault.
	aBook pages first snippets first sourceCode: (aCollection at: 1).
	aCollection allButFirst do: [:el |
		aBook pages first addSnippet: GtCoderSnippet new.
		aBook pages last snippets last sourceCode: el].
	^ aBook.
]
