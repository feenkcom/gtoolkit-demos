Class {
	#name : #GtTour,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'api - instantiation' }
GtTour >> create [
	| show |
	show := GtSlideShow new.
	show
		slides:
			{(GtFilePictureSlide new
				fileReference:
					(GtResourceReference
						path: Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'gtoolkit.png')).
			(GtTextSlide new
				newText: 'Glamorous Toolkit is the moldable development environment.';
				newText: 'It is a live notebook. It is a flexible search interface. It is a fancy code editor. It is a software analysis platform. It is a data visualization engine. All in one. It is built in Pharo and it is free and open-source under an MIT license.';
				newText: 'What is moldable development? A new paradigm that promotes the idea that developers should explain their systems through the lens of custom tools that they create while developing the system.';
				newText: 'But, let''s take it step by step.').
			(GtLabelAndElementSlide new
				element: [ GtRawViewsSlide new asElement ];
				newFadedText: 'Consider how these different objects look quite similar in the inspector.').
			(GtLabelAndElementSlide new
				element: [ GtCustomViewsSlide new asElement ];
				newFadedText: 'Yet, when we change the view, the differences are obvious.').
			(GtLabelAndElementSlide new
				element: [ GtAllViewsSlide new asElement ];
				newFadedText: 'Every object is different, and the environment should show it, too.').
			(GtLabelAndElementSlide new
				element: [ GtMultipleViewsForOneObjectSlide new asElement ];
				newFadedText: 'Every object can be seen in multiple ways and the environment must accommodate all of them.';
				newFadedText: 'Take a look below at a few views on an object holding a piece of text.').

			"		GtTitleSlide new
			titleText: ('components' asRopedText fontSize: 50; glamorousRegularFont).
		GtTextAndElementSlide new 
			element: [ GtAllViewsSlide new asElement ];
			textWithFormat: ('Glamorous Toolkit is made of multiple programmable components' asRopedText glamorousRegularFont; foreground: Color gray).
		GtComponentsSlide new.
"
			(GtTitleSlide new
				titleText:
					('live programming and inspection' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element: [ GtExplainerExamples new inspectorOnOneObjectExample ]).
			(GtElementSlide new
				element: [ self viewsExplanationWithLinks ]).
		
			(GtTitleSlide new
				titleText:
					('moldable coding' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element: [ GtInspector withToolOn: (GtClassCoder forClass: GtClassCoder) ]).
			(GtTitleSlide new
				titleText:
					('querying' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				element: [ (GtPlaygroundSlide new snippets: {'#gtView gtPragmas'}) create ];
				newTextWithFormat:
					('Inspect the result of this query. Expand the methods' asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtLabelAndElementSlide new
				element: [ (GtPlaygroundSlide new
					snippets: {'#gtView gtPragmas & #list gtReferences'})
					create ];
				newTextWithFormat:
					('Now, try with this composed query. Notice the highlighting'
						asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTitleSlide new
				titleText:
					('moldable search' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				element: [ GtSpotterSlide new asElement ];
				newTextWithFormat:
					('Search is pervasive. Try searching for Object' asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtLabelAndElementSlide new
				element: [ GtSpotterSlide new asElement ];
				newTextWithFormat:
					(('Or search for .' , FileSystem disk delimiter asString) asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTitleSlide new
				titleText:
					('live documents' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element:
					[ GtInspector withToolOn: (GtDocument forClass: BaselineOfGToolkit) ]).
"			(GtTitleSlide new
				titleText:
					('tracing variables' asRopedText
						fontSize: 50;
						fontName: 'Helvetica Neue';
						bold;
						yourself)).
			GtDebuggerOnRopeSlide new."
			(GtTextSlide new
				newText: 'Glamorous Toolkit is a platform. While it is implemented in Pharo, it can already tackle multiple other languages.').
			(GtLabelAndElementSlide new
				element: [ GtInspector withToolOn: (GtClassCoder forClass: JSParser) ];
				newFadedText: 'The first non-Pharo language we accommodated is the language with which we write parsers.';
				newFadedText: 'Here you see a concrete instance of the language used for defining the parser for JavaScript.').
			(GtLabelAndElementSlide new
				element: [ self treemapWithViewsAndExamples ];
				newFadedText: 'The need for moldability is pervasive.';
				newFadedText: 'The visualization below shows a treemap of the classes and packages from the current image.';
				newFadedText: 'Blue denotes classes that contain at least one custom view; green shows those that have an example.')
		}.
	^ show
]

{ #category : #'api - instantiation' }
GtTour >> treemapWithViewsAndExamples [
	<gtExample>
	| tree |
	tree := GtNestedTreeBuilder new
			data: (Smalltalk allClassesAndTraits select: [:c | 
			{'Gt'.'Bl'.'Br'} anySatisfy: [:p |c name beginsWith: p]]);
		groupBy: [ :aClass | aClass package ];
		groupBy: [ :aClass | aClass package classTags detect: [ :e | e hasClass: aClass ] ];
		weight: [ :aClass | aClass methods size max: 1];
		build.
	^ GtNestedRectangleTreeMap new
		roots: { tree };
		leaves: [ :aNode | aNode leaves ];
		deep: [ :aNode | aNode nodes ];
		leavesSize: [ :aNode | aNode weight ];
		containerElement: [ :anElement :aNodeContext | 
			aNodeContext level = 2 ifTrue: [ 
				anElement addChild: (BrLabel new 
					text: (aNodeContext  model name name removePrefix: 'GToolkit-'); 
					look: (BrGlamorousLabelLook new fontSize: 8; foreground: Color gray); 
					constraintsDo: [ :c | c ignoreByLayout. ])].
			anElement border: (BlBorder 
				paint: (Color gray alpha: 0.7 / aNodeContext level) 
				width: 1).
			anElement padding: (BlInsets all: 1) ];
		leafElement: [ :anElement :aLeafContext | 
			| isGtView isGtExample |
			isGtView := aLeafContext model item itOrItsSuperclassesDefineGTViews.
			isGtExample := aLeafContext model item methods anySatisfy: [ :aMethod | 
				aMethod isGTExampleMethod ].
			anElement border: (BlBorder 
				paint: (Color gray alpha: 0.5 / aLeafContext level) 
				width: 1).
			anElement background: (isGtView 
				ifTrue: [(Color blue alpha: 0.6)] 
				ifFalse: [ 
					isGtExample 
						ifTrue: [ Color green muchDarker alpha: 0.6] 
						ifFalse: [ Color transparent ]]) ];
		create.
]

{ #category : #'api - instantiation' }
GtTour >> viewsExplanationWithLinks [
	<gtExample>
	| container inspectorContainer editor coder coderElement selectors variables |
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 30).
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#gtView . #columnedList . #title: . #items: . #column:format: .#contacts . #fullName . #telephone }.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aView' . 'aContact' . 'contacts'}.
	
	coder := GtMethodCoder forMethod: (GtABAddressBook>>#gtViewContactsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	
	inspectorContainer addChild: coderElement.
	
	editor := BrEditor new
		look: (BrGlamorousRegularEditorLook new fontSize: 16);
		text: self viewsExplanationWithLinksText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent.
			c linear weight: 0.5 ].
	container addChild: editor.
	container addChild: inspectorContainer.
	^ container
]

{ #category : #'api - instantiation' }
GtTour >> viewsExplanationWithLinksText [
	| text |
	
	text := 'A custom view is defined by a method in the class of the object we want to view. You can think of it as a print string method only that instead of returning a string, it returns an element.

As we can have many such representations for every single object, we have to identify the method. To this end, use the ' asRopedText,
('gtView' asRopedText glamorousExplanationFor: #gtView),
' pragma.
Then, make it so that it gets an empty ' asRopedText,
('view' asRopedText glamorousExplanationFor: #aView),
' parameter that you can customize.

In our case the view has a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
'. The view consists of a ' asRopedText,
('columned list' asRopedText glamorousExplanationFor: #columnedList),
' with ' asRopedText,
('two columns' asRopedText glamorousExplanationFor: #column:format:),
'

The columned list has as many rows as the collection returned by the ' asRopedText,
('items: block' asRopedText glamorousExplanationFor: #items:),
'. In this case, this means it shows all the ' asRopedText,
('contacts list' asRopedText glamorousExplanationFor: #contacts),

'For each ' asRopedText, 
('contact' asRopedText glamorousExplanationFor: #aContact),
' we show the ' asRopedText,
('full name' asRopedText glamorousExplanationFor: #fullName),
' in the first column, and the ' asRopedText,
('telephone' asRopedText glamorousExplanationFor: #telephone),
' in the second column' asRopedText.
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]
