"
1. What makes Bloc special 
The Glamorous Toolkit is based on the {{gtClass:BaselineOfSparta}} / {{gtClass:BaselineOfBloc}} /{{gtClass:BaselineOfBrick}} graphical stack. This stack has a few properties that make it distinct:
- it relies on one rendering tree at all times.
- it features a moldable and scalable text editor, made out of regular Bloc elements. 
- graph layouts are regular layouts. The implication here is that any element can be part of a graph-based visualization.
- debuggable. There are a significant amount of tools and mechanisms that are built for this.

Let us take them one by one by means of examples.
1. # One rendering tree

Everything you see in this window is rendered using one single rendering tree, all the way from the buttons, to the words in the text and to the visualization seen below. One single rendering tree. This offers the possibility to build flexible user interfaces and debug them using the same tools.
1. # Moldable editor made of regular elements

The editor is made out of regular elements. This means that we can mix text with graphics in live editors. 

To get an idea of what this means, take a look at the editor example below.

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#editorOnSampleText|noCode=|previewHeight=100|previewShow=#gtLiveFor:}}

Below we have a visualization of the tree of elements out of which the editor element is formed. You can observe how the leafs are word elements and the red square sits right next to them.

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#editorOnSampleText|noCode=|previewHeight=300|previewShow=#gtEditorElementsFor:}}

This ability is what allows the current document to display results live in the same editor, such as the example above. In this case, the preview is actually added by the syntax highlighter that interprets the `$ { example: ... } $` command.

Learn more details about the editor at {{gtClass:GtWhatIsTheMoldableEditorMadeOfExplanation}}
1. # Graph layouts

The graph layouts in Bloc are expressed in the same way as any other layout. This was a challenge in that graph layouts rely on a structure that includes nodes and edges. Specifically, the challenge was to build this logic without having {{gtClass:BlElement}} know about edges explicitly.

Every layout encapsulates an algorithm whose execution logic depends on the constraints specified for each individual element. And, to support graph layouts, each element defines the relevant edges as constraints.

Let's consider a concrete scenario. The example below shows all subclasses of {{gtClass:GtGraphLayout}} as label elements organized in a grid layout with two columns, where each of the elements is aligned to the center of the grid cell.

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#classHierarchyWithGridLayout|codeExpanded=false|previewExpanded=|previewShow=#gtLiveFor:}}

Note how the `alignCenter` is specified as a constraint for each element.

Now, we take the same elements only this time we add edge constraints between each pair of labels corresponding to a superclass and a subclass and specify a graph layout.

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#classHierarchyWithEdges|codeExpanded=false|previewExpanded=|previewShow=#gtLiveFor:}}

The scene is laid out as a horizontal tree. To see the concrete connections we can also add line elements:

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#classHierarchyWithEdgesAndLines|codeExpanded=false|previewExpanded=|previewShow=#gtLiveFor:}}

All in all, the graph layouts are treated in the same way as the other layouts. This allows us to use any elements in a graph visualization.
1. # Debuggable and explainable

Bloc was developed following the moldable development philosophy: every time we had a problem, we built a tool to expose the probem first. As a result, Bloc has built in tools that explain many details of its inner working. Most of these are found as inspector extensions. Let's look at some.

We take as a base example the first element from the above scene. Inspecting the element produces an inspector with multiple views, each capturing an interesting aspect. Please take a moment to explore the different views.

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#firstChildOfHierarchyElementsWithEdges|codeExpanded=false|previewExpanded|previewHeight=300}}

A simple view is the one that previews the metrics of the element:

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#firstChildOfHierarchyElementsWithEdges|previewShow=#gtMetricsFor:|noCode|previewHeight=180}}

This is a view that is common in webbrowser inspectors. But, let's investigate a few more. 

Complicated scenes with deep nesting can pose problems when it comes to understanding how layouts work. For example, every layout needs to measure. The measurement view shows the order of which layouts associated with which elements have measured the current element. In our case, we have 4 such measurements, the last one being from our text element, while the other ones come from the parent elements.

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#firstChildOfHierarchyElementsWithEdges|previewShow=#gtMeasurementChainFor:|noCode|previewHeight=150}}

Similarly, the resizers view shows how the current and parent elements specify the resizing strategies. In our case, the text element has `fitContent` while all parents have `matchParent`. This is highly useful when reasoning about why an element might not appear properly in a scene.

