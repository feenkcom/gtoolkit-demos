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

{ #category : #page }
DemoSlideshow >> anotherLePage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Another dynamic page')
		addSnippet: (LeTextSnippet new
				string: 'This page is linked to from [[A dynamic Lepiter page]].';
				yourself);
		yourself
]

{ #category : #slides }
DemoSlideshow >> coder: aSlide [
	<gtSlide>
	<text: 'A live Coder tool'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Feel free to explore.' asRopedText;
		element: [ GtCoderElement new createInPager maximized ]
]

{ #category : #slides }
DemoSlideshow >> coderOnClass: aSlide [
	<gtSlide>

<text: 'A coder on a class'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'The LudoGame class';
		element: [ (GtCoderElement forClass: GtLudoGame) createInPager maximized ]
]

{ #category : #accessing }
DemoSlideshow >> demoDatabase [
	"A transient database with links."

	<gtExample>
	^ self db
]

{ #category : #page }
DemoSlideshow >> dynamicLePage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'A dynamic Lepiter page')
		addSnippet: (LeTextSnippet new
				string: 'This page is dynamically created and stored in a transient Lepiter database.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'A link to [[Another dynamic page]].';
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
		setPriority;
		startPage: (self db pageNamed: 'A dynamic Lepiter page')
]

{ #category : #slides }
DemoSlideshow >> fileLocatorInPager: aSlide [
	<gtSlide>
	<text: 'A File Locator in a Pager'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A File Locator in a Pager';
		element: [ (GtPager createWrappedOn: (GtInspector newOn: FileLocator gtResource))
				maximized ]
]

{ #category : #slides }
DemoSlideshow >> gtWorld: aSlide [
	<gtSlide>
	<text: 'A live embedded GT world'>
	^ aSlide world setPriority
]

{ #category : #slides }
DemoSlideshow >> gtWorldWithTitle: aSlide [
	<gtSlide>
	<text: 'A live Coder tool'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Glamorous Toolkit' asRopedText;
		element: [ GtWorldElement new
				knowledgeBase: LeDatabasesRegistry uniqueInstance currentLoadedDefaultLogicalDatabase ]
]

{ #category : #slides }
DemoSlideshow >> headingAndCode: aSlide [
	<gtSlide>
	<text: 'Slide with a heading and code snippets to evaluate'>
	^ aSlide headingAndCode
		setPriority;
		heading: 'Heading';
		addTextSnippet: 'Text snippet';
		addCodeSnippet: '"Code to evaluate."
3+4.'
]

{ #category : #slides }
DemoSlideshow >> inspectorInPager: aSlide [
	<gtSlide>
	<text: 'An Inspector on an object.
NB: the pager is needed so we can navigate to new pages.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'An Inspector on an object';
		element: [ (GtPager
				createWrappedOn: (GtInspector forObject: GtLudoRecordingGameExamples new gameShowingAllMoves2))
				maximized ]
]

{ #category : #slides }
DemoSlideshow >> inspectorOnObject: aSlide [
	<gtSlide>
	<text: 'Text with an Inspector'>
	"NB: This will work for any object."
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'An inspector on the image directory';
		element: [ GtInspector newOn: FileLocator imageDirectory ]
]

{ #category : #slides }
DemoSlideshow >> inspectorView: aSlide [
	<gtSlide>
	<text: 'Text with a specific Inspector view'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A specific Inspector view of the LudoGame';
		element: [ GtLudoGame new gtPlayersFor: GtPhlowProtoView new ]
]

{ #category : #slides }
DemoSlideshow >> inspectorViewInPager: aSlide [
	<gtSlide>
	<text: 'An Inspector view in a Pager'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'An Inspector view in a Pager';
		element: [ (GtPager
				createWrappedOn: (GtLudoGame new gtPlayersFor: GtPhlowProtoView new))
				maximized ]
]

{ #category : #slides }
DemoSlideshow >> lepiterPage: aSlide [
	<gtSlide>
	<text: 'A lepiter page from the GT Book'>
	^ aSlide lepiterPage
		setPriority;
		pageNamed: 'Lepiter' from: 'Glamorous Toolkit Book';
		yourself
]

{ #category : #slides }
DemoSlideshow >> maximizedGtBookPage: aSlide [
	<gtSlide>
	<text: 'A maximized GT book page.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A maximized GT book page.';
		element: [ (GtPager
				createWrappedOn: (LePagePhlowTool
						page: (self gtBook pageNamed: 'Working with a REST API: the GitHub case study')))
				maximized ]
]

{ #category : #slides }
DemoSlideshow >> maximizedPage: aSlide [
	<gtSlide>
	<text: 'A maximized lepiter page that can still be browsed.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A maximized lepiter page.';
		element: [ (GtPager
				createWrappedOn: (LePagePhlowTool page: (self db pageNamed: 'A dynamic Lepiter page')))
				maximized ]
]

{ #category : #slides }
DemoSlideshow >> multiLineText: aSlide [
	<gtSlide>
	<text: 'Multiple lines with different formatting'>
	^ aSlide text
		setPriority;
		textMargin: 5;
		newTextWithFormat: (self asSubtitle: 'Outline');
		newText: 'default sized text1';
		newText: 'default sized text2';
		newTextWithFormat: (self
				asText: 'Paragraph body.
Possibly over multiple lines.
')
]

{ #category : #slides }
DemoSlideshow >> paragraph: aSlide [
	<gtSlide>
	<text: 'Text with a paragraph'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Outline');
		paragraphWithFormat: (self
				asText: 'Paragraph body.
Possibly over multiple lines.
')
]

{ #category : #slides }
DemoSlideshow >> scenery: aSlide [
	<gtSlide>
	<text: 'Scenery'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A scenery';
		element: [ GtSceneryExamples new sceneryWithOneInspectorAndOneRectangleAndOneConnection ]
]

{ #category : #accessing }
DemoSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		title:
		titleWithFooter:
		#titleWithCenteredTexts:
		textAndElement:
		textAndImage:
		paragraph:
		multiLineText:
		headingAndCode:
		lepiterPage:
		dynamicLepiterPage:
		maximizedPage:
		maximizedGtBookPage:
		inspectorOnObject:
		inspectorInPager:
		inspectorView:
		inspectorViewInPager:
		fileLocatorInPager:
		scenery:
		gtWorld:
		gtWorldWithTitle:
		coder:
		coderOnClass:
		spotterExampleSlide:
		#summarySlide:
	)
]

{ #category : #slides }
DemoSlideshow >> spotterExampleSlide: aSlide [
	<gtSlide>
	<text: 'A spotter search'>
	^ aSlide spotter setPriority
]

{ #category : #slides }
DemoSlideshow >> summarySlide: aSlide [
	<gtSlide>
	<text: 'A summary slide'>
	| slideSelectors |
	"slideSelectors := #(textAndElement: lepiterPage: inspectorOnObject: gtWorld:)."
	slideSelectors := #(textAndElement: textAndImage: inspectorOnObject: gtWorld:).
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A summary slide';
		element: [ self summaryElementFor: slideSelectors ]
]

{ #category : #slides }
DemoSlideshow >> textAndElement: aSlide [
	<gtSlide>
	<text: 'Text with an element'>
	^ aSlide textAndElement
		elementWeight: 0.5;
		setPriority;
		newTextWithFormat: (self asHeader: 'Header') bold , self cr , (self asText: 'description');
		element: [ GtLudoGame new asElement asScalableElement ]
]

{ #category : #slides }
DemoSlideshow >> textAndImage: aSlide [
	<gtSlide>
	<text: 'Text with an image'>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asText: 'This will also work with with any XandElement slide');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'smalltalk-80.png') ]
]

{ #category : #slides }
DemoSlideshow >> title: aSlide [ 
	<gtSlide>
	<text: 'A title or header slide'>
	^ (aSlide title)
		"priority: (self priorityFor: #titleSlideFor:);"
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'Title');
		subtitleWithFormat: (self asBigText: 'subtitle')
]

{ #category : #slides }
DemoSlideshow >> titleWithCenteredTexts: aSlide [
	<gtSlide>
	<text: 'A title slide with multiple, centered texts.'>
	^ (aSlide titleWithCenteredTexts)
		setPriority;
		titleWithFormat: (self asTitle: 'Title');
		subtitleWithFormat: (self asSubtitle: 'subtitle');
		newTextWithFormat: (self asBigText: 'someone@feenk.com') underline;
		newTextWithFormat: (self asBigText: 'someone.else@feenk.com')
]

{ #category : #slides }
DemoSlideshow >> titleWithFooter: aSlide [
	<gtSlide>
	<text: 'A title slide with a footer'>
	^ (aSlide titleWithFooter)
		setPriority;
		titleBottomPadding: 30;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Title');
		subtitleWithFormat: (self asBigText: 'subtitle');
		footerWithFormat: (self asBigText: 'someone@feenk.com')
]
