"
I am a tutorial presentation for beginners.
"
Class {
	#name : #PharoTutorialPresentation,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #adding }
PharoTutorialPresentation >> addArraysSlidesIn: aSlider [
	| examplesBook |
	examplesBook := self createBookFrom: {
		'"Creates an Array with 3 elements"
#(1 2 3).'. 
		'"Creates an Array with 4 elements, the forth one being another Array"
#(1 2 3 #(4 5 6)) size.'. 
		'"Creates an empty Array"
#() isEmpty.'.
		'#(1 2 3) first.'.
		'#(4 5 6) last.'.
		'"Replacing World with Pharo by specifying the index in the array"
#(''hello'' ''World'') at: 2 put: ''Pharo''; yourself.'
	}.
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Arrays';
		firstText: 'Literal Arrays are created at parse time').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Array Examples';
		element: (GtInspector createOnPlayBook: examplesBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addBasicTypesSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Basic types' asRopedText fontSize:50; foreground: Color gray)).
	self addNumbersSlidesIn: aSlider.
	self addCharactersSlidesIn: aSlider.
	self addStringsSlidesIn: aSlider.
	self addSymbolsSlidesIn: aSlider.
	self addArraysSlidesIn: aSlider.
	self addDynamicArraysSlidesIn: aSlider.
]

{ #category : #adding }
PharoTutorialPresentation >> addBinaryMessagesSlidesIn: aSlider [
	| binaryExamplesBook |
	binaryExamplesBook := self createBookFrom: {
		'"The message * applys to object 3 with the object 2"
3*2.'. 
		'Date today + 3 weeks.'. 
		'"The operand & is also a binary message. Here sent to true with object false"
true & false.'.
		'"The message here is <="
10 <= 12.'.
		'"The message comma applys to the object ''ab'' with the object ''cd'' concatenating the both"
''ab'',''cd''.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Binary Messages';
		firstText: 'They have the following form: anObject aMessage anotherObject';
		secondText: 'And they are always operands like: +, *, &, |').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Binary Messages Examples';
		element: (GtInspector createOnPlayBook: binaryExamplesBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addBlockAssignationSlidesIn: aSlider [
	| aBook codeExample |
	codeExample := 'x := [:a | a + 2].', Character cr asString,'x value:12.'.
	aBook := self createBookFrom: {codeExample}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Blocks Assignation';
		firstText: 'Blocks can be assgined to a variable then executed later').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Block Assignation Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addBlockExecutionSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'[:x | x+2] value: 5.'. 
		'[:x :y| x + y] value:3 value:5.'. 
		'[GTPlayground open] value.'
	}.
		
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Blocks Execution';
		firstText: 'We can execute a block by sending it value messages').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Blocks Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addBlocksSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Blocks' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
				firstText: 
					'They are anonymous methods that can be stored into variables and executed on demand';
				secondText: 'And are delimited by square brackets []').
	self addBlockExecutionSlidesIn: aSlider.
	self addBlockAssignationSlidesIn: aSlider.
]

{ #category : #adding }
PharoTutorialPresentation >> addCascadeOperatorSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"Both + messages are sent to 2"
2+3;+5.'.
		'"The one above is equivalent to: "
2+3. 2+5.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Cascade Operator';
		firstText: 'It is noted with ;';
		secondText: 'And it is useful to send messages to the same receiver').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Cascade Operator Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addCharactersSlidesIn: aSlider [
	| basicExamplesBook |
	
	basicExamplesBook := self createBookFrom: {
		'$A.'. 
		'$A class.'. 
		'$A charCode.'.  
		'"You can print all 256 characters of the ASCII extended set"
Character allByteCharacters.'.
		'"Showing the ASCII code of the space character"
Character space charCode.'.
		'"Showing the ASCII code of the new-line character"
Character cr charCode.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Characters';
		firstText: 'They can be instantiated using $ operator').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Character Examples';
		element: (GtInspector createOnPlayBook: basicExamplesBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addConditionalsAndLoopsSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Conditionals and Loops' asRopedText fontSize:50; foreground: Color gray)).
	self addConditionalsSlidesIn: aSlider.
	self addLoopsSlidesIn: aSlider.
	self addIteratorsSlidesIn: aSlider.
]

{ #category : #adding }
PharoTutorialPresentation >> addConditionalsSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'1 < 2 ',Character cr asString,'	ifTrue:[100]',Character cr asString,'	ifFalse:[42].'. 
		'$a > $b',Character cr asString,'	ifTrue:[100]',Character cr asString,'	ifFalse:[42].'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Conditionals';
		firstText: 'Are just messages sent to Boolean objects';
		secondText: 'The messages are: ifTrue: , ifFalse: , ifTrue:ifFalse:').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Conditionals Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addDynamicArraysSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'{ (2+3). (6*6) }.'. 
		'{(2+3) . (6*6) . ''Hello'', ''world''} size.'
	}.
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Dynamic Arrays';
		firstText: 'Dynamic Arrays are created at execution time').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Dynamic Array Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addInstantiationSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"The message #allInstances answers an array with all the instances of the class it is sent to"
