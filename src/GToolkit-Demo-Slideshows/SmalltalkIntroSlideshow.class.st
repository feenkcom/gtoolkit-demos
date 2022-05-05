"
Slideshow for the P2 Smalltalk lecture planned for 2022-05-20.

```
SmalltalkIntroSlideshow show
```

"
Class {
	#name : #SmalltalkIntroSlideshow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Slideshows'
}

{ #category : #accessing }
SmalltalkIntroSlideshow class >> show [
	GtLiveShow openInSpace: SmalltalkIntroSlideshow
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> addTargetCircleFor: aTarget named: aSymbol [

	aTarget addChild:
		((self yellowExplanationTargetCircleFor: aSymbol) relocate:
			 2 @ aTarget extent y / 2 )
]

{ #category : #slides }
SmalltalkIntroSlideshow >> bouncingAtoms: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #bouncingAtoms:);
		pageNamed: 'Changing a running system on the fly' from: self gtBook;
		yourself
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> dbName [
	self deprecated: 'Don''t use this database anymore'.
	^ 'feenkcom/gtoolkit-demos/lepiter'
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingHappensBySendingMessages:);
		  pageNamed: 'Everything happens by sending messages' from: self gtBook
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingIsAnObject: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #everythingIsAnObject:);
		  pageNamed: 'Everything is an object' from: self gtBook
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> findTargetWithText: aText in: expandedMethodElement [
	^ expandedMethodElement
		  allChildrenBreadthFirstDetect: [ :aChild | 
			  (aChild isKindOf: BrTextElementWithCursors) and: [ 
				  aChild text asString = aText asString ] ]
		  ifFound: [ :aChild | aChild ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> gtBook [
	^ 'Glamorous Toolkit Book'
]

{ #category : #slides }
SmalltalkIntroSlideshow >> gtWorld: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.6;
		  priority: (self priorityFor: #gtWorld:);
		  newTextWithFormat: ('Glamorous Toolkit is a “moldable” development environment with native windows, software analysis tools, and a visualization engine. 
Gt is built on top of Pharo, a modern, open-source Smalltalk.' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ aSlide world ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> imageChanges: aSlide [

	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.50;
		  priority: (self priorityFor: #imageChanges:);
		  newTextWithFormat: ('Smalltalk is a live programming system.
Objects live inside an image running on a VM. 
Changes to classes and methods are logged as you program.' asRopedText
				   glamorousRegularFont;
				   fontSize: 40);
		  element: [ 
			  GtFilePictureLiveSlide new fileReference:
				  (GtResourcesUtility resourceAtPath:
					   self picturesDirectoryPath  / 'image+changes.png') ]
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> methodSyntax: aSlide [

	"Methods start with a declaration of the message selector and arguments. Temporaries must be declared. Statements are separate by periods. The caret (^) is special syntax for returning a result."

	<gtSlide>
	^ aSlide textAndElement
		  priority: (self priorityFor: #methodSyntax:);
		  newTextWithFormat: ('Method syntax
' asRopedText bold;
				   glamorousRegularFont;
				   fontSize: 40) , ('Note the special syntax for variable declarations (|...|), statement separators (period) and returns (^).' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ 
			  GtPharoSyntaxExplainer new forMethod:
				  BlElementVectorGeometry >> #containsPoint:in:on: ];
		  elementWeight: 0.6
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> outline: aSlide [

	<gtSlide>
	^ aSlide paragraph
		  priority: (self priorityFor: #outline:);
		  subtitleWithFormat: ('Outline' asRopedText
				   bold;
				   fontSize: 40;
				   glamorousRegularFont);
		  paragraph: '
• Background — What is Smalltalk?
• Basics — syntax, sending messages
• Scripting in the Playground
• Live programming of classes and methods
• GT use cases
'
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> picturesDirectoryPath [
	^ Path * 'feenkcom' / 'gtoolkit-demos' / 'data' / 'images'
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> priorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		outline:
		smalltalk80:
		gtWorld:
		imageChanges:
		twoRules:
		everythingIsAnObject:
		everythingHappensBySendingMessages:
		syntax:
		threeKindsOfMessages:
		methodSyntax:
		bouncingAtoms:
		programmingClassesAndMethods:
		)
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> priorityFor: aSlideMethodSelector [
	^ self priorities indexOf: aSlideMethodSelector
]

{ #category : #slides }
SmalltalkIntroSlideshow >> programmingClassesAndMethods: aSlide [
	<gtSlide>
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #programmingClassesAndMethods:);
		pageNamed: 'Programming Classes and Methods' from: self gtBook
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> smalltalk80: aSlide [

	"In the late 60s, Alan Kay predicted that in the foreseeable future handheld multimedia computers would become affordable. He called this a “Dynabook”. (The photo shows a mockup, not a real computer.)
He reasoned that such systems would need to be based on object from the ground up, so he set up a lab at the Xerox Palo Alto Research Center (PARC) to develop such a fully object-oriented system, including both software and hardware. They developed the first graphical workstations with windowing system and mouse."

	<gtSlide>
	^ aSlide textAndElement
		  elementWeight: 0.60;
		  priority: (self priorityFor: #smalltalk80:);
		  newTextWithFormat: ('Smalltalk was the first purely object-oriented language and environment, with the first interactive, graphical IDE.' asRopedText
				   glamorousRegularFont;
				   fontSize: 30);
		  element: [ 
			  GtFilePictureLiveSlide new fileReference:
				  (GtResourcesUtility resourceAtPath: self picturesDirectoryPath / 
					   'smalltalk-80.png') ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntax: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #syntax:);
		  pageNamed: 'Smalltalk Syntax (the funny bits)' from: self gtBook
]

{ #category : #slides }
SmalltalkIntroSlideshow >> threeKindsOfMessages: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #threeKindsOfMessages:);
		  pageNamed: 'Three kinds of messages' from: self gtBook
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		  priority: (self priorityFor: #titleSlideFor:);
		  titleBottomPadding: 30;
		  titleWithFormat: ('A bit of Smalltalk' asRopedText
				   fontSize: 70;
				   bold;
				   glamorousRegularFont);
		  subtitleWithFormat: ('@onierstrasz' asRopedText
				   fontSize: 40;
				   glamorousRegularFont)
]

{ #category : #slides }
SmalltalkIntroSlideshow >> twoRules: aSlide [

	<gtSlide>
	^ aSlide paragraph
		  priority: (self priorityFor: #twoRules:);
		  subtitleWithFormat: ('Two rules' asRopedText
				   bold;
				   fontSize: 40;
				   glamorousRegularFont);
		  paragraph: '

1. Everything is an object

2. Everything happens by sending messages
'
]

{ #category : #slides }
SmalltalkIntroSlideshow >> worldExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide world
		  priority: (self priorityFor: #worldExampleSlideFor:)
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> yellowExplanationTargetCircleFor: aModel [
	"Copied from GtCoderSlideshow"
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: aModel).
]
