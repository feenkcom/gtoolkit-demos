Class {
	#name : #GtLudoCodeDocumentationExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> classHierarchy [
	<gtExample>
	| mondrian |
	mondrian := GtMondrian new.
	self paintClassHierarchyWith:  mondrian.
	^ mondrian asElement zoomLevel: 3
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> classReferences [
	<gtExample>
	| mondrian |
	mondrian := GtMondrian new.
	self paintClassDependenciesWith:  mondrian.
	^ mondrian
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> paintClassDependenciesWith: m [

	m nodes
		stencil: [ :c | 
			BlElement new
				geometry: BlCircleGeometry new;
				background: Color black;
				size: 5 @ 5;
				aptitude: (BrGlamorousWithLabelTooltipAptitude new text: c name);
				when: BlClickEvent do: [ :e | 
					e consumed: true.
					e target phlow spawnTool: (GtClassCoderTool forClass: c) ] ];
		with: GtLudoRecordingGame package classes.
	m nodes
		stencil: [ :c | 
			BlElement new
				geometry: BlCircleGeometry new;
				border: (BlBorder paint: Color gray);
				background: Color white;
				size: 5 @ 5;
				aptitude:
					(BrGlamorousWithLabelTooltipAptitude new text: [ c name ]);
				when: BlClickEvent do: [ :e | 
					e consumed: true.
					e target phlow spawnTool: (GtClassCoderTool forClass: c) ] ];
		with: { 
				BlElement.
				Announcement }.
	m edges
		stencil: [ :c | 
			BlLineElement new
				zIndex: -1;
				border: (BlBorder paint: (Color gray alpha: 0.4));
				fromHead: (BlArrowheadTriangle new
						 scale: 2;
						 border: (BlBorder paint: (Color gray alpha: 0.4))) ];
		connectFrom: [ :c | c superclass ].
	m edges
		stencil: [ :c | 
			BlParabollaArcElement new
				zIndex: -1;
				curvatureFraction: 0.2;
				border: (BlBorder paint: (Color orange alpha: 0.4));
				toHead: (BlArrowheadSimpleArrow new border:
							 (BlBorder paint: (Color orange alpha: 0.4))) ];
		connectToAll: [ :c | 
		(c methods flatCollectAsSet: #gtReferencedClasses) \ { c } ].
	m layout force nbIterations: 100
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> paintClassHierarchyWith: mondrian [

	| classes |
	classes := GtLudoRecordingGame package classes.
	mondrian nodes
		stencil: [ :class | 
			GtMondrianUMLClassElement withDefaultContainer
				label: ((class name removePrefix: 'GtLudo') asRopedText
						 glamorousRegularFont;
						 fontSize: 20;
						 bold);
				when: BlClickEvent do: [ :e | 
				e consumed: true.
				e target phlow spawnTool: (GtClassCoderTool forClass: class) ] ];
		with: classes;
		forEach: [ :class | 
			mondrian nodes
				stencil: [ :method | 
					BrLabel new
						when: BlClickEvent do: [ :e | 
							e consumed: true.
							e target phlow spawnTool:
									(GtMethodCoderTool compiledMethod: method) ];
						text: method selector;
						aptitude: BrGlamorousLabelAptitude;
						addAptitude: (BrGlamorousWithTooltipAptitude content: [ 
									 BrLabel new
										 text: method selector;
										 aptitude: BrGlamorousLabelAptitude ]);
						padding: (BlInsets all: 2) ];
				with: (class methods sorted: [ :a :b | a selector < b selector ]).
			mondrian layout vertical ].
	mondrian nodes 
		stencil: [ :class | 
			GtMondrianUMLClassElement withDefaultContainer
				label: (class name asRopedText
						 glamorousRegularFont;
						 fontSize: 14;
						 foreground: Color gray;
						 bold);
				when: BlClickEvent do: [ :e | 
				e consumed: true.
				e target phlow spawnTool: (GtClassCoderTool forClass: class) ] ];
		with: {BlElement . Announcement }.
	mondrian edges
		stencil: [ :class | 
			BlLineElement new
				border: (BlBorder paint: (Color black alpha: 0.4));
				fromHead: (BlArrowheadTriangle new
						 scale: 10;
						 border: (BlBorder paint: (Color black alpha: 0.4))) ];
		connectFrom: #superclass.
	mondrian layout custom: (GtGraphTreeLayout new verticalGap: 100).
	mondrian
]
