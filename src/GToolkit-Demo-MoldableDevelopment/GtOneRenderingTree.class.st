Class {
	#name : #GtOneRenderingTree,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'api - instantiation' }
GtOneRenderingTree >> create [
	| show |
	show := GtSlideShow new.
	show slides: { 
		GtTitleSlide new
			titleText: ('one rendering tree' asRopedText fontSize: 70; glamorousRegularFont).

		GtTextAndElementSlide new
				element: [ self overviewElement ];
				elementWeight: 0.7;
				newText: 'The graphical stack supporting Glamorous Toolkit offers a core property: any graphical scene is rendered through exactly one single rendering tree.';
				newText: 'This very window contains multiple elements that all reside in one single rendering tree. This includes the words in the document, the lines in the graph, the dots in the chart or the labels from the visual keyboard on the right.'.

		GtTitleSlide new
			titleText: ('the text editor is made of plain elements' asRopedText fontSize: 30; glamorousRegularFont).
		GtEditorElementWithRotatedWords new.
		GtEditorElementWithTreeSlide new.	
"		GtEditorElementWithDebugCharacterSlide new."

		GtTitleSlide new
			titleText: ('visualizations can be combined with regular elements' asRopedText fontSize: 30; glamorousRegularFont).
		GtLabelAndElementSlide new
				element: [ GtSearchFilterHierarchySlide new asElement ];
				newFadedText: 'The visualization below shows an inheritance tree of classes. Now, unfold them, and you get method editors.';
				newFadedText: 'For this to work, we have to be able to apply graph layouts on arbitrary elements.'.		
		
		GtTitleSlide new
			titleText: ('graph layouts are regular layouts' asRopedText fontSize: 30; glamorousRegularFont).
		GtLabelAndElementSlide new
			element: [ GtBlocSpecialClassHierarchyWithGridSlide new asElement ];
			newFadedText: 'Let''s take a concrete example. Below we see a set of elements arranged in a grid.';
			newFadedText: 'Interestingly, the elements are centrally aligned in each column';
			newFadedText: 'This is achived by specifying a grid layout specific constraint for each of the children.'.
		GtLabelAndElementSlide new
			element: [ GtBlocSpecialClassHierarchyWithEdgesSlide new asElement ];
			newFadedText: 'And now we see the same elements, but laid out as a tree.';
			newFadedText: 'A tree layout requires the notion of an edge.';
			newFadedText: 'The edge is modelled as a regular constraint, like in the case of the grid layout.'.
		GtLabelAndElementSlide new
			element: [ GtBlocSpecialClassHierarchyWithEdgesAndLinesSlide new asElement ];
			newFadedText: 'Lines can also be added to the scene, but they are purely decorative graphical elements.'.

		GtTitleSlide new
			titleText: ('new kind of interfaces' asRopedText fontSize: 30; glamorousRegularFont).
		GtLabelAndElementSlide new
				element: [ GtConnectorForExampleSlide new asElement ];
				newFadedText: 'Below we see an editor on an example method. Click on the gray buttons in the code. Resize the panes. Click on the inspect icons.';
				newFadedText: 'For the scene to work, the lines must be in the same space as the text elements and the panes.'.

		GtLabelAndElementSlide new
				element: [ self sampleExplanationWithLinks ];
				newFadedText: 'Here we see a textual explanation that links with various constructs in the code that it explains.';
				newFadedText: 'For the scene to work, the arrows must be in the same space as the text elements and the code elements.'.
		
		GtLabelAndElementSlide new
				element: [ GtArrowHeadWithEmbeddedWorldSlide new asElement ];
				newFadedText: 'Double click to zoom. Drag.';
				newFadedText: 'Yes, there is a whole world embedded in the tip of the line.'.
		GtTitleSlide new
			titleText: ('a quick look behind the scene' asRopedText fontSize: 30; glamorousRegularFont).
		self liveElementTree
	}.
	^ show
]

{ #category : #'api - instantiation' }
GtOneRenderingTree >> liveElementTree [ 
	| m |
	m := GtMondrian new.
	m nodes
		stencil: [
			BlElement new 
				geometry: BlEllipse new; 
				border: (BlBorder paint: Color black width: 2);
				look: (BrInteractiveCommonLook new
					default: [:aWidget | aWidget background: Color white ];
					hovered: [:aWidget | aWidget background: BrGlamorousColors textHighlightColor]);
				viewModel: (BrInteractiveModel withAll: { BrHoverModel new })];
		with: (1 to: 5).
	m edges
		fromCenterBottom;
		toCenterTop;
		stencil: [ BlSigmoidElement new beVertical border: (BlBorder paint: (Color black alpha: 0.2) width: 2)];
		connectFrom: [:x | x // 2].
	m layout tree levelDistance: 30; nodeDistance: 10.
	^ GtLiveElementTreeSlide new 
		targetElement: (BlUseAsyncFeatures disableDuring: [
			(m gtViewsFor: GtPhlowView empty) asElementDo: [:e | e ]]) forceLayout.
]

{ #category : #'api - instantiation' }
GtOneRenderingTree >> overviewElement [
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
			margin: (BlInsets top: 10 left: 10 bottom: 80 right: 100); background: (Color white); look: BrShadowLook).

	container addChild: ((BlDevKeyboard new)
			constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignTop.
				c horizontal exact: 754.
				c vertical exact: 230 ];
			margin: (BlInsets top: 100 left: 10 bottom: 10 right: 10); background: (Color white); look: BrShadowLook).
	
	^ container asScalableElement 
]

{ #category : #'api - instantiation' }
GtOneRenderingTree >> sampleExplanationWithLinks [
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
		margin: (BlInsets all: 30);
		background: Color white;
		look: BrShadowLook;
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
GtOneRenderingTree >> viewsExplanationWithLinksText [
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
