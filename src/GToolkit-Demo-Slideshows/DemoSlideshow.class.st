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
DemoSlideshow >> dynamicLepiterPage: aSlide [
	<gtSlide>
	self initDynamicLepiterPage.
	^ aSlide lepiterPage
		priority: (self priorityFor: #dynamicLepiterPage:);
		pageNamed: 'Dynamic Lepiter Page' from: self myLepiterDB
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

{ #category : #accessing }
DemoSlideshow >> initDynamicLepiterPage [
	<gtExample>
	<noTest>
	| pageName page |
	pageName := 'Dynamic Lepiter Page'.
	page := self ensureEmptyPageNamed: pageName.
	^ page
		addSnippet: (LeTextSnippet new
				string: 'This page is dynamically created.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: '''hello''';
				yourself);
		yourself
]

{ #category : #slides }
DemoSlideshow >> lepiterPage: aSlide [
	<gtSlide>
	
	^ (aSlide lepiterPage)
		priority: (self priorityFor: #lepiterPage:);
		pageNamed: 'Lepiter' from: self gtBook;
		yourself
]

{ #category : #accessing }
DemoSlideshow >> myLepiterDB [
	"Default Lepiter DB to use"
	^ 'Documents/lepiter/default'
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
		lepiterPage:
		dynamicLepiterPage:
		headingAndCode:
	)
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
