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
	<text: 'A live Coder tool'>
	^ aSlide labelAndElement
		priority: (self priorityFor: #coderExampleSlideFor:);
		newFadedText: ('Feel free to explore.' asRopedText);
		element: [GtCoderElement new createInPager maximized].
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
	<text: 'A dynamic page from the internal database.'>
	^ aSlide lepiterPage
		priority: (self priorityFor: #dynamicLepiterPage:);
		startPage:  (self db pageNamed: 'A dynamic Lepiter page')
]

{ #category : #slides }
DemoSlideshow >> gtWorld: aSlide [
	<gtSlide>
	<text: 'A live embedded GT world'>
	^ aSlide world priority: (self priorityFor: #gtWorld:)
]

{ #category : #slides }
DemoSlideshow >> headingAndCode: aSlide [
	<gtSlide>
	<text: 'Slide with a heading and code snippets to evaluate'>
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
DemoSlideshow >> inspectorInPager: aSlide [
	<gtSlide>
	<text: 'An Inspector on an object.
NB: the pager is needed so we can navigate to new pages.'>
	^ aSlide element
		priority: (self priorityFor: #inspector:);
		element: [ (GtPager
				createWrappedOn: (GtInspector forObject: GtLudoRecordingGameExamples new gameShowingAllMoves2))
				maximized ]
]

{ #category : #slides }
DemoSlideshow >> lepiterPage: aSlide [
	<gtSlide>
	<text: 'A lepiter page from the GT Book'>
	^ aSlide lepiterPage
		priority: (self priorityFor: #lepiterPage:);
		pageNamed: 'Lepiter' from: 'Glamorous Toolkit Book';
		yourself
]

{ #category : #slides }
DemoSlideshow >> maximizedPage: aSlide [
	<gtSlide>
	<text: 'A maximed lepiter page that can still be browsed.'>
	^ aSlide element
		priority: (self priorityFor: #maximizedPage:);
		element: [ (GtPager
				createWrappedOn: (LePagePhlowTool page: (self db pageNamed: 'A dynamic Lepiter page')))
				maximized ]
]

{ #category : #slides }
DemoSlideshow >> paragraph: aSlide [
	<gtSlide>
	<text: 'Text with a paragraph'>
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
		maximizedPage:
		gtWorld:
		coderExampleSlideFor:
		inspectorInPager:
		spotterExampleSlideFor:
	)
]

{ #category : #slides }
DemoSlideshow >> spotterExampleSlideFor: aSlide [
	<gtSlide>
	<text: 'A spotter search'>
	^ aSlide spotter priority: (self priorityFor: #spotterExampleSlideFor:)
]

{ #category : #slides }
DemoSlideshow >> textAndElement: aSlide [
	<gtSlide>
	<text: 'Text with an element'>
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
	<text: 'A title slide'>
	^ (aSlide title)
		priority: (self priorityFor: #titleSlideFor:);
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'Title');
		subtitleWithFormat: (self asBigText: 'subtitle')
]
