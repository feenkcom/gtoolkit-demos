"
Demos of slides to create in a PrioritySlideshow.
"
Class {
	#name : #DemoSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #utility }
DemoSlideshow class >> show [
	"Implement this here just so we can run it directly from the Coder."
	super show
]

{ #category : #slides }
DemoSlideshow >> coderExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: (self priorityFor: #coderExampleSlideFor:);
		newFadedText: ('Feel free to explore.' asRopedText);
		element: [GtCoder new createInPager maximized].
]

{ #category : #page }
DemoSlideshow >> dynamicLePage [
	<gtExample>
	<noTest>
	^ (LePage named: 'A dynamic Lepiter page')
		addSnippet: (LeTextSnippet new
				string: 'This page is dynamically created and stored in a transient Lepiter database.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: '''hello''';
				yourself);
		yourself
]

{ #category : #slides }
DemoSlideshow >> dynamicLepiterPage: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		priority: (self priorityFor: #dynamicLepiterPage:);
		startPage:  (self db pageNamed: 'A dynamic Lepiter page')
]

{ #category : #slides }
DemoSlideshow >> gtWorld: aSlide [
	<gtSlide>
	^ aSlide world priority: (self priorityFor: #gtWorld:)
]

{ #category : #slides }
DemoSlideshow >> headingAndCode: aSlide [
	<gtSlide>
	^ aSlide headingAndCode
		priority: (self priorityFor: #headingAndCode:);
		heading: 'Heading';
		
		addTextSnippet: 'Text snippet';
		
		addCodeSnippet: '"Code to evaluate."
3+4.'
]

{ #category : #initialization }
DemoSlideshow >> initializeDb [
	self db addPage: self dynamicLePage
]

{ #category : #slides }
DemoSlideshow >> inspector: aSlide [
	<gtSlide>
	^ aSlide element
		priority: (self priorityFor: #inspector:);
		element: [ GtInspector forObject: GtABCartoonAddressBookExample new bugsBunnyContact ]
]

{ #category : #slides }
DemoSlideshow >> lepiterPage: aSlide [
	<gtSlide>
	^ aSlide lepiterPage
		priority: (self priorityFor: #lepiterPage:);
		pageNamed: 'Lepiter' from: 'Glamorous Toolkit Book';
		yourself
]

{ #category : #slides }
DemoSlideshow >> paragraph: aSlide [
	<gtSlide>
	
	^ (aSlide paragraph)
		priority: (self priorityFor: #paragraph:);
		subtitleWithFormat: (self asSubtitle: 'Outline');
		paragraphWithFormat:
				(self
						asText:
							'Paragraph body.
Possibly over multiple lines.
')
]

{ #category : #accessing }
DemoSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		textAndElement:
		paragraph:
		headingAndCode:
		lepiterPage:
		dynamicLepiterPage:
		gtWorld:
		coderExampleSlideFor:
		inspector:
		spotterExampleSlideFor:
	)
]

{ #category : #slides }
DemoSlideshow >> spotterExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide spotter priority: (self priorityFor: #spotterExampleSlideFor:)
]

{ #category : #slides }
DemoSlideshow >> textAndElement: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		elementWeight: 0.5;
		priority: (self priorityFor: #textAndElement:);
		newTextWithFormat: 
			(self asHeader: 'Header') bold , 
			self cr , 
			(self asText: 'description');
		element: [ GtLudoGame new asElement asScalableElement ]
]

{ #category : #slides }
DemoSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	
	^ (aSlide title)
		priority: (self priorityFor: #titleSlideFor:);
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'Title');
		subtitleWithFormat: (self asBigText: 'subtitle')
]
