"
```
GtPresenterSlideShow openInSpace: GtTour
```

"
Class {
	#name : #GtTour,
	#superclass : #Object,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#category : #'GToolkit-Demo-MoldableDevelopment-Slideshows'
}

{ #category : #accessing }
GtTour >> allViewsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 8;
		element: [ GtAllViewsLiveSlide new asElement ];
		newFadedText: 'Every object is different, and the environment should show it, too.'.
]

{ #category : #accessing }
GtTour >> beaconSignals [
	true ifTrue: [ ^ BeaconSignal ].

	^ BlDevScripterSignal 
		, BlGotFocusSignal 
		, BlLostFocusSignal
		", BrAsyncElementFutureSignal" 
		", BrAsyncElementPromiseSignal"
		", BrElementUpdaterSignal" 
		, GtPharoStreamingMethodsCoderElementSignal
		, GtTextualCoderEditorElementSignal
]

{ #category : #accessing }
GtTour >> classCommentAsLiveDocumentExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 29;
		element: [ self coderWithComment ];
		newFadedText: 'Interestingly, the same engine works for class comments as well.';
		newFadedText: 'Click on the links to spawn other documents and navigate the image as a wiki.'.
]

{ #category : #accessing }
GtTour >> coderExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 21;
		newTextWithFormat: self coderExplanationWithLinksText;
		elementWeight: 0.6;
		element: [ self coderExplanationWithLinks ].
]

{ #category : #accessing }
GtTour >> coderExplanationWithLinks [
	<gtExample>
	<noTest>
	| container coderElement packageHierarchyTarget classHierarchyTarget classNameTarget methodTabTarget commentTabTarget referencesTab expandClassTarget expandMethodTarget deleteButtonTarget classButtonTargets searchButtonTarget addClassButtonTarget methodButtonTargets addMethodButtonTarget filterMethodsButtonTarget scripter |
	
	container := BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		background: Color white;
		aptitude: BrShadowAptitude.
	
	scripter := BlScripter new.
	scripter element: ((GtCoderElement forClass: GtABAddressBook) createInPager maximized) asElement;
			play.
	
	coderElement := scripter elementWithoutParent.
	
	packageHierarchyTarget := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			((aChild isKindOf: BlTextElement) and: [aChild text asString = 'Package Hierarchy' asString ])]
		ifFound: [:aChild | aChild].
	classHierarchyTarget := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			((aChild isKindOf: BlTextElement) and: [aChild text asString = 'Class Hierarchy' asString ])]
		ifFound: [:aChild | aChild].
	referencesTab := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			((aChild isKindOf: BlTextElement) and: [aChild text asString = 'References'])]
		ifFound: [:aChild | aChild parent].
	classNameTarget := coderElement 
		allChildrenBreadthFirstDetect: [:aChild | 
			((aChild isKindOf: BrEditableLabel) and: [aChild parent isKindOf: BrHorizontalPane])]
		ifFound: [:aChild | aChild parent].
	methodTabTarget := coderElement 
		allChildrenBreadthFirstDetect: [:aChild | 
			((aChild isKindOf: BlTextElement) and: [aChild text asString = 'Methods'])]
		ifFound: [:aChild | aChild parent].
	commentTabTarget := coderElement 
		allChildrenBreadthFirstDetect: [:aChild | 
			((aChild isKindOf: BlTextElement) and: [aChild text asString beginsWith: 'Comment'])]
		ifFound: [:aChild | aChild parent].
	expandClassTarget := coderElement 
		allChildrenBreadthFirstDetect: [:aChild | 
			((aChild isKindOf: BlElement) and: [aChild parent isKindOf: GtPharoBehaviorDefinitionCoderElement])]
		ifFound: [:aChild | aChild].
	expandMethodTarget := coderElement 
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: GtExpandableSourceCoderElement)]
		ifFound: [:aChild | aChild].
	deleteButtonTarget := coderElement 
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: GtPreviewChangeButton)]
		ifFound: [:aChild | aChild].
	classButtonTargets := coderElement
		allChildrenBreadthFirstSelect: [:aChild | 
			(aChild isKindOf: BrButton) and: [aChild parent parent isKindOf: GtCoderToolbarElement ]].
	searchButtonTarget := classButtonTargets first.
	addClassButtonTarget := classButtonTargets last.
	methodButtonTargets := coderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			aChild isKindOf: GtPharoBehaviorCoderElement] 
		ifFound: [:aChild | 
			aChild allChildrenBreadthFirstSelect: [:aButtonChild | 
				(aButtonChild isKindOf: BrButton) and: [aButtonChild parent isKindOf: BrToolbar]]].
	filterMethodsButtonTarget := methodButtonTargets first.
	addMethodButtonTarget := methodButtonTargets at: 2.
	
	packageHierarchyTarget
		addChild:
			(( self yellowExplanationTargetCircleFor: #packageHierarchy)
				relocate:
					(2 @ 10)).
	classHierarchyTarget
		addChild:
			(( self yellowExplanationTargetCircleFor: #classHierarchy)
				relocate:
					(2 @ 10)).
	classNameTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #className)
				relocate:
					(0 @ 18)).
	methodTabTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #methodTab)
				relocate:
					(8 @ methodTabTarget extent y / 2)).
	commentTabTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #commentTab)
				relocate:
					(8 @ commentTabTarget extent y / 2)).
	referencesTab
		addChild:
			((self yellowExplanationTargetCircleFor: #referencesTab)
				relocate:
					(8 @ referencesTab extent y / 2)).
	expandClassTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #expandClassButton)
				relocate:
					(10 @ expandClassTarget extent y / 2)).
	expandMethodTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #expandMethodButton)
				relocate:
					(12 @ 8)).
	deleteButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #deleteClassButton)
				relocate:
					(12 @ deleteButtonTarget extent y / 2)).
	filterMethodsButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #filterButton)
				relocate:
					(5 @ filterMethodsButtonTarget extent y / 2)).			
	addMethodButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #addMethodButton)
				relocate:
					(5 @ addMethodButtonTarget extent y / 2)).
	searchButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #searchButton)
				relocate:
					(5 @ searchButtonTarget extent y / 2)).
	addClassButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #addClassButton)
				relocate:
					(5 @ addClassButtonTarget extent y / 2)).
	
	^ container
		addChild: coderElement.
]