SimpleButtonMorph allInstances size.'.
		'"Below, the message #new will create an instance of the class it is sent to, thus resulting in an OrderedCollection with 0 elements."
collection := OrderedCollection new.'
	}.
	
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Instantiation' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
		firstText: 'Objects are instances of their class';
		secondText: 'Usually, we send the message #new to a class to create an instance of that class').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Instantiation Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addIteratorsSlidesIn: aSlider [
	| aBook doExample enterChar |
	enterChar := Character cr asString.
	doExample := 'y:=0.',enterChar,'#(11 38 3 -2 10) do: [:each | y:=y+each].',enterChar,'^y.'.
	aBook := self createBookFrom: {
		doExample.
		'#(11 38 3 -2 10) collect: [:each | each abs].'.
		'#(11 38 3 -2 10) select: [:each | each odd].'.
		'#(11 38 3 -2 10) reject: [:each | each > 10].'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Iterators';
		firstText: 
			'They are messages sent to a collection of objects evaluating the block for each element').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Iterators Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addKeywordMessagesSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"The message is between:and: sent to object 4"
4 between: 0 and: 10.'. 
		'"The message is r:g:b: implemented on class Color"
Color r:1 g:0 b:0.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Keyword Messages';
		firstText: 'They are messages with arguments';
		secondText: 'And have the following form: anObject aKey: anotherObject aKey2: anotherObject2').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Keyword Messages Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addLoopsSlidesIn: aSlider [
	| aBook firstExample secondExample thirdExample enterChar |
	enterChar := Character cr asString.
	firstExample := '"From 1 to 10, i gets every value and we add that to x"
x := 0.',enterChar,'1 to: 10 do: [:i | x := x+i].',enterChar, '^ x.'.
	secondExample := '"Same as before, but i gets every other value ( 1, 3, .. )"
x := 0.',enterChar,'1 to: 10 by: 2 do: [:i | x := x+i].',enterChar, '^ x.'.
	thirdExample := '"Here i goes from 10 to 0, getting every other value"
x := 0.',enterChar,'10 to: 0 by: -2 do: [:i | x := x+i].',enterChar, '^ x.'.
	
	aBook := self createBookFrom: {
		firstExample.
		secondExample.
		thirdExample
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Loops';
		firstText: 'They are high-level collection iterators, implemented as regular methods';
		secondText: 'Basic loops: to:do: , to:by:do:').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Loops Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addMathematicalPrecedenceSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"First we do (2*10) and then we add 2 to the result"
2*10+2.'. 
		'"But here, we do (2+2) first and then multiply the result with 10"
2+2*10.'. 
		'"Using the parentheses we change the order, this being equivalent to the first example, not the second"
2+(2*10).'. 
		'"First we do (8-5) and then divide the result by 2"
8-5/2.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Mathematical Precedence';
		firstText: 'Traditional precedence rules from mathematics do not apply in Pharo';
		secondText: 'Messages are executed from left to right. Only parentheses can change this').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Mathematical Precedence Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addMessagesExecutionOrderSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"This is equivalent to: (2 + (3 squared)), squared being an Unaru message and + being a Binary
"2 + 3 squared.'. 
		'"This is equivalent to: (2 raisedTo: (3+2)), + being a Binary message and raisedTo: a Keyword
"2 raisedTo: 3 + 2.'. 
		'"This is equivalent to: (((-3 abs)negated)reciprocal): all being Unary messages, so they are executed in order"