{{gtExample:GtWhatMakesBlocSpecialExplanation>>#firstChildOfHierarchyElementsWithEdges|previewShow=#gtResizersFor:|noCode|previewHeight=150}}

These are but a few interesting tools that are built in.


"
Class {
	#name : #GtWhatMakesBlocSpecialExplanation,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WhatMakesBlocSpecial'
}

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> classHierarchyWithEdges [
	<gtExample>
	| root |
	root := self rootWithHierarchyElements.
	ByteArray
		withAllSubclassesDo: [ :class | 
			root children
				detect: [ :label | label text asString sameContentAs: class name ]
				ifFound: [ :subclassLabel | 
					root children
						detect: [ :label | label text asString sameContentAs: class superclass name ]
						ifFound: [ :superclassLabel | 
							| edge |
							edge := GtGraphEdge new from: superclassLabel to: subclassLabel.
							superclassLabel constraints graph addConnectedEdge: edge.
							subclassLabel constraints graph addConnectedEdge: edge ] ] ].
	root
		layout: (GtGraphTreeLayout new
				verticalGap: 50;
				horizontalGap: 20).
	^ root asPannableElement
]

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> classHierarchyWithEdgesAndLines [
	<gtExample>
	| root |
	root := self classHierarchyWithEdges.
	root allChildrenBreadthFirstDo: [ :element | 
		element graph nodesAlongOutgoingEdges do: [ :child | 
			| line |
			line := BlLineElement new.
			line constraints ignoreByLayout.
			line
				zIndex: -1;
				border: (BlBorder paint: (Color gray alpha: 0.2) width: 1);
				fromAnchor: (BlElementBottomCenterAnchor element: element);
				toAnchor: (BlElementTopCenterAnchor element: child).
			root addChild: line ] ].
	^ root
]

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> classHierarchyWithGridLayout [
	<gtExample>
	| root |
	root := self rootWithHierarchyElements.
	root layout: (BlGridLayout horizontal cellSpacing: 20; columnCount: 2).
	root children do: [ :child |
		child constraintsDo: [ :c | c grid horizontal alignCenter ] ].
	^ root asPannableElement
]

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> editorOnSampleText [
	"GtInspector openOn: self new editorOnSampleText"
	<gtExample>
	
	^ BrEditor new
		aptitude: BrGlamorousEditorAptitude;
		fitContent;
		text: self sampleText
]

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> editorWithPreview [
	<gtExample>
	| element block elementsMondrian root |
	
	element := self editorOnSampleText.
	element 
		background: Color white;
		effect: (BlGaussianShadowEffect color: Color lightGray width: 3 offset: 0@0);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c grid vertical weight: 0.5 ].

	elementsMondrian := BlElement new.
	elementsMondrian 
		background: Color white;
		effect: (BlGaussianShadowEffect color: Color lightGray width: 3 offset: 0@0);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.].
	
	block := [
		| view |
		view := GtMondrian new.
		element paintEditorElementsWith: view.
		elementsMondrian removeChildren.
		elementsMondrian addChild: view asPannableElement ].
	
"	element when: GtLayoutDoneEvent do: [ element enqueueTask: (BlTaskAction new action: block) ]."
	
	root := BlElement new.
	root size: 500@500.
	root layout: (BlGridLayout new cellSpacing: 20; columnCount: 1).	
	root addChild: element.
	root addChild: elementsMondrian.
	
	^ root
]

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> firstChildOfHierarchyElementsWithEdges [
	<gtExample>
	"self new firstChildOfLayoutHierarchyElementsWithEdges"
	| root |
	root := self classHierarchyWithEdgesAndLines.
	^ root contentElement children first
]

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> rootWithHierarchyElements [
	<gtExample>
	"self new rootWithLayoutHierarchyElements"
	| root |
	root := BlElement new constraintsDo: [:c | 
		c horizontal fitContent. 
		c vertical fitContent];
		padding: (BlInsets all: 20).
		ByteArray withAllSubclassesDo: [ :class | 
		| label |
		label := BlTextElement new 
			text: class name asRopedText glamorousRegularFont;
			background: Color white;
			margin: (BlInsets all: 20);
			padding: (BlInsets all: 5);
			effect: (BlGaussianShadowEffect color: (Color gray alpha: 0.5) width: 5 offset: 0@0).
		root addChild: label ].
	^ root
]

{ #category : #examples }
GtWhatMakesBlocSpecialExplanation >> sampleText [
	<gtExample>
	| text |
	text := 'The moldable editor' asRopedText.
	text insertString: String cr at: text size.
	text insertString: 'can embed graphical elements.' at: text size.
	text glamorousRegularFont. 
	(text from: 5 to: 12)
		glamorousCodeFont;
		foreground: Color blue.

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
