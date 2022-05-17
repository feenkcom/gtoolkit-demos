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

	"GtLiveShow openInSpace: SmalltalkIntroSlideshow"

	| slideshow |
	slideshow := GtNewSlideShow create: SmalltalkIntroSlideshow new.
	BlSpace new
		addChild: (GtNewSlideShowElement new slideShow: slideshow);
		show
]

{ #category : #slides }
SmalltalkIntroSlideshow >> addingAutoPlay: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #addingAutoPlay:);
		pageNamed: 'Changing a running system' from: self gtBook;
		yourself
]

{ #category : #text }
SmalltalkIntroSlideshow >> asBigText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: 40
]

{ #category : #text }
SmalltalkIntroSlideshow >> asHeader: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 40
]

{ #category : #text }
SmalltalkIntroSlideshow >> asSubtitle: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 60
]

{ #category : #text }
SmalltalkIntroSlideshow >> asText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: 30
]

{ #category : #text }
SmalltalkIntroSlideshow >> asTitle: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 70
]

{ #category : #slides }
SmalltalkIntroSlideshow >> bouncingAtoms: aSlide [
	"<gtSlide>"
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #bouncingAtoms:);
		pageNamed: 'Changing a running system on the fly' from: self gtBook;
		yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> composingExamples: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #composingExamples:);
		pageNamed: 'Composing (Test) Examples' from: self gtBook;
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

{ #category : #slides }
SmalltalkIntroSlideshow >> exploringLudo: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #exploringLudo:);
		pageNamed: 'Exploring a live system' from: self gtBook;
		yourself
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
	
	^ (aSlide textAndElement)
		elementWeight: 0.6;
		priority: (self priorityFor: #gtWorld:);
		newTextWithFormat:
				(self asText: 'Glamorous Toolkit is a ') , (self asText: 'moldable') italic
						,
							(self
								asText:
									' development environment with native windows, software analysis tools, and a visualization engine. 
Gt is built on top of Pharo, a modern, open-source Smalltalk.');
		element: [ aSlide world ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> imageChanges: aSlide [
	<gtSlide>
	
	^ (aSlide textAndElement)
		elementWeight: 0.50;
		priority: (self priorityFor: #imageChanges:);
		newTextWithFormat:
				(self asText: 'Smalltalk is a ') , (self asText: 'live') italic
						,
							(self
								asText:
									' programming system.
Objects live inside an image running on a VM. 
Changes to classes and methods are logged as you program.');
		element:
				[ GtFilePictureLiveSlide new
						fileReference: (GtResourcesUtility resourceAtPath: self picturesDirectoryPath / 'image+changes.png') ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> liveDocumentationLogic: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #liveDocumentationLogic:);
		pageNamed: 'Live documentation of the game logic' from: self gtBook;
		yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> liveDocumentationUML: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #liveDocumentationUML:);
		pageNamed: 'Live documentation of the technical solution' from: self gtBook;
		yourself
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> ludoAppetizer: aSlide [
	<gtSlide>
	
	^ (aSlide textAndElement)
		elementWeight: 0.5;
		priority: (self priorityFor: #ludoAppetizer:);
		newTextWithFormat: (self asHeader: 'Appetizer') bold,(self asText: '
Ludo as a running example of a live system');
		element: [ GtLudoGame new asElement asScalableElement ]
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> methodSyntax: aSlide [
	"Methods start with a declaration of the message selector and arguments. Temporaries must be declared. Statements are separate by periods. The caret (^) is special syntax for returning a result."

	<gtSlide>
	
	^ (aSlide textAndElement)
		priority: (self priorityFor: #methodSyntax:);
		newTextWithFormat:
				(self
						asHeader:
							'Method syntax
')
						,
							(self asText: 'Note the special syntax for variable declarations (|...|), statement separators (period) and returns (^).');
		element: [ GtPharoSyntaxExplainer new forMethod: GtLudoGame>>#computeTargetFor: ];
		elementWeight: 0.6
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> outline: aSlide [
	<gtSlide>
	
	^ (aSlide paragraph)
		priority: (self priorityFor: #outline:);
		subtitleWithFormat: (self asSubtitle: 'Outline');
		paragraphWithFormat:
				(self
						asText:
							'
• What is Smalltalk?
• Smalltalk basics — syntax, sending messages
• Live programming with interactive views
• Testing with composable examples
• Live documentation with Lepiter notebooks
• Take home messages
')
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> pages [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		ludoAppetizer:
		outline:
		smalltalk80:
		gtWorld:
		imageChanges:
		twoRules:
		everythingIsAnObject:
		everythingHappensBySendingMessages:
		threeKindsOfMessages:
		syntax:
		methodSyntax:
		exploringLudo:
		addingAutoPlay:
		composingExamples:
		recordingMoves:
		liveDocumentationLogic:
		liveDocumentationUML:
		takeHome:
		whatsNext:
		)
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> picturesDirectoryPath [
	^ Path * 'feenkcom' / 'gtoolkit-demos' / 'data' / 'images'
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> priorityFor: aSlideMethodSelector [
	^ self pages indexOf: aSlideMethodSelector
]

{ #category : #slides }
SmalltalkIntroSlideshow >> programmingClassesAndMethods: aSlide [
	"<gtSlide>"
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #programmingClassesAndMethods:);
		pageNamed: 'Programming Classes and Methods' from: self gtBook
]

{ #category : #slides }
SmalltalkIntroSlideshow >> recordingMoves: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #recordingMoves:);
		pageNamed: 'Recording and visualizing token moves' from: self gtBook;
		yourself
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> smalltalk80: aSlide [
	"In the late 60s, Alan Kay predicted that in the foreseeable future handheld multimedia computers would become affordable. He called this a “Dynabook”. (The photo shows a mockup, not a real computer.)
He reasoned that such systems would need to be based on object from the ground up, so he set up a lab at the Xerox Palo Alto Research Center (PARC) to develop such a fully object-oriented system, including both software and hardware. They developed the first graphical workstations with windowing system and mouse."

	<gtSlide>
	
	^ (aSlide textAndElement)
		elementWeight: 0.60;
		priority: (self priorityFor: #smalltalk80:);
		newTextWithFormat:
				(self
						asText:
							'Smalltalk was the first purely object-oriented language and environment, with the first interactive, graphical IDE.');
		element:
				[ GtFilePictureLiveSlide new
						fileReference: (GtResourcesUtility resourceAtPath: self picturesDirectoryPath / 'smalltalk-80.png') ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntax: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		  priority: (self priorityFor: #syntax:);
		  pageNamed: 'Smalltalk Syntax (the funny bits)' from: self gtBook
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> takeHome: aSlide [

	<gtSlide>
	
	^ (aSlide paragraph)
		priority: (self priorityFor: #takeHome:);
		subtitleWithFormat: (self asSubtitle: 'Take home messages');
		paragraphWithFormat:
				(self
						asText:
							'

• Smalltalk enables '), (self asText: 'live programming') italic, (self asText: '

• Example methods enable '), (self asText: 'composable tests') italic, (self asText: ' and live interaction with test results

• '), (self asText: 'Moldable development') italic, (self asText: ' brings together coding and exploration of live systems 
')
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
	
	^ (aSlide title)
		priority: (self priorityFor: #titleSlideFor:);
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'A bit of Smalltalk');
		subtitleWithFormat: (self asBigText: '@onierstrasz')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> twoRules: aSlide [
	<gtSlide>
	
	^ (aSlide paragraph)
		priority: (self priorityFor: #twoRules:);
		subtitleWithFormat: (self asSubtitle: 'Two rules');
		paragraphWithFormat:
				(self
						asBigText:
							'

1. Everything is an object

2. Everything happens by sending messages
')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> whatsNext: aSlide [
	<gtSlide>
	
	^ (aSlide paragraph)
		priority: (self priorityFor: #whatsNext:);
		subtitleWithFormat: (self asSubtitle: 'What''s next?');
		paragraphWithFormat:
				(self
						asText:
							'

• Download GT from gtoolkit.com

• Explore the Glamorous Toolkit Book

• Learn about Pharo — go to books.pharo.org

• Have fun!
')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> worldExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide world
		  priority: (self priorityFor: #worldExampleSlideFor:)
]
