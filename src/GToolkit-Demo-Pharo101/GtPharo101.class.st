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
				subtitle: 'Binary Messages';
				firstText: 'They have the following form: anObject aMessage anotherObject';
				secondText: 'And they are always operands like: +, *, &, |').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Binary Messages Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"The message * applys to object 3 with the object 2"
3*2.' . 'Date today + 3 weeks.' . '"The operand & is also a binary message. Here sent to true with object false"
true & false.'.
							'"The message here is <="
10 <= 12.' . '"The message comma applys to the object ''ab'' with the object ''cd'' concatenating the both"
''ab'',''cd''.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addBlockAssignationSlidesIn: aSlider [
	| codeExample |
	codeExample := 'x := [:a | a + 2].' , Character cr asString
		, 'x value:12.'.
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Blocks Assignation';
				firstText: 'Blocks can be assgined to a variable then executed later').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Block Assignation Examples';
				element: [ GtPlaygroundSlide new
						snippets: {codeExample};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addBlockExecutionSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Blocks Execution';
				firstText: 'We can execute a block by sending it value messages').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Blocks Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'[:x | x+2] value: 5.' . '[:x :y| x + y] value:3 value:5.'.
							'[GTPlayground open] value.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addBlocksSlidesIn: aSlider [
	aSlider addSlide: (GtTitleSlide new
				titleText: ('Pharo 101' asRopedText fontSize: 70);
				subtitleText: ('Blocks' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addSlide: (GtTextSlide new
				firstText: 
					'They are anonymous methods that can be stored into variables and executed on demand';
				secondText: 'And are delimited by square brackets []').
	self addBlockExecutionSlidesIn: aSlider.
	self addBlockAssignationSlidesIn: aSlider.
]

{ #category : #adding }
GtPharo101 >> addCascadeOperatorSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Cascade Operator';
				firstText: 'It is noted with ;';
				secondText: 'And it is useful to send messages to the same receiver').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Cascade Operator Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"Both + messages are sent to 2"
2+3;+5.' . '"The one above is equivalent to: "
2+3. 2+5.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addCharactersSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Characters';
				firstText: 'They can be instantiated using $ operator').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Character Examples';
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
				subtitle: 'Conditionals';
				firstText: 'Are just messages sent to Boolean objects';
				secondText: 'The messages are: ifTrue: , ifFalse: , ifTrue:ifFalse:').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Conditionals Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{('1 < 2 ' , Character cr asString , '	ifTrue:[100]'
								, Character cr asString , '	ifFalse:[42].').
							('$a > $b' , Character cr asString , '	ifTrue:[100]'
								, Character cr asString , '	ifFalse:[42].')};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addDynamicArraysSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Dynamic Arrays';
				firstText: 'Dynamic Arrays are created at execution time').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Dynamic Array Examples';
				element: [ GtPlaygroundSlide new
						snippets: {'{ (2+3). (6*6) }.' . '{(2+3) . (6*6) . ''Hello'', ''world''} size.'};
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
				text: 'Instantiation Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"The message #allInstances answers an array with all the instances of the class it is sent to"
SimpleButtonMorph allInstances size.'.
							'"Below, the message #new will create an instance of the class it is sent to, thus resulting in an OrderedCollection with 0 elements."
collection := OrderedCollection new.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addIteratorsSlidesIn: aSlider [
	| doExample enterChar |
	enterChar := Character cr asString.
	doExample := 'y:=0.' , enterChar
		, '#(11 38 3 -2 10) do: [:each | y:=y+each].' , enterChar , '^y.'.
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Iterators';
				firstText:
					'They are messages sent to a collection of objects evaluating the block for each element').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Iterators Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{doExample.
							'#(11 38 3 -2 10) collect: [:each | each abs].'.
							'#(11 38 3 -2 10) select: [:each | each odd].'.
							'#(11 38 3 -2 10) reject: [:each | each > 10].'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addKeywordMessagesSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Keyword Messages';
				firstText: 'They are messages with arguments';
				secondText:
					'And have the following form: anObject aKey: anotherObject aKey2: anotherObject2').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Keyword Messages Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"The message is between:and: sent to object 4"
4 between: 0 and: 10.' . '"The message is r:g:b: implemented on class Color"
Color r:1 g:0 b:0.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addLoopsSlidesIn: aSlider [
	| firstExample secondExample thirdExample enterChar |
	enterChar := Character cr asString.
	firstExample := '"From 1 to 10, i gets every value and we add that to x"
x := 0.' , enterChar , '1 to: 10 do: [:i | x := x+i].' , enterChar
		, '^ x.'.
	secondExample := '"Same as before, but i gets every other value ( 1, 3, .. )"
x := 0.' , enterChar , '1 to: 10 by: 2 do: [:i | x := x+i].'
		, enterChar , '^ x.'.
	thirdExample := '"Here i goes from 10 to 0, getting every other value"
x := 0.' , enterChar , '10 to: 0 by: -2 do: [:i | x := x+i].'
		, enterChar , '^ x.'.
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Loops';
				firstText:
					'They are high-level collection iterators, implemented as regular methods';
				secondText: 'Basic loops: to:do: , to:by:do:').
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
				subtitle: 'Mathematical Precedence';
				firstText: 'Traditional precedence rules from mathematics do not apply in Pharo';
				secondText:
					'Messages are executed from left to right. Only parentheses can change this').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Mathematical Precedence Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"First we do (2*10) and then we add 2 to the result"
