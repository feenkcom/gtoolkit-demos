Class {
	#name : #GtTour,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
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
GtTour >> classCommentAsLiveDocumentExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 29;
		element: [ self coderWithComment ];
		newFadedText: 'Interestingly, the document is actually the comment of a class.';
		newFadedText: 'Click on the links to spawn other documents and navigate the image as a wiki.'.
]

{ #category : #accessing }
GtTour >> coderExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 17;
		newTextWithFormat: self coderExplanationWithLinksText;
		elementWeight: 0.6;
		element: [ self coderExplanationWithLinks ].
]

{ #category : #accessing }
GtTour >> coderExplanationWithLinks [
	<gtExample>
	| container coderElement packageHierarchyTarget classHierarchyTarget classNameTarget methodTabTarget commentTabTarget referencesTab expandClassTarget expandMethodTarget deleteButtonTarget classButtonTargets searchButtonTarget addClassButtonTarget methodButtonTargets addMethodButtonTarget filterMethodsButtonTarget |
	
	container := BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		background: Color white;
		look: BrShadowLook.
	
	coderElement := BlUseAsyncFeatures disableDuring: [ 
		((GtCoder forClass: GtABAddressBook) createInPager maximized) asElement ].
	coderElement forceLayout.
	
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
			((aChild isKindOf: BlTextElement) and: [aChild text asString = 'Comment'])]
		ifFound: [:aChild | aChild parent].
	expandClassTarget := coderElement 
		allChildrenBreadthFirstDetect: [:aChild | 
			((aChild isKindOf: BlElement) and: [aChild parent isKindOf: GtBehaviorDefinitionCoderElement])]
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
			aChild isKindOf: GtBehaviorCoderElement] 
		ifFound: [:aChild | 
			aChild allChildrenBreadthFirstSelect: [:aButtonChild | 
				(aButtonChild isKindOf: BrButton) and: [aButtonChild parent isKindOf: BrToolbar]]].
	filterMethodsButtonTarget := methodButtonTargets first.
	addMethodButtonTarget := methodButtonTargets at: 2.
	
	packageHierarchyTarget
		addChild:
			(( self yellowTargetCircleWithExplanationModel: #packageHierarchy)
				relocate:
					(2 @ 10)).
	classHierarchyTarget
		addChild:
			(( self yellowTargetCircleWithExplanationModel: #classHierarchy)
				relocate:
					(2 @ 10)).
	classNameTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #className)
				relocate:
					(0 @ 18)).
	methodTabTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #methodTab)
				relocate:
					(8 @ methodTabTarget extent y / 2)).
	commentTabTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #commentTab)
				relocate:
					(8 @ commentTabTarget extent y / 2)).
	referencesTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #referencesTab)
				relocate:
					(8 @ referencesTab extent y / 2)).
	expandClassTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #expandClassButton)
				relocate:
					(10 @ expandClassTarget extent y / 2)).
	expandMethodTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #expandMethodButton)
				relocate:
					(12 @ 8)).
	deleteButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #deleteClassButton)
				relocate:
					(12 @ deleteButtonTarget extent y / 2)).
	filterMethodsButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #filterButton)
				relocate:
					(5 @ filterMethodsButtonTarget extent y / 2)).			
	addMethodButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #addMethodButton)
				relocate:
					(5 @ addMethodButtonTarget extent y / 2)).
	searchButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #searchButton)
				relocate:
					(5 @ searchButtonTarget extent y / 2)).
	addClassButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #addClassButton)
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
('methods' asRopedText glamorousExplanationFor: #methodTab), ' the ' asRopedText,
('class comment' asRopedText glamorousExplanationFor: #commentTab),
' or a list of ' asRopedText,
('references' asRopedText glamorousExplanationFor: #referencesTab),
'. Coder also gives provides the possibility to ' asRopedText,
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
	<gtSlide>
	^ aSlide slideshow
		priority: 18;
		textWithFormat: 'Want to learn more about the Coder? Follow the show below' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtCoderSlideshow new ] withTitle: 'Coder Slideshow'.
]

{ #category : #'api - instantiation' }
GtTour >> coderWithComment [
	<gtExample>
	| aScripter |
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Initial Coder'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ (GtCoder forClass: GtCSPicture) createInPager maximized ] ].
	aScripter
		substep: 'Evaluate first snippet and inspect'
		do: [ :aStep | 
			aStep click
				label: 'Click on evaluate and inspect button';
				onBreadthFirstChildOfClass: GtBehaviorCoderElement;
				onBreadthFirstChildOfClass: BrTabGroup;
				onChildNamed: #header;
				onChildAt: 1;
				onChildAt: 1;
				onChildAt: 2.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ aScripter elementWithoutParent
]

{ #category : #accessing }
GtTour >> composedQueryExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 21;
		element: [ (GtPlaygroundLiveSlide new
			snippets: {'#gtView gtPragmas & #list gtReferences'})
			create ];
		newFadedText: 'Now, try with this composed query. Notice the highlighting'.
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

{ #category : #accessing }
GtTour >> feenkNameSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 1.1;
		element: [| container form |
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

{ #category : #accessing }
GtTour >> graphicalStackFirstExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 33;
		element: [ self visualizationElement ];
		newFadedText: 'Visualization is supported directly by the graphical stack.'.
]

{ #category : #accessing }
GtTour >> graphicalStackIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 32;
		newText: 'The graphical stack is worth taking a look at as well. It features the property that it renders everything in a single tree.'.
]

{ #category : #accessing }
GtTour >> graphicalStackSecondExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 35;
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
			look: BrShadowLook;
			margin: (BlInsets right: 5);
			addChild: (GtPager 
				createWrappedOn: (GtExplainerExamples>>#inspectorContainerElement) gtExampleValue) maximized ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtTour >> inspectorViewsSlideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 13;
		text: ('Want to learn more about inspector views? Follow the show below.');
		slideshow: [ GtLiveShow createWithArrowsVisible: GtInspectorViews new ] withTitle: 'Inspector views'.
]

{ #category : #accessing }
GtTour >> jsParserExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 31;
		element: [ GtPager createWrappedOn: (GtBehaviorCoder forClass: JSParser) ];
		newFadedText: 'The first non-Pharo language we accommodated is the language with which we write parsers for other languages.'.
]

{ #category : #accessing }
GtTour >> liveDocumentExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 28;
		element: [ (GtDocumenter forClass: GtCSPicture) 
			margin: (BlInsets all: 10);
			background: Color white;
			look: BrShadowLook];
		newFadedText: 'This is a live document intertwining text, code and graphics.';
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
	^ aSlide title
		priority: 16;
		titleWithFormat:
			('moldable coding' asRopedText
				fontSize: 50;
				glamorousRegularFont).
]

{ #category : #accessing }
GtTour >> moldableSearchTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 23;
		titleWithFormat:
			('moldable search' asRopedText
				fontSize: 50;
				glamorousRegularFont).
]

{ #category : #accessing }
GtTour >> multipleViewsForOneObjectExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		element: [ GtMultipleViewsForOneObjectLiveSlide new grid asElement ];
		newText: 'Moldable development starts from the idea that everything about software, including code, is data. And data is shapeless, yet we, humans, need a concrete shape to reason about it. The environment provides this shape, and this is why the environment is essential.';
		newText: 'To reason about data, we need to view it through a lens that is specific to the question we have. And when we do not have an appropriate view, we should be able to create it inexpensively. This applies for everything in software starting from the tiniest objects.';
		newText: 'For example, take a look to the right at a few views on an the same object holding a piece of text. Every view is relevant from a certain perspective and the environment must accommodate all of them.';
		elementWeight: 0.5.
]

{ #category : #accessing }
GtTour >> oneRenderingTreeSlideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 34;
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
	container addChild: ((GtDocumenter forClass: BaselineOfGToolkit)
			constraintsDo: [ :c | 
				c frame horizontal alignLeft. 
				c frame vertical alignCenter.
				c horizontal exact: 600.
				c vertical exact: 700 ];
			margin: (BlInsets all: 10); 
			background: Color white; 
			look: BrShadowLook).

	container addChild: ((GtPlotterScaleBasedElementExamples new plot) asScalableElement
			constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignBottom.
				c horizontal exact: 600.
				c vertical exact: 400 ];
			margin: (BlInsets top: 10 left: 10 bottom: 20 right: 200); background: (Color white); look: BrShadowLook).

	container addChild: ((GtBehaviorCoder forClass: BaselineOfGToolkit) asElement
			constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignTop.
				c vertical exact: 500.
				c horizontal exact: 500 ];
			margin: (BlInsets top: 100 left: 10 bottom: 10 right: 10); background: (Color white); look: BrShadowLook).
	
	^ container asScalableElement 
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

{ #category : #'as yet unclassified' }
GtTour >> playgroundExplanationWithLinks [
	<gtExample>
	| container snippetsCollection playbook playgroundElement snippetElementsCollection inspectAllButton frameToolbarButtons evaluateButtons inspectButtons debugButtons newSnippetButtons |
	
	container := BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		background: Color white;
		look: BrShadowLook.
		
	newSnippetButtons := OrderedCollection new.
	evaluateButtons := OrderedCollection new.
	inspectButtons := OrderedCollection new.
	debugButtons := OrderedCollection new.
	
	snippetsCollection := { 'a := 5'.
'a + 2' } asOrderedCollection.

	playbook := GtPlayBook newWithCodeSnippetContent: snippetsCollection first.
	snippetsCollection allButFirst do: [:el |
		playbook pages first addSnippet: GtCoderSnippet new.
		playbook pages last snippets last sourceCode: el].
	playgroundElement := playbook asElement.
	
	playgroundElement forceLayout.
	
	snippetElementsCollection := playgroundElement
		allChildrenBreadthFirstSelect: [ :aChild | 
			aChild isKindOf: BrFrame ].
	snippetElementsCollection do: [ :each |
		newSnippetButtons add: (each children at: 2) ].
	inspectAllButton := (playgroundElement
		allChildrenBreadthFirstSelect: [:aChild | 
			(aChild isKindOf: BrButton) and: [aChild parent isKindOf: BrToolbar]]) at: 2.
	frameToolbarButtons := playgroundElement
		allChildrenBreadthFirstSelect: [:aChild | 
			(aChild isKindOf: BrToolbar) 
				and: [(aChild parent isKindOf: GtCoderActionsElement)
					and: [aChild hasChildren]]].
	frameToolbarButtons do: [ :each |
		evaluateButtons add: (each children at: 1).
		inspectButtons add: (each children at: 2).
		debugButtons add: (each children at: 3) ].
	
	inspectAllButton
		addChild:
			((self yellowTargetCircleWithExplanationModel: #inspectAllButton)
				relocate:
					(2 @ 2)).
	snippetElementsCollection do: [ :eachSnippet |
		eachSnippet
			addChild:
				((self yellowTargetCircleWithExplanationModel: #snippets)
					relocate:
						(5 @ eachSnippet extent y / 2))].
	newSnippetButtons do: [ :each |
		each
			addChild:
				((self yellowTargetCircleWithExplanationModel: #plusButton)
					relocate:
						(10 @ each extent y / 2))].
	evaluateButtons do: [ :eachEvaluateButton |
		eachEvaluateButton parent
			addChild:
				((self yellowTargetCircleWithExplanationModel: #evaluateButton)
					relocate:
						(eachEvaluateButton position x @ eachEvaluateButton position y + 5))].
	inspectButtons do: [ :eachInspectButton |
		eachInspectButton parent
			addChild:
				((self yellowTargetCircleWithExplanationModel: #inspectButton)
					relocate:
						(eachInspectButton position x @ eachInspectButton position y + 5))].
	debugButtons do: [ :eachDebugButton |
		eachDebugButton parent
			addChild:
				((self yellowTargetCircleWithExplanationModel: #debugButton)
					relocate:
						(eachDebugButton position x @ eachDebugButton position y + 5))].
				
	^ container
		addChild: (GtPager createWrappedOn: playgroundElement).
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
	<gtSlide>
	^ aSlide slideshow
		priority: 15;
		textWithFormat: 'Want to learn more about the Playground? Follow the show below' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtPlaygroundAndInspectorSlideshow new ] withTitle: 'Playground Slideshow'.
]

{ #category : #accessing }
GtTour >> queryExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 20;
		element: [ (GtPlaygroundLiveSlide new snippets: {'#gtView gtPragmas'}) create ];
		newFadedText: 'Inspect the result of this query. Expand the methods'.
]

{ #category : #accessing }
GtTour >> querySlideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 22;
		textWithFormat: ('To learn more about queries follow the show below.' asRopedText glamorousRegularFont);
		slideshow: [ GtLiveShow createWithArrowsVisible: GtQueries new ] withTitle: 'Querying Code'.
]

{ #category : #accessing }
GtTour >> queryTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 19;
		titleWithFormat:
			('querying' asRopedText
				fontSize: 50;
				glamorousRegularFont)
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
GtTour >> spotterExampleSlideFor: aSlide [
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
	<gtSlide>
	^ aSlide slideshow
		priority: 26;
		textWithFormat: 'Want to learn more about the Spotter? Follow the show below' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtSpotterSlideshow new ] withTitle: 'Spotter Slideshow'.
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
			(Date year: 2020 month: 07 day: 23) -> 'gt v0.7.1214 beta'
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
		newText: 'Glamorous Toolkit is the moldable development environment.';
		newText: 'It is a live notebook. It is a flexible search interface. It is a fancy code editor. It is a software analysis platform. It is a data visualization engine. All in one. It is built in Pharo and it is free and open-source under an MIT license.';
		newText: 'What is moldable development? A new paradigm that promotes the idea that developers should explain their systems through the lens of custom tools that they create while developing the system.';
		newText: 'But, let''s take it step by step.'.
]

{ #category : #accessing }
GtTour >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('glamoroustoolkit' asRopedText 
			fontSize: 80;
			glamorousRegularFont;
			thin; 
			in: [:t | (t from: 'glamorous' size + 1 to: t size) bold]; yourself);
		subtitleWithFormat: ('a tour' asRopedText 
			fontSize: 50;
			glamorousRegularFont;
			bold).
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
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 10).
	
	coderExplanationLabel := BrLabel new
		text: ('Contacts with details view method' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		look: BrGlamorousLabelLook new.
	inspectorExplanationLabel := BrLabel new
		text: ('Contacts with details view result' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		look: BrGlamorousLabelLook new.
	
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
				look: BrShadowLook;
				background: Color white;
				margin: (BlInsets all: 20));
			addChild: (GtMondrianDomainExamples new structureOfAnElement asElement
				look: BrShadowLook;
				background: Color white;
				margin: (BlInsets all: 20));
			addChild: (GtPlotterHorizontalBarChartExamples new brickDependenciesSizesBarChart asElement
				look: BrShadowLook;
				background: Color white;
				margin: (BlInsets all: 20);
				constraintsDo: [:c |
					c grid horizontal span: 2
				])
]

{ #category : #utility }
GtTour >> yellowTargetCircleWithExplanationModel: aModel [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: aModel).
]