{ #category : #accessing }
GtTour >> coderExplanationWithLinksText [
	| text |
	
	text := 'Coder is where you manage your code.
When opened on a class, you see the ' asRopedText, ('name' asRopedText glamorousExplanationFor: #className),
' and an ' asRopedText,
('expandable editor' asRopedText glamorousExplanationFor: #expandClassButton),
 ' for the definition including details like: the superclass, package, tag, traits, instance and class side variables. ' asRopedText,
'Underneath we have different views on the class such as ' asRopedText,
('methods' asRopedText glamorousExplanationFor: #methodTab), ', the ' asRopedText,
('class comment' asRopedText glamorousExplanationFor: #commentTab),
' or a list of ' asRopedText,
('references' asRopedText glamorousExplanationFor: #referencesTab),
'. Coder also provides the possibility to ' asRopedText,
('delete' asRopedText glamorousExplanationFor: #deleteClassButton),
' the current class, to ' asRopedText,
('add' asRopedText glamorousExplanationFor: #addClassButton),
' a new one, to ' asRopedText,
('search' asRopedText glamorousExplanationFor: #searchButton),
' inside the class or to ' asRopedText,
('add' asRopedText glamorousExplanationFor: #addMethodButton),
' new methods to the class.
As for methods, they can also be ' asRopedText,
('expanded' asRopedText glamorousExplanationFor: #expandMethodButton),
' and edited in place and they can be ' asRopedText,
('filtered' asRopedText glamorousExplanationFor: #filterButton),
' using different criterias chosen from the list.
When maximized, Coder also offers a ' asRopedText,
('package hierarchy' asRopedText glamorousExplanationFor: #packageHierarchy),
' view showing all packages in the system, and a ' asRopedText,
('class hierarchy' asRopedText glamorousExplanationFor: #classHierarchy),
' with the super and subclasses of the current class.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtTour >> coderSlideshowLinkSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide slideshow
		priority: 22;
		textWithFormat: 'Want to learn more about the Coder? Follow the show below' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtCoderSlideshow new ] withTitle: 'Coder Slideshow'.
]

{ #category : #'api - instantiation' }
GtTour >> coderWithComment [
	<gtExample>
	| aScripter |
	aScripter := BlScripter new.
	aScripter
		substep: 'Initial Coder'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ (GtCoderElement forClass: GtCSPicture) createInPager maximized ];
				play ].
	aScripter
		substep: 'Evaluate first snippet and inspect'
		do: [ :aStep | 
			aStep
				clickStep: [ :s | 
					s
						label: 'Click on evaluate and inspect button';
						onBreadthFirstChildOfClass: GtPharoBehaviorCoderElement;
						onBreadthFirstChildOfClass: BrTabGroup;
						id: #header;
						onChildAt: 1;
						onChildAt: 1;
						onChildAt: 2 ].
			aStep wait
				forEmptySpaceTaskQueue;
				play ].
	^ aScripter elementWithoutParent
]

{ #category : #accessing }
GtTour >> composedQueryExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 18;
		element: [ (GtPlaygroundLiveSlide new
			snippets: {'#gtView gtPragmas & #list gtReferences'})
			create ];
		newFadedText: 'A query is but regular code. Inspecting the result of a query shows a filter object that offers a view through which we can browse code.';
		newFadedText: 'Just like that, we molded ourselves a query browser. Now, try with this composed query. Notice the highlighting'.
]

{ #category : #accessing }
GtTour >> customViewsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 7;
		element: [ GtCustomViewsLiveSlide new asElement ];
		newFadedText: 'Yet, when we change the view, the differences are obvious.'.
]

{ #category : #accessing }
GtTour >> explainerOnReactJSComponents [
	<gtExample>
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
    aptitude: BrShadowAptitude.
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
look := BrGlamorousCodeEditorAptitude new.
sourceElement := BrEditor new.
compositeStyler := GtCompositeSmaCCASTStyler forParser: JSXParser.
compositeStyler
    stylers:
        {JSXParser gtStyler.
        explanationStyler}.
look styler: compositeStyler.
sourceElement
    aptitude: look;
    styler: compositeStyler;
    text: js asRopedText.
inspectorContainer addChild: sourceElement.
editor := BrEditor new
    aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
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

{ #category : #accessing }
GtTour >> feenkNameSlideFor: aSlide [
"	<gtSlide>"
	^ aSlide element
		priority: 1.1;
		element: [| form |
				form := PNGReadWriter formFromFileNamed: (GtResourceReference
						path: Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'feenk.png') fullName.
BlElement new 
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			layout: BlLinearLayout horizontal;
				addChild: (
					BlElement new
						constraintsDo: [ :c |
							c horizontal matchParent.
							c vertical fitContent.
							c linear vertical alignCenter ];
						layout: BlLinearLayout vertical;
						addChild: (BrVerticalPane new 
							constraintsDo: [ :c |
								c linear horizontal alignCenter ];
							addChild: (form asElement asScalableElement maxScale: 0.2; constraintsDo: [:c | c horizontal matchParent. c vertical matchParent]); hExact: 400; vExact: 200);
						addChild: (BlTextElement new 
							constraintsDo: [ :c |
								c linear horizontal alignCenter ];
							text: (('we make your systems explainable. literally.' asRopedText glamorousRegularFont bold fontSize: 30))))
				]
]

{ #category : #slides }
GtTour >> graphicalStackFirstExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 34;
		element: [ self visualizationElement ];
		newFadedText: 'Visualization is supported directly by the graphical stack.'.
]

{ #category : #slides }
GtTour >> graphicalStackIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 33;
		newText: 'The graphical stack is worth taking a look at as well. It features the property that it renders everything in a single tree.'.
]

{ #category : #slides }
GtTour >> graphicalStackSecondExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide labelAndElement
		priority: 36;
		element: [ self treemapWithViewsAndExamples ];
		newFadedText: 'The need for moldability is pervasive.';
		newFadedText: 'The visualization below shows a treemap of the classes and packages from the current image.';
		newFadedText: 'Blue denotes classes that contain at least one custom view; green shows those that have an example.'.
]

{ #category : #accessing }
GtTour >> inspectorExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: GtExplainerExamples new inspectorExplanationText;
		element: [ BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			background: Color white;
			aptitude: BrShadowAptitude;
			margin: (BlInsets right: 5);
			addChild: (GtPager 
				createWrappedOn: (GtExplainerExamples>>#inspectorContainerElement) gtExampleValue) maximized ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtTour >> jsParserExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 31;
		element: [ GtPager createWrappedOn: (GtPharoBehaviorCoder forClass: JSParser) ];
		newFadedText: 'The first non-Pharo language we accommodated is the language with which we write parsers for other languages.'.
]

{ #category : #accessing }
GtTour >> liveDocumentExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 28;
		element: [ (GtLepiterPageLiveSlide new pageNamed: 'Glamorous Toolkit' from: 'Glamorous Toolkit Book') create maximized];
		newFadedText: 'This is a live document intertwining text, code and graphics. It is also part of a book about Glamorous Toolkit.';
		newFadedText: 'Browse it. Execute the code. Try editing the text, too. It''s live'.
]

{ #category : #accessing }
GtTour >> liveDocumentTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 27;
		titleWithFormat:
			('live documents' asRopedText
				fontSize: 50;
				glamorousRegularFont).
]

{ #category : #accessing }
GtTour >> liveProgrammingIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 10;
		newText: 'Let''s start with live programming and inspection.'.
]

{ #category : #accessing }
GtTour >> moldableCodingTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 20;
		newText: 'The moldability principle applies through the whole environment. Including to how we write code.'.
]

{ #category : #slides }
GtTour >> moldableDevelopmentSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide slideshow
		priority: 37;
		text: ('Want to learn more about moldable development? Follow the show below.');
		slideshow: [ GtLiveShow createWithArrowsVisible: GtMoldableDevelopmentSlideshow new ] withTitle: 'Moldable Development'.
]

{ #category : #accessing }
GtTour >> moldableSearchTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 23;
		newText: 'Search is moldable, too. The tool that deals with it is called Spotter.'.
]

{ #category : #accessing }
GtTour >> multipleViewsForOneObjectExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		element: [ GtMultipleViewsForOneObjectLiveSlide new grid asElement ];
		newText: 'Moldable development starts from the idea that everything about software, including code, is data. And data is shapeless, yet we, humans, need a concrete shape to reason about it. The environment provides this shape, and this is why the environment is essential.';
		newText: 'To reason about data, we need to view it through a lens that is specific to the question we have. And when we do not have an appropriate view, we should be able to create it inexpensively. This applies for everything in software starting from the tiniest objects.';
		newText: 'For example, take a look to the right at a few views on the same object holding a piece of text. Every view is relevant from a certain perspective and the environment must accommodate all of them.';
		elementWeight: 0.5.
]

{ #category : #slides }
GtTour >> oneRenderingTreeSlideshowLinkSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide slideshow
		priority: 35;
		text: ('Want to dive deeper into the rendering stack? Follow the show below.');
		slideshow: [ GtLiveShow createWithArrowsVisible: GtOneRenderingTree new ] withTitle: 'One rendering tree'.
]

{ #category : #accessing }
GtTour >> otherLanguagesIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 30;
		newText: 'Glamorous Toolkit is a platform. While it is implemented in Pharo, it can already tackle multiple other languages.'.
]

{ #category : #'api - instantiation' }
GtTour >> overviewElement [
	| container |
	container := BlElement new
		constraintsDo: [ :c | c horizontal exact: 1200. c vertical exact: 800. ];
		layout: BlFrameLayout new.
	container addChild: ((LeCoderCommentElement coderElementFor: #BaselineOfGToolkit)
			constraintsDo: [ :c | 
				c frame horizontal alignLeft. 
				c frame vertical alignCenter.
				c horizontal exact: 600.
				c vertical exact: 700 ];
			margin: (BlInsets all: 10); 
			background: Color white; 
			aptitude: BrShadowAptitude).

	container addChild: ((GtPlotterScaleBasedElementExamples new plot) asScalableElement
			constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignBottom.
				c horizontal exact: 600.
				c vertical exact: 400 ];
			margin: (BlInsets top: 10 left: 10 bottom: 20 right: 200); background: (Color white); aptitude: BrShadowAptitude).

	container addChild: ((GtPharoBehaviorCoder forClass: BaselineOfGToolkit) asElement
			constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignTop.
				c vertical exact: 500.
				c horizontal exact: 500 ];
			margin: (BlInsets top: 100 left: 10 bottom: 10 right: 10); background: (Color white); aptitude: BrShadowAptitude).
	
	^ container asScalableElement 
]

{ #category : #parsing }
GtTour >> parseCSharp [
	<gtExample>
	<noTest>
	"Parse C#"
	| csharp |
	csharp := ZnClient new 
		url: 'https://raw.githubusercontent.com/microsoft/calculator/66ad328d0018c360c1a0dc766f994c7fdb7d4a3f/src/CalculatorUITestFramework/MemoryPanel.cs';
		get.
	CSharpParser parse: csharp
]

{ #category : #parsing }
GtTour >> parseClojure [
	<gtExample>
	<noTest>
	"Parse Clojure"
	| clojure |
	clojure := ZnClient new 
		url: 'https://raw.githubusercontent.com/clojure/clojure/master/src/clj/clojure/main.clj';
		get.
	ClojureParser parse: clojure.
]

{ #category : #parsing }
GtTour >> parseJSX [
	<gtExample>
	<noTest>
	"Parse JSX"
	| js |
	js := ZnClient new 
		url: 'https://raw.githubusercontent.com/zooniverse/mobile/a0a7fe122790fc47d8d2c5931a084bcc52518e4e/src/components/Button.js';
		get.
	JSXParser parse: js
]

{ #category : #parsing }
GtTour >> parseJava [
	<gtExample>
	<noTest>
	"Parse Java"
	| java |
	java := ZnClient new 
		url: 'https://raw.githubusercontent.com/spring-projects/spring-framework/b2bcb0f93ad04a6ddc729a487f9346defa6c39d6/spring-context/src/main/java/org/springframework/format/datetime/DateFormatter.java';
		get.
	JavaParser parse: java
]

{ #category : #parsing }
GtTour >> parseJavaScript [
	<gtExample>
	<noTest>
	"Parse JavaScript"
	| js |
	js := ZnClient new 
		url: 'https://raw.githubusercontent.com/zooniverse/mobile/a0a7fe122790fc47d8d2c5931a084bcc52518e4e/src/utils/workflow-utils.js';
		get.
	JSParser parse: js
]

{ #category : #slides }
GtTour >> parseLanguagesSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 32;
		newFadedText: ('Glamorous Toolkit comes with multiple parsers. Play with a few below.');
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #parseJavaScript;
				newSnippetFromMethod: self class>> #parseJSX;
				newSnippetFromMethod: self class>> #parsePython;
				newSnippetFromMethod: self class>> #parseClojure;
				newSnippetFromMethod: self class>> #parseJava;
				newSnippetFromMethod: self class>> #parseCSharp]
]

{ #category : #parsing }
GtTour >> parsePython [
	<gtExample>
	<noTest>
	"Parse Python"
	| python |
	python := ZnClient new
		url: 'https://raw.githubusercontent.com/tensorflow/tensorflow/master/tensorflow/python/platform/app.py';
		get.
	PythonParser parse: python.
]

{ #category : #accessing }
GtTour >> playgroundExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 14;
		newTextWithFormat: self playgroundExplanationWithLinksText;
		elementWeight: 0.6;
		element: [ self playgroundExplanationWithLinks ].
]

{ #category : #accessing }
GtTour >> playgroundExplanationWithLinks [
	<gtExample>
	| container playgroundElement scripter |
	container := BlElement new
			constraintsDo: [ :c | 
				c vertical matchParent.
				c horizontal matchParent ];
			layout: BlLinearLayout horizontal;
			margin: (BlInsets all: 5);
			background: Color white;
			aptitude: BrShadowAptitude.
	scripter := BlScripter new.
	scripter
		element: (GtPlaygroundLiveSlide new
				snippets: {'a := 40'.
						'a + 2'}) asElement;
		play.
	scripter
		substep: 'Selecting snippet'
		do: [ :aStep | 
			aStep
				clickStep: [ :s | 
					s
						label: 'Click on snippet';
						onBreadthFirstChildOfClass: LePharoSnippetElement ].
			aStep wait
				forEmptySpaceTaskQueue;
				play ].

	playgroundElement := scripter elementWithoutParent.
	(playgroundElement query // LePharoSnippetElement) all
		do: [ :snippet | 
			snippet addChild: (self yellowExplanationTargetCircleFor: #snippets).
			(snippet query // #bottomToolbar) all
				do: [ :toolbar | toolbar addChild: (self yellowExplanationTargetCircleFor: #plusButton) ].
			(snippet query // GtSourceCoderDoItActionId) all
				do: [ :toolbar | toolbar addChild: (self yellowExplanationTargetCircleFor: #evaluateButton) ].
			(snippet query // GtSourceCoderDoItAndGoActionId) all
				do: [ :toolbar | toolbar addChild: (self yellowExplanationTargetCircleFor: #inspectButton) ].
			(snippet query // GtSourceCoderDebugActionId) all
				do: [ :toolbar | toolbar addChild: (self yellowExplanationTargetCircleFor: #debugButton) ] ].
	^ container addChild: playgroundElement
]

{ #category : #accessing }
GtTour >> playgroundExplanationWithLinksText [
	| text |
	
	text := 'Playground is where you can play around with the code. You can run queries or create scripts without the need for classes, methods or variable declarations. The last line in the script is the one that returns an object that is then opened in the inspector.

You can have multiple code ' asRopedText,
('snippets' asRopedText glamorousExplanationFor: #snippets),
' opened at the same time, allowing you to easily run different scripts or to have a bigger script split into smaller ones for better readability. To open a new snippet you click the ' asRopedText,
('+' asRopedText glamorousExplanationFor: #plusButton),
' button and then select pharo.

The playground lets you ' asRopedText,
('evaluate' asRopedText glamorousExplanationFor: #evaluateButton),
', ' asRopedText,
('inspect' asRopedText glamorousExplanationFor: #inspectButton),
' and ' asRopedText,
('debug' asRopedText glamorousExplanationFor: #debugButton),
' each snippet. The result of the last executed script will be the one opened in the inspector.' asRopedText.

	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtTour >> playgroundSlideshowLinkSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide slideshow
		priority: 15;
		textWithFormat: 'Want to learn more about the Playground? Follow the show below' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtPlaygroundAndInspectorShow new ] withTitle: 'Playground Slideshow'.
]

{ #category : #accessing }
GtTour >> queryExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 17;
		element: [ (GtPlaygroundLiveSlide new snippets: {'#gtView gtPragmas'}) create ];
		newFadedText: 'Here is a basic query that searches for all methods that define an inspector extension. Inspect the result of this query. What do you see?'.
]

{ #category : #accessing }
GtTour >> querySlideshowLinkSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide slideshow
		priority: 19;
		textWithFormat: ('To learn more about queries follow the show below.' asRopedText glamorousRegularFont);
		slideshow: [ GtLiveShow createWithArrowsVisible: GtQueryingCodeShow new ] withTitle: 'Querying Code'.
]

{ #category : #accessing }
GtTour >> queryTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 16;
		newText: 'Ok, we have inspectors that can be molded to show objects in many ways. And we have a playground from which to start the conversation with our objects.';
		newText: 'What can we do with these? Many things. One of them is querying code.'.
]

{ #category : #accessing }
GtTour >> rawViewsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 6;
		element: [ GtRawViewsLiveSlide new asElement ];
		newFadedText: 'Consider how these different objects look quite similar in the inspector.'.
]

{ #category : #accessing }
GtTour >> scripterWithElaborateScenario [
	<gtExample>
	| scripter pageWidth moveTokenMethod allMovesMethod |
	scripter := BlScripter new.
	scripter do
		block: [ :aSpace | aSpace extent: 1600 @ 870 ];
		onSpace;
		play.
	moveTokenMethod := GtLudoGame >> #moveTokenNamed:.
	
	scripter memoryLogger
		runFor: self beaconSignals 
		during: [ :aStep |
			aStep element: (GtPager createWrappedOn: (GtCoder forMethod: moveTokenMethod)) ].
		
	pageWidth := scripter space width / 3.
	scripter do
		block: [ :aPage | aPage width: pageWidth ];
		// (GtPagerPageElementId indexed: 1);
		play.
	scripter methodCoders
		forCompiledMethod: moveTokenMethod do: [ :aMethodCoderStep |
			aMethodCoderStep shortcut
				combination: BlKeyCombination primaryN;
				// GtSourceCoderEditorId;
				onChildAt: 1;
				onChildAt: 1.
			aMethodCoderStep 
				clickOnMethodCoderExpander: 1 insideDo: [ :aStep1 |  ] ];
		// (GtPagerPageElementId indexed: 1);
		// GtPharoStreamingMethodsCoderElement;
		play.
	scripter do
		block: [ :aPage | aPage width: pageWidth ];
		// (GtPagerPageElementId indexed: 2);
		play.
	allMovesMethod := GtLudoRecordingGameExamples >> #gameShowingAllMoves2.
	scripter methodCoders
		expandAndFocusCompiledMethod: allMovesMethod;
		scrollToCompiledMethod: allMovesMethod;
		forCompiledMethod: allMovesMethod do: [ :aMethodCoderStep |
			aMethodCoderStep
				clickOnPlayAndInspectExampleButton ];
		// (GtPagerPageElementId indexed: 2);
		// GtPharoStreamingMethodsCoderElement;
		play.
	scripter do
		block: [ :aPage | aPage width: pageWidth ];
		// (GtPagerPageElementId indexed: 3);
		play.
	scripter methodCoders
		forCompiledMethod: allMovesMethod do: [ :aMethodCoderStep |
			aMethodCoderStep
				clickOnMethodCoderExpander: 1 insideDo: [ :aStep1 |  ] ];
		scrollToCompiledMethod: allMovesMethod;
		forCompiledMethod: allMovesMethod do: [ :aMethodCoderStep |
			aMethodCoderStep mouseMoveOver
				// GtMethodCoderPlayAndInspectExampleActionId;
				onTopMost ];
		// (GtPagerPageElementId indexed: 2);
		// GtPharoStreamingMethodsCoderElement;
		play.
	^ scripter
]

{ #category : #accessing }
GtTour >> spotterExampleSlide: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 24;
		element: [ GtSpotterLiveSlide new asElement ];
		newFadedText: 'Search is pervasive. Try searching for Object'.
]

{ #category : #accessing }
GtTour >> spotterSecondExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 25;
		element: [ GtSpotterLiveSlide new asElement ];
		newFadedText: ('Or search for .' , FileSystem disk delimiter asString).
]

{ #category : #accessing }
GtTour >> spotterSlideshowLinkSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide slideshow
		priority: 26;
		textWithFormat: 'Want to learn more about the Spotter? Follow the show below' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtSpotterSlideshow new ] withTitle: 'Spotter Slideshow'.
]

{ #category : #'api - instantiation' }
GtTour >> timelineElement [
	<gtExample>
	| plotter |
	plotter := GtPlotter new.
	plotter verticalTimeline
		withProjectionAxis;
		timelineData: #key;
		projectionData: #value;
		timelineFrom: 2011 asYear 
		to: (Date today + 1 year) asYear;
		with: { 
			(Date year: 2011 month: 08 day: 22) -> 'First GT inspector'.
			(Date year: 2013 month: 12 day: 28) -> 'First GT debugger'.
			(Date year: 2014 month: 02 day: 14) -> 'First GT playground'.
			(Date year: 2014 month: 12 day: 07) -> 'First GT spotter'.
			(Date year: 2015 month: 10 day: 02) -> 'feenk founding'.
			(Date year: 2016 month: 09 day: 19) -> 'Moldable Tools thesis'.
			(Date year: 2017 month: 08 day: 15) -> 'New generation of Glamorous Toolkit starts'.
			(Date year: 2018 month: 09 day: 10) -> 'First public demo'.
			(Date year: 2019 month: 04 day: 19) -> 'Glamorous Toolkit 0.6.42 alpha'.
			(Date year: 2019 month: 07 day: 16) -> 'First public Moldable Development talk'.
			(Date year: 2020 month: 07 day: 23) -> 'Glamorous Toolkit v0.7.1214 beta'.
			(Date year: 2021 month: 06 day: 04) -> 'Lepiter'.
			(Date year: 2023 month: 08 day: 29) -> 'Glamorous Toolkit v1.0'
		}.
	^ plotter asElement
]

{ #category : #accessing }
GtTour >> timelineExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 5;
		element: [ self timelineElement margin: (BlInsets left: 50 right: 50) ];
		elementWeight: 0.6;
		newText: 'Glamorous Toolkit is the Moldable Development environment.';
		newText: 'It is a live notebook. It is a flexible search interface. It is a fancy code editor. It is a software analysis platform. It is a data visualization engine. All in one. It is built in Pharo and it is free and open-source under an MIT license.';
		newText: 'What is Moldable Development? A way of programming that promotes the idea that developers should explain their systems through the lens of custom tools that they create while developing the system.';
		newText: 'Let''s take it step by step.'.
]

{ #category : #accessing }
GtTour >> title: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('glamoroustoolkit' asRopedText 
			fontSize: 60;
			glamorousRegularFont;
			thin;
			in: [:t | (t from: 'glamorous' size + 1 to: t size) bold]; yourself);
		subtitleWithFormat: ('a tour' asRopedText 
			fontSize: 40;
			glamorousRegularFont;
			bold)
]

{ #category : #accessing }
GtTour >> tooltip: aString [
	^ [ BrLabel new
		aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
		padding: (BlInsets all: 2);
		text: aString;
		alignCenter ] asStencil
]

{ #category : #accessing }
GtTour >> treemapWithBook [
	<gtExample>
	| database tocPage topTocSnippets |
	database := LeDatabasesRegistry defaultLogicalDatabase
			databaseNamed: 'Glamorous Toolkit Book'.
	tocPage := database pages
			detect: [ :each | each title = 'Glamorous Toolkit Book' ].
	topTocSnippets := tocPage children.
	^ GtNestedRectangleTreeMap new
		roots: topTocSnippets;
		deep: [ :aNode | aNode children select: [ :each | each children notEmpty ] ];
		leaves: [ :aNode | aNode asCollection , (aNode children select: [ :each | each children isEmpty and: [ each allOutgoingExplicitLinks notEmpty ] ]) ];
		leavesSize: [ :aNode | 
			| pageLinkedFromSnnipet |
			pageLinkedFromSnnipet := aNode outgoingTextualLinks anyOne target.
			pageLinkedFromSnnipet allChildrenBreadthFirst size ];
		leafElement: [ :anElement :aLeafContext | 
			anElement border: (Color gray alpha: 0.5 / aLeafContext level).
			anElement
				when: BlClickEvent
				do: [ :e | 
					anElement phlow
						spawnTool: aLeafContext model allOutgoingExplicitLinks anyOne target asPhlowTool ].
			anElement
				aptitude: ((BrGlamorousWithTooltipAptitude
						content: [ BrLabel new
								text: aLeafContext model allOutgoingExplicitLinks anyOne target title;
								aptitude: BrGlamorousLabelAptitude ]) showDelay: 300 milliSeconds)
						+ (BrStyleCommonAptitude new
								default: [ :aStyle | aStyle background: Color transparent ];
								hovered: [ :aStyle | aStyle background: (Color blue alpha: 0.5) ]) ];
		containerElement: [ :anElement :aNodeContext | 
			aNodeContext level = 2
				ifTrue: [ anElement
						addChild: (BrLabel new
								text: ((aNodeContext model contentAsString removePrefix: '[[') removeSuffix: ']]');
								aptitude: (BrGlamorousLabelAptitude new
										fontSize: 12;
										foreground: Color black);
								constraintsDo: [ :c | c ignoreByLayout ]) ].
			anElement border: (BlBorder paint: (Color gray alpha: 0.5 / aNodeContext level) width: 1).
			anElement padding: (BlInsets all: 1) ];
		asElement
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
					text: (aNodeContext  model name name withoutPrefix: 'GToolkit-'); 
					aptitude: (BrGlamorousLabelAptitude new fontSize: 8; foreground: Color gray); 
					constraintsDo: [ :c | c ignoreByLayout. ])].
			anElement border: (BlBorder 
				paint: (Color gray alpha: 0.7 / aNodeContext level) 
				width: 1).
			anElement padding: (BlInsets all: 1) ];
		leafElement: [ :anElement :aLeafContext | 
			| isGtView isGtExample class |
			class := aLeafContext model item.
			isGtView := class itOrItsSuperclassesDefineGTViews.
			isGtExample := class methods anySatisfy: [ :aMethod | 
				aMethod isGTExampleMethod ].
			anElement when: BlClickEvent do: [ :e | e target phlow spawnTool: (GtClassCoderTool forClass: class) ].
			anElement aptitude: (BrGlamorousWithTooltipAptitude content: (self tooltip: class name)) .
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

{ #category : #'as yet unclassified' }
GtTour >> viewMethodWithResultExplanationWithLinksExample [
	<gtExample>
	| resultInspectorContainer verticalContainer coderElement resultElement coderExplanationLabel inspectorExplanationLabel |
	
	verticalContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.
			c padding: (BlInsets all: 5)];
		layout: BlLinearLayout vertical.
	
	resultInspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		aptitude: BrShadowAptitude;
		background: Color white;
		margin: (BlInsets all: 10).
	
	coderExplanationLabel := BrLabel new
		text: ('Contacts with details view method' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		aptitude: BrGlamorousLabelAptitude new.
	inspectorExplanationLabel := BrLabel new
		text: ('Contacts with details view result' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		aptitude: BrGlamorousLabelAptitude new.
	
	coderElement := GtMethodCoderExplanationStylerExamples new coderOnViewMethod.
		
	resultElement := GtMethodCoderExplanationStylerExamples new inspectorOnViewMethod.	
	resultInspectorContainer addChild: resultElement.
	
	
	verticalContainer addChild: coderExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: inspectorExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
]

{ #category : #accessing }
GtTour >> viewsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 12;
		newTextWithFormat: GtMethodCoderExplanationStylerExamples new viewsExplanationWithLinksText;
		element: [ self viewMethodWithResultExplanationWithLinksExample ].
]

{ #category : #accessing }
GtTour >> visualizationElement [
	^ BlElement new
			layout: (BlLinearLayout new);
			constraintsDo: [:c | 
				c vertical matchParent.
				c horizontal matchParent];
			addChild: (GtBuildingTreeMapsExplanation new treemapWithCustomContainerElement asElement
				aptitude: BrShadowAptitude;
				background: Color white;
				margin: (BlInsets all: 20));
			addChild: (GtMondrianDomainExamples new structureOfAnElement asElement
				aptitude: BrShadowAptitude;
				background: Color white;
				margin: (BlInsets all: 20));
			addChild: (GtPlotterHorizontalBarChartExamples new brickDependenciesSizesBarChart asElement
				aptitude: BrShadowAptitude;
				background: Color white;
				margin: (BlInsets all: 20);
				constraintsDo: [:c |
					c grid horizontal span: 2
				])
]

{ #category : #utility }
GtTour >> yellowExplanationTargetCircleFor: aModel [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 1 @ 1;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: aModel).
]
