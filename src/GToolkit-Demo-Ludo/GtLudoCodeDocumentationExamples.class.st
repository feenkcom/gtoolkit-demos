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
	self
		paintClassHierarchyWith: mondrian
		forClasses: GtLudoGame package classes
		andRoots:
			{BlElement.
				Announcement}.
	^ mondrian
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> classLabeledReferencesAllClasses [
	<gtExample>
	| mondrian |
	mondrian := GtMondrian new.
	self paintClassLabeledDependenciesWith: mondrian forClasses: GtLudoRecordingGame package classes andRoots: {BlElement. Announcement}.
	^ mondrian
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
GtLudoCodeDocumentationExamples >> modelClassCircleLabeledReferences [
	"Circle layout is not ideal, but is readable."
	<gtExample>
	
	| mondrian  |
	mondrian := GtMondrian new.

	self
		paintClassLabeledDependenciesWith: mondrian
		forClasses: self modelClasses
		andRoots: {}.
	mondrian layout circle.
	^ mondrian
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> modelClassExplicitLabeledReferences [
	"Use hand-tweaked positions."

	<gtExample>
	
	| mondrian |
	mondrian := GtMondrian new.
	self
		paintClassLabeledDependenciesWith: mondrian
		forClasses: self modelClasses
		andRoots: {}.
	mondrian layout custom: BlBasicLayout new.
	mondrian root children withIndexDo: [ :child :n | child relocate: (self modelClassPositions at: n) ].
	^ mondrian
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> modelClassForcedLabeledReferences [
	"Using a forced layout. Does not look good."

	<gtExample>
	
	| mondrian |
	mondrian := GtMondrian new.
	self
		paintClassLabeledDependenciesWith: mondrian
		forClasses: self modelClasses
		andRoots: {}.
	mondrian layout force
		nbIterations: 200;
		charge: -500;
		strength: 0;
		length: 300.
	^ mondrian
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> modelClassHierarchy [
	<gtExample>
	
	| mondrian |
	mondrian := GtMondrian new.
	self
		paintClassHierarchyWith: mondrian
		forClasses: self modelClasses
		andRoots: {}.
	^ mondrian
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> modelClassPositions [
	"Recorded positions from a handtweaked graph:
	(mondrian root children collect: #position) storeString
	"

	^ (Array new: 23)
		at: 1 put: 428.25 @ 440.40216064453125;
		at: 2 put: 342.25 @ 282.40216064453125;
		at: 3 put: 212.25 @ 271.40216064453125;
		at: 4 put: 275.25 @ 466.40216064453125;
		at: 5 put: 395.25 @ 275.40216064453125;
		at: 6 put: 371.25 @ 347.40216064453125;
		at: 7 put: 173.25 @ 373.40216064453125;
		at: 8 put: 337.25 @ 405.40216064453125;
		at: 9 put: 452.25 @ 349.40216064453125;
		at: 10 put: 429.25 @ 515.4021606445313;
		at: 11 put: 481.4218551090786 @ 375.40216064453125;
		at: 12 put: 412.9895965920554 @ 304.40216064453125;
		at: 13 put: 241.07468297848334 @ 296.40216064453125;
		at: 14 put: 459.3429988861084 @ 304.40216064453125;
		at: 15 put: 269.64599990844727 @ 275.636538385994;
		at: 16 put: 252.97752039019034 @ 296.40216064453125;
		at: 17 put: 266.8829357929719 @ 296.40216064453125;
		at: 18 put: 328.36999893188477 @ 479.6981032171214;
		at: 19 put: 251.53184835203405 @ 402.40216064453125;
		at: 20 put: 328.36999893188477 @ 448.0508989912264;
		at: 21 put: 434.31399917602533 @ 358.567892616377;
		at: 22 put: 251.53184835203405 @ 402.40216064453125;
		at: 23 put: 398.73273805986366 @ 375.40216064453125;
		yourself
]

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> modelClasses [
	^ (GtLudoGame package classes select: [ :c | c category endsWith: 'Model' ]) asOrderedCollection
	sort: [ :a :b | a name <= b name ]
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
GtLudoCodeDocumentationExamples >> paintClassHierarchyWith: mondrian forClasses: classes andRoots: roots [

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
		with: roots.
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

{ #category : #accessing }
GtLudoCodeDocumentationExamples >> paintClassLabeledDependenciesWith: m forClasses: classes andRoots: roots [
	"
	Eg classes = GtLudoRecordingGame package classes
	roots = {BlElement. Announcement}
	NB: the caller must set the layout.
	"

	m nodes
		stencil:
				[ :class | 
					GtMondrianUMLClassElement new
						label:
								((class name removePrefix: 'GtLudo') asRopedText
										glamorousRegularFont;
										fontSize: 18;
										bold);
						when: BlClickEvent
							do:
								[ :e | 
									e consumed: true.
									e target phlow spawnTool: (GtClassCoderTool forClass: class) ] ];
		with: classes.
	m nodes
		stencil:
				[ :c | 
					BlElement new
						geometry: BlCircleGeometry new;
						border: (BlBorder paint: Color black);
						background: Color white;
						size: 5 @ 5;
						aptitude: (BrGlamorousWithLabelTooltipAptitude new text: [ c name ]);
						when: BlClickEvent
							do:
								[ :e | 
									e consumed: true.
									e target phlow spawnTool: (GtClassCoderTool forClass: c) ] ];
		with: roots.
	m edges
		stencil:
				[ :class | 
					BlLineElement new
						border: (BlBorder paint: (Color black alpha: 0.4));
						fromHead:
								(BlArrowheadTriangle new
										scale: 5;
										border: (BlBorder paint: (Color black alpha: 0.4))) ];
		connectFrom: [ :c | c superclass ].
	m edges
		stencil:
				[ :c | 
					BlParabollaArcElement new
						zIndex: -1;
						curvatureFraction: 0.2;
						border: (BlBorder paint: (Color orange alpha: 0.4));
						toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: (Color orange alpha: 0.4))) ];
		connectToAll: [ :c | (c methods flatCollectAsSet: #gtReferencedClasses) \ {c} ]
]
