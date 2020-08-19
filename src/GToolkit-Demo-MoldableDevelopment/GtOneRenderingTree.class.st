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
			titleText: ('One rendering tree' asRopedText fontSize: 70; glamorousRegularFont).

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
			element: [ GtExampleSlide new
				method: (GtWhatMakesBlocSpecialExplanation >> #classHierarchyWithGridLayout);
				asElement ];
			newFadedText: 'Let''s take a concrete example. Below we see a set of elements arranged in a grid.';
			newFadedText: 'Interestingly, the elements are centrally aligned in each column';
			newFadedText: 'This is achived by specifying a grid layout specific constraint for each of the children.'.
		GtLabelAndElementSlide new
			element: [ GtExampleSlide new
				method: (GtWhatMakesBlocSpecialExplanation >> #classHierarchyWithEdges);
				asElement ];
			newFadedText: 'And now we see the same elements, but laid out as a tree.';
			newFadedText: 'A tree layout requires the notion of an edge.';
			newFadedText: 'The edge is modelled as a regular constraint, like in the case of the grid layout.'.
		GtLabelAndElementSlide new
			element: [ GtExampleSlide new 
				method: (GtWhatMakesBlocSpecialExplanation >> #classHierarchyWithEdgesAndLines);
				asElement ];
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
		"GtLabelAndElementSlide new
				element: [ GtArrowHeadWithEmbeddedWorldSlide new asElement ];
				newFadedText: 'Double click to zoom. Drag.';
				newFadedText: 'Yes, there is a whole world embedded in the tip of the line.'."
		GtTitleSlide new
			titleText: ('a look behind the scene: the annotated tree' asRopedText fontSize: 30; glamorousRegularFont).
		GtLabelAndElementSlide new
				element: [ self liveElementTreeSlideForText  asElement];
				newFadedText: 'On the left we have an inspector showing an editor. On the right we see the corresponding single rendering tree.';
				newFadedText: 'Move with the mouse over the elements in the scene to see where in the tree they fit.'.

		GtLabelAndElementSlide new
				element: [ self liveElementTree asElement ];
				newFadedText: 'In this case, on the left we have an inspector showing a visualization.';
				newFadedText: 'The tree on the right reveals some nodes as labelled. In our case, the labels are phlow and graph. These are annotations that provide higher level extensions to navigate the tree. For example, given an element, we can ask it for element graph connectedEdges.'.
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
				border: (BlBorder paint: Color black width: 2) ];
		with: (1 to: 5).
	m edges
		fromCenterBottom;
		toCenterTop;
		stencil: [ BlSigmoidElement new beVertical border: (BlBorder paint: (Color black alpha: 0.2) width: 2)];
		connectFrom: [:x | x // 2].
	m layout tree levelDistance: 30; nodeDistance: 2.
	^ GtLiveElementTreeSlide new 
		targetElement: (BlUseAsyncFeatures disableDuring: [
			(m gtViewsFor: GtPhlowView empty) asElementDo: [:e | 
				e 
					addEventFilterOn: BlMouseOverEvent 
					do: [ :anEvent | 
						anEvent target effect: (BlOverlayAboveEffect new paint: (BrGlamorousColors textHighlightColor alpha: 0.4)) ];
					addEventFilterOn: BlMouseOutEvent 
					do: [ :anEvent | anEvent target effect: (BlNullEffect new) ] ]]) forceLayout.
]

{ #category : #'api - instantiation' }
GtOneRenderingTree >> liveElementTreeSlideForText [
	| editor |
	editor := BrEditor new 
		look: BrGlamorousEditorLook;
		text: GtWhatMakesBlocSpecialExplanation new sampleText.
	^ GtLiveElementTreeSlide new 
		targetElement: (BlUseAsyncFeatures disableDuring: [
			(editor gtViewsFor: GtPhlowView empty) asElementDo: [:e | 
				e 
					addEventFilterOn: BlMouseOverEvent 
					do: [ :anEvent | 
						anEvent target effect: (BlOverlayAboveEffect new paint: (BrGlamorousColors textHighlightColor alpha: 0.4)) ];
					addEventFilterOn: BlMouseOutEvent 
					do: [ :anEvent | anEvent target effect: (BlNullEffect new) ] ]]) forceLayout.
]

{ #category : #'api - instantiation' }
GtOneRenderingTree >> overviewElement [
	^ (GtMashExampleSlide new
		leftElementWithConstraints: ((GtDocumenter forClass: BaselineOfGToolkit)
			constraintsDo: [ :c |
			    c frame horizontal alignLeft. 
				c frame vertical alignCenter.
				c horizontal exact: 600.
				c vertical exact: 700 ]; 
			margin: (BlInsets all: 10);
			background: Color white; 
			look: BrShadowLook);
		centerElementWithConstraints:((GtPlotterScaleBasedElementExamples new plot) asScalableElement
			constraintsDo: [ :c |
				c frame horizontal alignRight. 
				c frame vertical alignBottom.
				c horizontal exact: 600.
				c vertical exact: 400 ];
			margin: (BlInsets top: 10 left: 10 bottom: 80 right: 100);
			background: (Color white);
			look: BrShadowLook);
		rightElementWithConstraints: ((BlDevKeyboard new)
			constraintsDo: [ :c |
				c frame horizontal alignRight. 
				c frame vertical alignTop.
				c horizontal exact: 754.
				c vertical exact: 230 ];
			margin: (BlInsets top: 100 left: 10 bottom: 10 right: 10);
			background: (Color white);
			look: BrShadowLook)) asElement.
]

{ #category : #'api - instantiation' }
GtOneRenderingTree >> sampleExplanationWithLinks [
	<gtExample>
	
	^ GtMethodCoderStylerExamples new viewsExplanationWithLinks
]