-3 abs negated reciprocal.'
}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Messages Execution Order';
		firstText: 'The order of execution is: Unary -> Binary -> Keywords';
		secondText: 'Between messages of similar precedence, they are executed from left to right').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Messages Execution Order Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addMessagesSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Messages' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
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
PharoTutorialPresentation >> addNumbersSlidesIn: aSlider [
	| aBook |
	
	aBook := self createBookFrom: {'2+3.'. '20 factorial.'. '1/3.'. '1 class maxVal.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Numbers';
		firstText: '1, 2, 100, 2/3 ... are all Numbers';
		secondText: 'They all respond to many messages evaluating mathematical expressions').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Number Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addParenthesesSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"Instead of executing (3 squared) first being an Unary message, using the parentheses we do th (2+3) first even though it is a Binary message"
(2+3) squared.'. 
		'"Doing the Keyword message first and then the Binary one"
(2 raisedTo: 3) + 2.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Parentheses';
		firstText: 'They can change the order of execution').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Parentheses Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addReflectionSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"For example, we can see all the methods implemented in a class"
PharoTutorial selectors.'
	}.
	
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Reflection' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
		firstText: 'It allows us to inspect and change the system at runtime').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Reflection Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addStringsSlidesIn: aSlider [
	| basicExamplesBook accessingBook concatenationBook |
	
	basicExamplesBook := self createBookFrom: {'''This is a string''.'. 
		'''This is a string'' size.'. '''abc'' asUppercase.'. '''Hello world'' reverse.'}.	
	accessingBook := self createBookFrom: {'''Hello world'' at: 1.'. '''Hello world'' at: 11.'}.
	concatenationBook := self createBookFrom: {'''Hello'','' world''.'. '''Strings are'','' cool''.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Strings';
		firstText: 'A String is a collection of characters';
		secondText: 'To create them, you can use single quotes').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'String Examples';
		element: (GtInspector createOnPlayBook: basicExamplesBook)).
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'You can access each character using at: message';
		element: (GtInspector createOnPlayBook: accessingBook)).
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'And you can concatenate strings using the comma operator';
		element: (GtInspector createOnPlayBook: concatenationBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addSymbolsSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"Turns the String into a Symbol"
''MySymbol'' asSymbol.'. 
		'"Turns the Symbol into a String"
#MySymbol asString.'.
		'"Message == return true is the two objects are the SAME"
(2 asString) == (2 asString).'. 
		'(2 asString) asSymbol == (2 asString) asSymbol.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Symbols';
		firstText: 'A Symbol is a String which is guaranteed to be globally unique.';
		secondText: 'There is one and only one Symbol #MySymbol, but there can be several ''MySymbol'' String objects').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Symbol Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorialPresentation >> addUnaryMessagesSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'1 class.'. 'false not.'. 'Date today.'. 'Float pi.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Unary Messages';
		firstText: 'They have the following form: anObject aMessage').
	aSlider addNewSlide: (GtTextAndElementSlide new
		text: 'Unary Messages Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #'as yet unclassified' }
PharoTutorialPresentation >> createBookFrom: aCollection [
	| aBook |
	aBook := GtPlayBook newDefault.
	aBook pages first snippets first sourceCode: (aCollection at: 1).
	(aCollection size > 1)
		ifTrue: [ aCollection allButFirst do: [:el |
				aBook pages first addSnippet: GtCoderSnippet new.
				aBook pages last snippets last sourceCode: el] ].
	^ aBook.
]

{ #category : #accessing }
PharoTutorialPresentation >> start [
	| slider |
	
	slider := GtSlider new.
	slider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: 
					('Tutorial for beginners' asRopedText fontSize: 50; foreground: Color gray)).
	
	self addBasicTypesSlidesIn: slider.
	self addMessagesSlidesIn: slider.
	self addBlocksSlidesIn: slider.
	self addConditionalsAndLoopsSlidesIn: slider.
	self addInstantiationSlidesIn: slider.
	self addReflectionSlidesIn: slider.
	
	slider addNewSlide: (GtTitleSlide new
				titleText: ('Enjoy programming in Pharo' asRopedText fontSize: 70)).
	
	^ slider.
]
