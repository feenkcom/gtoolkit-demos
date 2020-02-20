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
			{GtFilePictureSlide new
				fileReference:
					(GtResourceReference
						path: Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'gtoolkit.png').
			GtTextAndElementSlide new
				element: [ self timelineElement margin: (BlInsets all: 50) ];
				elementWeight: 0.7;
				newText: 'Glamorous Toolkit is the moldable development environment.';
				newText: 'It is a live notebook. It is a flexible search interface. It is a fancy code editor. It is a software analysis platform. It is a data visualization engine. All in one. It is built in Pharo and it is free and open-source under an MIT license.';
				newText: 'What is moldable development? A new paradigm that promotes the idea that developers should explain their systems through the lens of custom tools that they create while developing the system.';
				newText: 'But, let''s take it step by step.'.
			GtLabelAndElementSlide new
				element: [ GtRawViewsSlide new asElement ];
				newFadedText: 'Consider how these different objects look quite similar in the inspector.'.
			GtLabelAndElementSlide new
				element: [ GtCustomViewsSlide new asElement ];
				newFadedText: 'Yet, when we change the view, the differences are obvious.'.
			GtLabelAndElementSlide new
				element: [ GtAllViewsSlide new asElement ];
				newFadedText: 'Every object is different, and the environment should show it, too.'.
			"GtLabelAndElementSlide new
				element: [ GtMultipleViewsForOneObjectSlide new asElement ];
				newFadedText: 'Every object can be seen in multiple ways and the environment must accommodate all of them.';
				newFadedText: 'Take a look below at a few views on an object holding a piece of text.'."
			GtTextAndElementSlide new 
				element: [ GtMultipleViewsForOneObjectSlide new grid asElement ];
				newText: 'Moldable development starts from the idea that everything about software, including code, is data. And data is shapeless, yet we, humans, need a concrete shape to reason about it. The environment provides this shape, and this is why the environment is essential.';
				newText: 'To reason about data, we need to view it through a lens that is specific to the question we have. And when we do not have an appropriate view, we should be able to create it inexpensively. This applies for everything in sofware starting from  the tiniest objects.';
				newText: 'For example, take a look to the right at a few views on an the same object holding a piece of text. Every view is relevant from a certain perspective and the environment must accommodate all of them.';
				elementWeight: 0.7.

			"		GtTitleSlide new
			titleText: ('components' asRopedText fontSize: 50; glamorousRegularFont).
		GtTextAndElementSlide new 
			element: [ GtAllViewsSlide new asElement ];
			textWithFormat: ('Glamorous Toolkit is made of multiple programmable components' asRopedText glamorousRegularFont; foreground: Color gray).
		GtComponentsSlide new.
"
			GtTextSlide new
				newText: 'Let''s start with live programming and inspection.'.
			
			GtElementSlide new
				element: [ GtExplainerExamples new inspectorOnOneObjectExample ].
			GtElementSlide new
				element: [ self viewsExplanationWithLinks ].
		
			GtTitleSlide new
				titleText:
					('moldable coding' asRopedText
						fontSize: 50;
						glamorousRegularFont).
			(GtElementSlide new
				element: [ GtInspector withToolOn: (GtClassCoder forClass: GtClassCoder) ]).
			(GtTitleSlide new
				titleText:
					('querying' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				element: [ (GtPlaygroundSlide new snippets: {'#gtView gtPragmas'}) create ];
				newFadedText: 'Inspect the result of this query. Expand the methods').
			(GtLabelAndElementSlide new
				element: [ (GtPlaygroundSlide new
					snippets: {'#gtView gtPragmas & #list gtReferences'})
					create ];
				newFadedText: 'Now, try with this composed query. Notice the highlighting').
			(GtTitleSlide new
				titleText:
					('moldable search' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				element: [ GtSpotterSlide new asElement ];
				newFadedText: 'Search is pervasive. Try searching for Object').
			(GtLabelAndElementSlide new
				element: [ GtSpotterSlide new asElement ];
				newFadedText: ('Or search for .' , FileSystem disk delimiter asString)).
			(GtTitleSlide new
				titleText:
					('live documents' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element: [ GtInspector withToolOn: (GtDocument forClass: BaselineOfGToolkit) ]).
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

{ #category : #accessing }
GtTour >> explainerOnReactJSComponents [
	| js inspectorContainer container explanationStyler look sourceElement compositeStyler editor |
	js := '  function Welcome(props) {
    return <h1>Hello, {props.name}</h1>;
  }
  function App() {
    return (
      <div>
        <Welcome name="Tudor" />
        <Welcome name="Andrei" />
        <Welcome name="John" />
      </div>
    );
  }
  ReactDOM.render(
    <App />,
    document.getElementById(''root'')
  );'.
inspectorContainer := BlElement new
    constraintsDo: [ :c | 
        c horizontal matchParent.
        c vertical matchParent ];
    layout: BlLinearLayout horizontal;
    margin: (BlInsets all: 30);
    background: Color white;
    look: BrShadowLook.
container := BlElement new
    constraintsDo: [ :c | 
        c horizontal matchParent.
        c vertical matchParent ];
    layout: BlLinearLayout horizontal.
container explainer isExplanationHolder: true.
explanationStyler := (GtSmaCCParserStyler forParser: JSXParser)
    stylerRules:
        {(GtSmaCCNodeStylerRule
            nodeClassName: #JSFunctionNode
            styleBlock: [ :styler :node :text | 
                (text from: node startPosition - 1 to: node startPosition - 1)
                    attributes: {(GtYellowCircleExplanationTextAdornment forIdentifier: #function)}.
                node name source = 'Welcome'
                    ifTrue: [ (text from: node startPosition - 1 to: node startPosition - 1)
                            attributes:
                                {(GtYellowCircleExplanationTextAdornment
                                    forIdentifier: #welcomeFunction)} ].
                node name source = 'App'
                    ifTrue: [ (text from: node startPosition - 1 to: node startPosition - 1)
                            attributes: {(GtYellowCircleExplanationTextAdornment forIdentifier: #appFunction)} ] ]).
        (GtSmaCCNodeStylerRule
            nodeClassName: #JSVariableDeclarationNode
            styleBlock: [ :styler :node :text | 
                node source = 'props'
                    ifTrue: [ (text from: node startPosition - 1 to: node startPosition - 1)
                            attributes: {(GtYellowCircleExplanationTextAdornment forIdentifier: #props)} ] ]).
        (GtSmaCCNodeStylerRule
            nodeClassName: #JSXElementNameNode
            styleBlock: [ :styler :node :text | 
                (node parent isKindOf: JSXClosingElementNode)
                    ifFalse:
                        [ #(#('Welcome' #welcome) #('div' #div) #('h1' #h1) #('App' #screen) #('Welcome' #screen) #('App' #appRender))
                            do: [ :each | 
                                each first = node source
                                    ifTrue: [ (text from: node startPosition - 1 to: node startPosition - 1)
                                            attributes: {(GtYellowCircleExplanationTextAdornment forIdentifier: each last)} ] ] ] ]).
        (GtSmaCCPatternStylerRule
            pattern:
                (JSParser
                    parse: 'ReactDOM.render'
                    startingAt: JSParser startingStateForExpression)
            styleBlock: [ :styler :node :text | 
                (text from: node startPosition - 1 to: node startPosition - 1)
                    attributes: {(GtYellowCircleExplanationTextAdornment forIdentifier: #ReactDOM)} ])}.
look := BrGlamorousCodeEditorLook new.
sourceElement := BrEditor new.
compositeStyler := GtCompositeSmaCCASTStyler forParser: JSXParser.
compositeStyler
    stylers:
        {JSXParser gtStyler.
        explanationStyler}.
look styler: compositeStyler.
sourceElement
    look: look;
    styler: compositeStyler;
    text: js asRopedText.
inspectorContainer addChild: sourceElement.
editor := BrEditor new
    look: (BrGlamorousRegularEditorLook new fontSize: 16);
    text:
        'Conceptually, components are like JavaScript functions. They accept arbitrary inputs (called “props”) and return React elements describing what should appear on the screen.
The simplest way to define a component is to write a JavaScript '
            asRopedText
            , ('function:' asRopedText glamorousExplanationFor: #function)
            ,
                '
This function is a valid React component because it accepts a single '
                    asRopedText
            , ('"props"' asRopedText glamorousExplanationFor: #props)
            ,
                ' (which stands for properties) object argument with data and returns a React element. We call such components “function components” because they are literally JavaScript functions.
Components can refer to other components in their '
                    asRopedText
            , ('output' asRopedText glamorousExplanationFor: #welcome)
            ,
                'This lets us use the same component abstraction for any level of detail. A button, a form, a '
                    asRopedText , ('div' asRopedText glamorousExplanationFor: #div)
            , ', any ' asRopedText
            , ('HTML tag' asRopedText glamorousExplanationFor: #h1)
            , ', a ' asRopedText
            , ('screen' asRopedText glamorousExplanationFor: #screen)
            ,
                ': in React apps, all those are commonly expressed as components.
For example, we can create an '
                    asRopedText
            , ('app' asRopedText glamorousExplanationFor: #appFunction)
            ,
                ' component that renders Welcome many times.
How this example works:
1. We call '
                    asRopedText
            , ('ReactDOM.render()' asRopedText glamorousExplanationFor: #ReactDOM)
            , ' with the ' asRopedText
            , ('<App/>' asRopedText glamorousExplanationFor: #appRender)
            , ' element
2. React calls the App component. This in turn ' asRopedText
            , ('calls' asRopedText glamorousExplanationFor: #welcome)
            ,
                ' the Welcome component with {name: ''Tudor''}, {name: ''Andrei''},  {name: ''John''}  as the props 
3. Our '
                    asRopedText
            , ('Welcome' asRopedText glamorousExplanationFor: #welcomeFunction)
            ,
                ' component returns first an <h1>Hello, Tudor</h1> element as the result, then <h1>Hello, Andrei</h1> and finally <h1>Hello,  John</h1>
4. React DOM efficiently updates the DOM to match  <h1>Hello, Tudor</h1><h1>Hello, Andrei</h1><h1>Hello, John</h1>.'
                    asRopedText;
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
GtTour >> overviewElement [
	| container |
	container := BlElement new
		constraintsDo: [ :c | c horizontal exact: 1200. c vertical exact: 800. ];
		layout: BlFrameLayout new.
	container addChild: (((GtDocument forClass: BaselineOfGToolkit) gtTextFor: GtPhlowView empty)
		asElementDo: [ :e | e 
			constraintsDo: [ :c | 
				c frame horizontal alignLeft. 
				c frame vertical alignCenter.
				c horizontal exact: 600.
				c vertical exact: 700 ];
			margin: (BlInsets all: 10); background: Color white; look: BrShadowLook ]).

	container addChild: ((GtPlotterScaleBasedElementExamples new plot) asScalableElement
			constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignBottom.
				c horizontal exact: 600.
				c vertical exact: 400 ];
			margin: (BlInsets top: 10 left: 10 bottom: 20 right: 200); background: (Color white); look: BrShadowLook).

	container addChild: ((GtClassCoder forClass: BaselineOfGToolkit) asElement
			constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignTop.
				c vertical exact: 500.
				c horizontal exact: 500 ];
			margin: (BlInsets top: 100 left: 10 bottom: 10 right: 10); background: (Color white); look: BrShadowLook).
	
	^ container asScalableElement 
]

{ #category : #'api - instantiation' }
GtTour >> timelineElement [
	| plotter |
	plotter := GtPlotter new.
	plotter verticalTimeline
		withProjectionAxis;
		timelineData: #key;
		projectionData: #value;
		timelineFrom: 2011 asYear 
		to: (Date today + 1 year) asYear;
		with: { 
			(Date year: 2011 month: 08 day: 22) -> 'first gt inspector'.
			(Date year: 2013 month: 12 day: 28) -> 'first gt debugger'.
			(Date year: 2014 month: 02 day: 14) -> 'first gt playground'.
			(Date year: 2014 month: 12 day: 07) -> 'first gt spotter'.
			(Date year: 2015 month: 10 day: 02) -> 'feenk founding'.
			(Date year: 2016 month: 09 day: 19) -> 'moldable tools thesis'.
			(Date year: 2017 month: 08 day: 15) -> 'new generation gt starts'.
			(Date year: 2018 month: 09 day: 10) -> 'first public demo'.
			(Date year: 2019 month: 04 day: 19) -> 'gt 0.6.42'.
			(Date year: 2019 month: 07 day: 16) -> 'first public moldable development talk'.
			(Date year: 2020 month: 02 day: 20) -> 'gt 0.7.x to be released'
		}.
		^ plotter root
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