2*10+2.' . '"But here, we do (2+2) first and then multiply the result with 10"
2+2*10.'.
							'"Using the parentheses we change the order, this being equivalent to the first example, not the second"
2+(2*10).'.
							'"First we do (8-5) and then divide the result by 2"
8-5/2.'};
						asElement ])
]

{ #category : #adding }
GtPharo101 >> addMessagesExecutionOrderSlidesIn: aSlider [
	aSlider
		addSlide:
			(GtTextSlide new
				subtitle: 'Messages Execution Order';
				firstText: 'The order of execution is: Unary -> Binary -> Keywords';
				secondText:
					'Between messages of similar precedence, they are executed from left to right').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Messages Execution Order Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"This is equivalent to: (2 + (3 squared)), squared being an Unaru message and + being a Binary
"2 + 3 squared.'.
							'"This is equivalent to: (2 raisedTo: (3+2)), + being a Binary message and raisedTo: a Keyword
"2 raisedTo: 3 + 2.'.
							'"This is equivalent to: (((-3 abs)negated)reciprocal): all being Unary messages, so they are executed in order"
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
				firstText: '1, 2, 100, 2/3 ... are all Numbers';
				secondText:
					'They all respond to many messages evaluating mathematical expressions').
	aSlider
		addSlide:
			(GtTextAndElementSlide new
				text: 'Number Examples';
				element: [ GtPlaygroundSlide new
						snippets: {'2+3.' . '20 factorial.' . '1/3.' . '1 class maxVal.'};
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
				text: 'Parentheses Examples';
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
				text: 'Reflection Examples';
				element: [ GtPlaygroundSlide new
						snippets:
							{'"For example, we can see all the methods implemented in a class"
PharoTutorial selectors.'};
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
				text: 'String Examples';
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
		text: 'Symbol Examples';
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
		subtitle: 'Unary Messages';
		firstText: 'They have the following form: anObject aMessage').
	aSlider addSlide: (GtTextAndElementSlide new
		text: 'Unary Messages Examples';
		element: [GtPlaygroundSlide new snippets: {'1 class.'. 'false not.'. 'Date today.'. 'Float pi.'}; asElement ]).
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
				titleText: ('Enjoy programming in Pharo' asRopedText fontSize: 70)).
	
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
