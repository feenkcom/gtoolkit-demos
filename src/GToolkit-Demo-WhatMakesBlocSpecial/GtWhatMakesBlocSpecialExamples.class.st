"
!What makes Bloc special 

The Glamorous Toolkit is based on the ${class:BaselineOfSparta}$ / ${class:BaselineOfBloc}$ /${class:BaselineOfBrick}$ graphical stack. This stack has a few properties that make it distinct:
- it relies on one rendering tree at all times.
- it features moldable and scalable text editor is made out of regular elements. 
- graph layouts are regular layouts. The implication here is that any element can be part of a graph-based visualization.
- debuggable. There are a significant amount of tools and mechanisms that are built for this.

Let us take them one by one by means of examples.

!!One rendering tree

@@todo


!!Moldable editor made of regular elements

The editor is made out of regular elements. This means that we can mix text with graphics in live editors. 

To get an idea of what this means, take a look at the example below. On top we have an editor. At the bottom we have a visualization of the tree of elements out of which the editor element is formed. You can observe how the leafs are word elements and th red square sits right next to them.

${example:GtWhatMakesBlocSpecialExamples>>#editorWithPreview|expandedPreview|noCode=|previewHeight=500|show=#gtLiveFor:}$

This ability is what allows the current document to display results live in the same editor, such as the example above. In this case, the preview is actually added by the syntax highlighter that interprets the ==${example:...}$== command.

!!Graph layouts

The graph layouts in Bloc are expressed in the same way as any other layout. This was a challenge in that graph layouts rely on a structure that includes nodes and edges. Specifically, the challenge was to build this logic without having ${class:BlElement}$ know about edges explicitly.

Every layout encapsulates an algorithm whose execution logic depends on the constraints specified for each individual element. And, to support graph layouts, each element defines the relevant edges as constraints.

Let's consider a concrete scenario. The example below shows all subclasses of ${class:GtGraphLayout}$ as label elements organized in a grid layout with two columns, where each of the elements is aligned to the center of the grid cell.s

${example:GtWhatMakesBlocSpecialExamples>>#layoutHierarchyWithFlowLayout|show=#gtLiveFor:}$
Note how the ==alignCenter== is specified as a constraint for each element.

Now, we take the same elements only this time we add edge constraints between each pair of labels corresponding to subperclass and subclass and specify a graph layout.

${example:GtWhatMakesBlocSpecialExamples>>#layoutHierarchyWithEdges|show=#gtLiveFor:}$
The scene is laid out as a horizontal tree. To see the concrete connections we can also add line elements:

${example:GtWhatMakesBlocSpecialExamples>>#layoutHierarchyWithEdgesAndLines|show=#gtLiveFor:}$

All in all, the graph layouts are treated in the same way as the other layouts. This allows us to use any elements in a graph visualization.


!!Debuggable and explainable

Bloc was developed following the moldable development philosophy: every time we had a problem, we built a tool to expose the probem first. As a result, Bloc has built in tools that explain many details of its inner working. Most of these are found as inspector extensions. Let's look at some.

We take as a base example the first element from the above scene. Inspecting the element produces an inspector with multiple views, each capturing an interesting aspect. Please take a moment to explore the different views.

${example:GtWhatMakesBlocSpecialExamples>>#firstChildOfLayoutHierarchyElementsWithEdges|}$

A simple view is the one that previews the metrics of the element:

${example:GtWhatMakesBlocSpecialExamples>>#firstChildOfLayoutHierarchyElementsWithEdges|show=#gtMetricsFor:|noCode|previewHeight=200}$

This is a view that is common in webbrowser inspectors. But, let's investigate a few more. 

Complicated scenes with deep nesting can pose problems when it comes to understanding how layouts work. For example, every layout needs to measure. The measurement view shows the order of which layouts associated with which elements have measured the current element. In our case, we have 4 such measurements, the last one being from our text element, while the other ones come from the parent elements.

${example:GtWhatMakesBlocSpecialExamples>>#firstChildOfLayoutHierarchyElementsWithEdges|show=#gtMeasurementChainFor:|noCode=}$

Similarly, the resizers view shows how the current and parent elements specify the resizing strategies. In our case, the text element has ==fitContent== while all parents have ==matchParent==. This is highly useful when reasoning about why an element might not appear properly in a scene.

${example:GtWhatMakesBlocSpecialExamples>>#firstChildOfLayoutHierarchyElementsWithEdges|show=#gtResizersFor:|noCode=}$




These are but a few interesting tools that are built in.s

"
Class {
	#name : #GtWhatMakesBlocSpecialExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WhatMakesBlocSpecial'
}

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> editorOnSampleText [
	<gtExample>
	"self new editorOnSampleText"
	| text editor element |
	text := self sampleText.
	editor := BrTextEditor new.
	editor text: text readonly.
	element := BrEditorElement new.
	element editor: editor.
	element size: 300@100.
	^ element
]

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> editorWithPreview [
	<gtExample>
	"self new editorWithPreview"
	| root element elementsMondrian block |
	elementsMondrian := BlElement new.
	element := self editorOnSampleText.
	block := [
		| view |
		view := GtMondrian new.
		element paintEditorElementsWith: view.
		elementsMondrian removeChildren.
		elementsMondrian addChild: view asPannableElement ].
	root := BlElement new.
	root constraintsDo: [ :c | 
		c vertical matchParent.
		c horizontal matchParent ].
	root layout: (BlGridLayout new cellSpacing: 20; columnCount: 1).
	element editor when: BrTextEditorCursorMovedEvent do: block.
	element editor when: BrTextEditorCursorAddedEvent do: block.
	element editor when: BrTextEditorCursorRemovedEvent do: block.
	element 
		background: Color white;
		effect: (BlDropShadowEffect color: Color lightGray width: 5 offset: 0@0);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c grid vertical weight: 0.5 ].
	root addChild: element.
	elementsMondrian 
		background: Color white;
		effect: (BlDropShadowEffect color: Color lightGray width: 5 offset: 0@0);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.].
	root addChild: elementsMondrian.
	element forceLayout.
	block value.
	^ root
]

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> firstChildOfLayoutHierarchyElementsWithEdges [
	<gtExample>
	"self new firstChildOfLayoutHierarchyElementsWithEdges"
	| root |
	root := self layoutHierarchyWithEdgesAndLines.
	^ root contentElement children first
]

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> layoutHierarchyWithEdges [
	<gtExample>
	| root |
	root := self rootWithLayoutHierarchyElements.
	GtGraphLayout withAllSubclassesDo: [ :class | 
		root children 
			detect: [ :label | label text asString = class name ]
			ifFound: [ :subclassLabel | 
				root children 
					detect: [ :label | label text asString = class superclass name ]
					ifFound: [ :superclassLabel |
						| edge |
						edge := GtGraphEdge new from: superclassLabel to: subclassLabel.
						superclassLabel constraints graph addConnectedEdge: edge.
						subclassLabel constraints graph addConnectedEdge: edge ] ] ].
	root layout: (GtGraphHorizontalTreeLayout new layered; verticalGap: 20).
	^ root asPannableElement
]

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> layoutHierarchyWithEdgesAndLines [
	<gtExample>
	| root |
	root := self layoutHierarchyWithEdges.
	root allChildrenBreadthFirstDo: [ :element | 
		element graph nodesAlongOutgoingEdges do: [ :child | 
			| line |
			line := BlLineElement new.
			line constraints ignoreByLayout.
			line
				border: (BlBorder paint: (Color gray alpha: 0.2) width: 5);
				fromAnchor: (BlElementCenterRightAnchor element: element);
				toAnchor: (BlElementCenterLeftAnchor element: child).
			root addChild: line ] ].
	^ root
]

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> layoutHierarchyWithFlowLayout [
	<gtExample>
	| root |
	root := self rootWithLayoutHierarchyElements.
	root layout: (BlGridLayout horizontal cellSpacing: 20; columnCount: 2).
	root children do: [ :child |
		child constraintsDo: [ :c | c grid horizontal alignCenter ] ].
	^ root asPannableElement
]

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> rootWithLayoutHierarchyElements [
	<gtExample>
	"self new rootWithLayoutHierarchyElements"
	| root |
	root := BlElement new constraintsDo: [:c | 
		c horizontal matchParent. 
		c vertical matchParent].
	GtGraphLayout withAllSubclassesDo: [ :class | 
		| label |
		label := BlTextElement new 
			text: class name asRopedText;
			background: Color white;
			margin: (BlInsets all: 5);
			padding: (BlInsets all: 10);
			effect: (BlDropShadowEffect color: (Color gray alpha: 0.5) width: 10 offset: 0@0).
		root addChild: label ].
	^ root
]

{ #category : #'as yet unclassified' }
GtWhatMakesBlocSpecialExamples >> sampleText [
	<gtExample>
	| text |
	text := 'The moldable editor' asRopedText.
	text insertString: String cr at: text size.
	text insertString: 'can embed graphical elements.' at: text size.
	text attributes: { BrFontSizeAttribute size: 14 }.
	text 
		attributes: { 
			BrFontGenericFamilyAttribute monospace. 
			BrTextForegroundAttribute paint: Color blue } 
		from: 5
		to: 12.
	text 
		attributes: { 
			BrTextAdornmentDynamicAttribute new 
				beAppend;
				stencil: [ 
					BlElement new 
						size: 70 @ 50; 
						margin: (BlInsets all: 5);
						background: Color red ] } 
		from: 39
		to: 39.
	^ text

]
