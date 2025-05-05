"
I am a tutorial presentation for beginners.


"
Class {
	#name : #GtPharo101,
	#superclass : #Object,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #accessing }
GtPharo101 >> arrayExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 31;
		newTextWithFormat: (self subtitleString: 'Array');
		newTextWithFormat: (self descriptionString: 'An array is a fixed-sized collection of elements accessed by integer indices. The first element is found at position 1. To access the elements we use the #at: and #at:put: messages.');
		element: [GtPlaygroundLiveSlide new
			snippets: {'array1 := Array new: 5.
array1 at: 1 put: 11.
array1 at: 2 put: 12.
array1 at: 4 put: 14.
array1'.
'array1 size'.
'array2 := Array braceWith: 5 with: 7 with: 9 with: 11.'.
'array3 := #( 42 42.0 ''thirdElement'' #lastElement).
array3 at: 3'};
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> basicTypesTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 5;
		titleWithFormat: ('Pharo 101' asRopedText glamorousRegularFont fontSize: 70);
		subtitleWithFormat: ('Basic types' asRopedText glamorousRegularFont fontSize:50; foreground: Color gray).
]

{ #category : #accessing }
GtPharo101 >> binaryMessagesExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 16;
		newTextWithFormat: (self subtitleString: 'Binary messages');
		newTextWithFormat: (self descriptionString: 'They have the following form: anObject aMessage anotherObject, and they are operands consisting of characters like: +,*,&,|,<,=,>.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"In this case, the message * is sent to 21 with 2 as argument"
21 * 2.' . 'Date today + 42 weeks.' .
'"The operand & is also a binary message. Here it is sent to true with false as argument"
true & false.'.
							'"Here, the message is <="
41 <= 42.' . 
'"The message comma applies to ''ab'' with the argument being ''cd''"
''ab'',''cd''.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> blocksExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 23;
		newTextWithFormat: (self descriptionString: 'Blocks are anonymous methods that can be stored into variables and executed later. They are delimited by square brackets []. To execute them, we use the #value: message.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '[ 40 + 2 ] value'. '[ :x | x + 2 ] value: 40.' . '[ :x :y | x + y ] value: 40 value: 2.'. 'x := [:a | a + 2]' . 'x value: 40' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> blocksTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 22;
		titleWithFormat: ('Pharo 101' asRopedText glamorousRegularFont fontSize: 70);
		subtitleWithFormat: ('Blocks' asRopedText glamorousRegularFont fontSize:50; foreground: Color gray).
]

{ #category : #accessing }
GtPharo101 >> booleanAndConditionalsTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 24;
		titleWithFormat: ('Pharo 101' asRopedText glamorousRegularFont fontSize: 70);
		subtitleWithFormat: ('Boolean and Conditionals' asRopedText glamorousRegularFont fontSize:50; foreground: Color gray).
]

{ #category : #accessing }
GtPharo101 >> booleansExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 25;
		newTextWithFormat: (self subtitleString: 'Booleans');
		newTextWithFormat: (self descriptionString: 'Booleans are objects that can be either true or false.');
		element: [
			GtPlaygroundLiveSlide new 
				snippets: {('1 > 2 ').
							'''hello world''=''hello world'''.
							'true'.
							'false'.
							'true not'.
							'(1>2) not'
						};
				asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> cascadeOperatorExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 21;
		newTextWithFormat: (self subtitleString: 'Cascade operator');
		newTextWithFormat: (self descriptionString: 'The cascade operator is denoted with ; and it is useful for sending multiple messages to the same receiver.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"Both + messages are sent to 40"
40 + 3; + 2.' . '"The one above is equivalent to: "
40 + 3. 40 + 2.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> charactersExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: (self subtitleString: 'Characters');
		newTextWithFormat: (self descriptionString: 'They are instantiated using the $ operator.');
		element: [ GtPlaygroundLiveSlide new 
			snippets: {'$A.' . '$A class.' . '$A charCode.' . '"You can print all 256 characters of the ASCII extended set"
Character allByteCharacters.'.
							'"Showing the ASCII code of the space character"
Character space charCode.'.
							'"Showing the ASCII code of the new-line character"
Character cr charCode.'};
			asElement];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> collectionsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 30;
		newTextWithFormat: (self subtitleString: 'Collections');
		newTextWithFormat: (self descriptionString: 'A collection is a group of objects.').
]

{ #category : #accessing }
GtPharo101 >> conditionalsExplanation [
]

{ #category : #accessing }
GtPharo101 >> conditionalsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 26;
		newTextWithFormat: (self subtitleString: 'Conditionals');
		newTextWithFormat: (self descriptionString: 'Conditionals are messages sent to Boolean objects. The main messages are #ifTrue:, #ifFalse: and #ifTrue:ifFalse:.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { 
				('1 < 2' , String cr , String tab, 'ifTrue:[ 42 ]', String cr , String tab, 'ifFalse: [ 100 ].').
				('$a > $b' , String cr , String tab, 'ifTrue:[ 100 ]', String cr , String tab, 'ifFalse:[ 42 ].') };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #'as yet unclassified' }
GtPharo101 >> descriptionString: aString [
	^ aString asRopedText glamorousRegularFont; fontSize: 20.
]

{ #category : #accessing }
GtPharo101 >> dictionaryExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 34;
		newTextWithFormat: (self subtitleString: 'Dictionary');
		newTextWithFormat: (self descriptionString: 'A dictionary is a collection of elements that associate a key object with a value object. The pair key->value is an association object so the dictionary can be viewed as a collection of associations. The key can be any object that responds to the #= message.');
		element: [GtPlaygroundLiveSlide new
			snippets: {'dictionary := Dictionary new.
dictionary add: 5 -> 10.
dictionary add: 10 -> 20.
dictionary at: 30 put: 60.
dictionary'.
'dictionary size'.
'dictionary at: 10 ifAbsent: [''Key Not Found'']'.
'dictionary at: 11 ifAbsent: [''Key Not Found'']'.
'dictionary keyAtValue: 20'};
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> dynamicArraysExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: (self subtitleString: 'Dynamic Arrays');
		newTextWithFormat: (self descriptionString: 'They are created at execution time.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '{ (40 + 2). (6 * 6 + 6) }.' . '{(2+3) . (6*6) . ''Hello'', ''world''} size.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> instantiationExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 36;
		newTextWithFormat: (self descriptionString: 'An object is an instance of their class. Usually, we send the #new message to a class to create an instance of that class.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"The message #new creates an instance of the class it is sent to. In this case, it results in an OrderedCollection with 0 elements."
collection := OrderedCollection new.' .
							'"The message #allInstances answers an array with all the instances of the class it is sent to"
BrButton allInstances size.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> instantiationTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 35;
		titleWithFormat: ('Pharo101' asRopedText glamorousRegularFont fontSize: 70);
		subtitleWithFormat:
			('Instantiation' asRopedText 
				glamorousRegularFont 
				fontSize: 50;
				foreground: Color gray).
]

{ #category : #accessing }
GtPharo101 >> iteratorsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 29;
		newTextWithFormat: (self subtitleString: 'Iterators');
		newTextWithFormat: (self descriptionString: 'They are collection messages that evaluate the argument block for each element.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { 'y := 0.' , String cr , '#(11 38 3 -2 10) do: [ :each | y := y + each ].' , String cr , 'y.'. '#(11 38 3 -2 10) collect: [ :each | each abs ].'. '#(11 38 3 -2 10) select: [ :each | each odd ].'. '#(11 38 3 -2 10) reject: [ :each | each > 10 ].' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> keywordMessagesExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 17;
		newTextWithFormat: (self subtitleString: 'Keyword messages');
		newTextWithFormat: (self descriptionString: 'They have the following form: anObject aKey: anotherObject aKey2: anotherObject2.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"The message between:and: is sent to object 42 with 41 and 43 as arguments"
42 between: 41 and: 43' . '"The message is r:g:b: sent to Color (i.e., the object representing the class Color)"
Color r: 0 g: 0.42 b: 0' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> literalArraysExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 10;
		newTextWithFormat: (self subtitleString: 'Literal Arrays');
		newTextWithFormat: (self descriptionString: 'Literal Arrays are created at parse time.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"Creates an Array with 3 elements"
#(1 2 3).' . '"Creates an Array with 4 elements, the forth one being another Array"
#(1 2 3 #(4 5 6)) size.'.
							'"Creates an empty Array"
#() isEmpty.' . '#(1 2 3) first.' . '#(4 5 6) last.' . '"Replacing World with Pharo by specifying the index in the array. The array is copied since literals are not allowed to be modified."
#(''hello'' ''World'') copy at: 2 put: ''Pharo''; yourself.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> loopsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 28;
		newTextWithFormat: (self subtitleString: 'Loops');
		newTextWithFormat: (self descriptionString: 'Loops are high-level collection iterators, implemented as regular methods. Two basic loops are #to:do: and #to:by:do:.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"In this case, i gets every value from 1 to 10, and gets added to x"
x := 0.' , String cr , '1 to: 10 do: [:i | x := x+i ].' , String cr , 'x.'.
'"Similarly, but i gets only every other value ( 1, 3, .. )"
x := 0.' , String cr , '1 to: 10 by: 2 do: [:i | x := x+i ].' , String cr , 'x.'.
'"In this case, i goes from 10 to 0, getting every other value"
x := 0.' , String cr , '10 to: 0 by: -2 do: [:i | x := x+i ].' , String cr , 'x.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> loopsIteratorsAndCollectionsTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 27;
		titleWithFormat: ('Pharo 101' asRopedText glamorousRegularFont fontSize: 70);
		subtitleWithFormat: ('Loops, Iterators and Collections' asRopedText glamorousRegularFont fontSize:50; foreground: Color gray).
]

{ #category : #accessing }
GtPharo101 >> mathematicalPrecedenceExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 20;
		newTextWithFormat: (self subtitleString: 'Mathematical precedence');
		newTextWithFormat: (self descriptionString: 'Traditional mathematical precedence rules do not apply in Pharo. Messages are executed from left to right. Only parentheses can change this.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"First we do (2 * 20) and then we add 2 to the result"
2 * 20 + 2.' .
'"But here, we do (3 + 18) first and then multiply the result with 2"
3 + 18 * 2.'.
							'"Here, we first we do (87 - 3) and then divide the result by 2"
87 - 3 / 2.'.
'"Using the parentheses changes the order"
2 + (2 * 20).' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> messagesExecutionOrderExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 18;
		newTextWithFormat: (self subtitleString: 'Messages execution order');
		newTextWithFormat: (self descriptionString: 'The messages are executed as follows: first unary, then binary and finally keyword messages. If there are one or more messages of similar precedence, they are executed from left to right.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"This is equivalent to: (6 + (6 squared)), where squared is an Unary message and + is a Binary"
6 + 6 squared.'.
							'"This is equivalent to: (2 raisedTo: (3+2)), where + is a Binary message and raisedTo: is a Keyword"
2 raisedTo: 3 + 2.'.
							'"These are all Unary messages, so they are executed in order. This is equivalent to: (((-3 abs) negated) reciprocal)."
-3 abs negated reciprocal.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> messagesExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 14;
		newTextWithFormat: (self descriptionString: 'Messages are sent to objects. There are three types of messages: Unary, Binary and Keyword.').
]

{ #category : #accessing }
GtPharo101 >> messagesTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 13;
		titleWithFormat: ('Pharo 101' asRopedText glamorousRegularFont fontSize: 70);
		subtitleWithFormat: ('Messages' asRopedText glamorousRegularFont fontSize:50; foreground: Color gray).
]

{ #category : #accessing }
GtPharo101 >> numbersExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 6;
		newTextWithFormat: (self subtitleString: 'Numbers');
		newTextWithFormat: (self descriptionString: 'These are all numbers: 2, 42, 2/84. And they all respond to various messages evaluating mathematical expressions.');
		element: [ GtPlaygroundLiveSlide new 
			snippets: {'40 + 2.' . '42 factorial.' . '2/84.' . '42 class maxVal.'};
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> orderedCollectionExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 32;
		newTextWithFormat: (self subtitleString: 'Ordered Collection');
		newTextWithFormat: (self descriptionString: 'An ordered collection is a more general array that has a variable number of elements. The data is stored in an array with the first and last indexes remembered. When the size of the collection won''t change, we can use #asArray for better performance.');
		element: [GtPlaygroundLiveSlide new
			snippets: {'oc1 := OrderedCollection new.
oc1 add: 2.
oc1 add: ''secondElement''.
oc1 add: #thirdElement.
oc1 add: 8.
oc1'.
'oc2 := OrderedCollection new.
oc2 addAll: oc1.
oc2 first.'.
'oc2 remove: 8.
oc2 last.'.
'oc2 size'.
'oc2 asArray'};
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> parenthesesExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 19;
		newTextWithFormat: (self subtitleString: 'Parentheses');
		newTextWithFormat: (self descriptionString: 'Parentheses can change the order of execution.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"Instead of executing (3 squared) first being an Unary message, using the parentheses we do th (2+3) first even though it is a Binary message"
(2+3) squared.'.
							'"Doing the Keyword message first and then the Binary one"
(2 raisedTo: 3) + 2.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> playgroundExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 2;
		newTextWithFormat: self shortPlaygroundExplanationText;
		elementWeight: 0.6;
		element: [ self shortPlaygroundExplanation ].
]

{ #category : #accessing }
GtPharo101 >> reflectionExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 38;
		newTextWithFormat: (self descriptionString: 'Reflection allows us to inspect and change the system at runtime.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '"For example, we can see all the methods implemented in a class"
GtPharo101 selectors.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> reflectionTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 37;
		titleWithFormat: ('Pharo101' asRopedText glamorousRegularFont; fontSize: 70);
		subtitleWithFormat:
			('Reflection' asRopedText
				glamorousRegularFont; 
				fontSize: 50;
				foreground: Color gray).
]

{ #category : #accessing }
GtPharo101 >> setExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 33;
		newTextWithFormat: (self subtitleString: 'Set');
		newTextWithFormat: (self descriptionString: 'A set is a collection of objects without duplicates. It can hold any object that responds to the messages #hash and #=.');
		element: [GtPlaygroundLiveSlide new
			snippets: {'set1 := Set new.
set1 add: 1.
set1 add: 7.
set1 add: 3.
set1 add: 7.
set1'.
'set1 occurrencesOf: 7'.
'set2 := #( 1 2 3 4 2 3) asSet.'.
'set2 size'.
'set1 intersection: set2'.
'set1 difference: set2'};
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> shortPlaygroundExplanation [
	<gtExample>
	<return: #BlElement>
	| container playgroundElement newSnippetButtons inspectButtons aScripter snippets |
	container := BlElement new
			constraintsDo: [ :c | 
				c vertical matchParent.
				c horizontal matchParent ];
			layout: BlLinearLayout horizontal;
			margin: (BlInsets all: 5);
			background: Color white;
			aptitude: BrShadowAptitude.
	newSnippetButtons := OrderedCollection new.
	inspectButtons := OrderedCollection new.
	playgroundElement := GtPlaygroundLiveSlide new
			snippets: {'a := 2.
a + 5'.
					'b := 1.
a - b'};
			asElement.
	aScripter := BlScripter new.
	aScripter element: playgroundElement.
	aScripter
		substep: 'Selecting snippets'
		do: [ :aStep | 
			aStep
				clickStep: [ :s | 
					s
						label: 'Click on snippet';
						onBreadthFirstChildOfClass: LePharoSnippetElement ].
			aStep wait
				forEmptySpaceTaskQueue;
				play ].

	snippets := (aScripter elementWithoutParent query // LePharoSnippetElement) all.
	snippets first addChild: (self yellowExplanationTargetCircleFor: #firstSnippet).
	snippets second
		addChild: (self yellowExplanationTargetCircleFor: #secondSnippet).	"((snippets first query // LePharoSnippetElement) all first query // GtSourceCoderDoItAndGoActionId) anyOne
		addChild: (self yellowExplanationTargetCircleFor: #inspectButton)."
	^ container addChild: playgroundElement
]

{ #category : #accessing }
GtPharo101 >> shortPlaygroundExplanationText [
	| text |
	
	text := 'This slideshow relies on playground like this in which you can play around with the code, having one or more snippets that you can inspect. You do that with the ' asRopedText,
('inspect' asRopedText glamorousExplanationFor: #inspectButton),
' button. Pressing it, opens up an inspector on the result which is produced by the last line executed in that snippet. In our case, it will be the sum for the ' asRopedText,
('first' asRopedText glamorousExplanationFor: #firstSnippet),
' snippet and the difference for the ' asRopedText,
('second' asRopedText glamorousExplanationFor: #secondSnippet),
' one.' asRopedText.
	
	^ text 
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtPharo101 >> stringsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: (self subtitleString: 'Strings');
		newTextWithFormat: (self descriptionString: 'A string is a collection of characters and it is defined between two single quotes. Each character in a string can be accessed using the #at: message and by using the comma operator, two strings can be concatenated.');
		element: [GtPlaygroundLiveSlide new 
			snippets: {'''This is a string''.'. '''This is a string'' size.'.
						 '''abc'' asUppercase.'. '''Hello world'' reverse.'. '''Hello world'' at: 7.'.
						 '''Hello'','' world''.'};
			asElement ];
		elementWeight: 0.6.
]

{ #category : #'as yet unclassified' }
GtPharo101 >> subtitleString: aString [
	^ aString asRopedText glamorousRegularFont; fontSize: 40.
]

{ #category : #accessing }
GtPharo101 >> symbolsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: (self subtitleString: 'Symbols');
		newTextWithFormat: (self descriptionString: 'A symbol is a string guaranteed to be globally unique, meaning that there is only one #MySymbol symbol, but there are multiple ''MySymbol'' string objects.');
		element: [GtPlaygroundLiveSlide new
			snippets: {'"Turns the String into a Symbol"
''MySymbol'' asSymbol.'. 
							'"Turns the Symbol into a String"
#MySymbol asString.'.
							'"Message == return true is the two objects are the SAME"
(2 asString) == (2 asString).'. 
							'(2 asString) asSymbol == (2 asString) asSymbol.'};
			asElement ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPharo101 >> syntaxExplanationWithLinksSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 39;
		element: [
			((GtPharoMethodExample>>#exampleWithNumber:) 
				gtViewNodesExplanationWithLinksFor: GtPhlowEmptyView new) 
					asElementDo: [:e | e ]];
		newFadedText: ('Let''s put it all together. Take a look at the method below. Hover over the syntactical parts on the left to understand how they map on the different parts of the method.' asRopedText fontSize: 70)
]

{ #category : #accessing }
GtPharo101 >> title: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Pharo 101' asRopedText 
			glamorousRegularFont;
			bold;
			fontSize: 50);
		subtitleWithFormat: ('language' asRopedText 
			fontSize: 40;
			thin;
			glamorousRegularFont)
]

{ #category : #accessing }
GtPharo101 >> unaryMessagesExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 15;
		newTextWithFormat: (self subtitleString: 'Unary messages');
		newTextWithFormat: (self descriptionString: 'They have the following form: anObject aMessage.');
		element: [ GtPlaygroundLiveSlide new
			snippets: { '42 class.'. 'false not.'. 'Date today.'. 'Float pi.' };
			asElement ];
		elementWeight: 0.6.
]

{ #category : #utility }
GtPharo101 >> yellowExplanationTargetCircleFor: aModel [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: aModel).
]
