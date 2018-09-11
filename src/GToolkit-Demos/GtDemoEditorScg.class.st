Class {
	#name : #GtDemoEditorScg,
	#superclass : #Object,
	#category : 'GToolkit-Demos'
}

{ #category : #'private - model and ui' }
GtDemoEditorScg class >> announceFrom: aModelElement to: aUiElement in: aContainer [
	| uiModel announceUpdate |
	
	uiModel := BlParabollaArcElement new
		curvatureFraction: 0.3;
		border: (BlBorder paint: (Color gray alpha: 0.5) width: 2);
		fromAnchor: (BlElementRightTopAnchor element: aModelElement);
		toAnchor: (BlElementLeftTopAnchor element: aUiElement);
		toHead: (BlArrowheadSimpleArrow new
				arrowLengthFraction: 5;
				arrowNoseAngle: 60;
				border: (BlBorder builder paint: (Color gray alpha: 0.5); width: 2; build));
		constraintsDo: [ :c | c ignoreByLayout ].
	
	announceUpdate := BlTextElement text: ('announce update' asRopedText).
	announceUpdate transformDo: [ :t | t scaleBy: 0.35 ].
	announceUpdate constraintsDo: [ :c | c ignoreByLayout ].
	announceUpdate relocate: 38@(12 negated).

	aContainer addChild: announceUpdate.
	aContainer addChild: uiModel
]

{ #category : #'private - model and ui' }
GtDemoEditorScg class >> cointainer [
	| container |
	container := BlElement new.
	container clipChildren: false.
	container layout: (GtGraphHorizontalTreeLayout new horizontalGap: 50).
	^ container
]

{ #category : #'demo - connector' }
GtDemoEditorScg class >> connectorMethod [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(Smalltalk tools inspector openOn: (BlBezierExamples>>#quadraticCurveWithPerpendicularAnchor) gtExample)
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #'demo - documenter' }
GtDemoEditorScg class >> documenterEditor [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	(Smalltalk tools inspector openOn:'./pharo-local/iceberg/pharo-graphics/Brick/doc/editor/index.pillar' asFileReference)
		extent: self largeExtent * ((2.0/3.0) @ 1);
		position: self largePosition
]

{ #category : #'demo - editor details' }
GtDemoEditorScg class >> editorElements [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(Smalltalk tools inspector openOn: (GtMondrianDomainExamples new editorElements))
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #windows }
GtDemoEditorScg class >> largeExtent [
	^ 1250@750
]

{ #category : #windows }
GtDemoEditorScg class >> largePosition [
	^ 25@25
]

{ #category : #'private - model and ui' }
GtDemoEditorScg class >> link: uiElement to: modelElement [
	modelElement constraintsDo: [ :c |
		c graph addConnectedEdge: (GtGraphEdge new
			from: modelElement
			to: uiElement) ]
]

{ #category : #'world menu' }
GtDemoEditorScg class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'SCG - Moldable Editor')
		order: 0.0;
		target: self;
		iconName: #glamorousGo.
	
	(aBuilder item: #'0. Title')
		order: 0.1;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self title ].
	
	(aBuilder item: #'1. Transcript - api')
		order: 0.1;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptApi ].
		
	(aBuilder item: #'2. Transcript - intro')
		order: 0.2;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptIntro ].

	(aBuilder item: #'3. Transcript - animation')
		order: 0.3;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptAnimation ].

	(aBuilder item: #'4. Transcript - object shower')
		order: 0.4;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptObjectShower ].

	(aBuilder item: #'5. Connector - examples')
		order: 0.5;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self connectorMethod ].
	
	(aBuilder item: #'6. Rope tree')
		order: 0.6;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self ropeTree ].
	
	(aBuilder item: #'7. Mapping of elements')
		order: 0.7;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self editorElements ].
	
	(aBuilder item: #'8. Text - rotated')
		order: 0.8;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self rotatedText ].
		
	(aBuilder item: #'9. Text - 10`000`000')
		order: 0.9;
		iconName: #catalogIcon; 
		parent: 'SCG - Moldable Editor';
		action: [ self text10k ].
	
	(aBuilder item: #'10. Documenter - editor')
		order: 1.0;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self documenterEditor ].
	
	(aBuilder item: #'Reset')
		order: 3.0;
		iconName: #catalogIcon; 
		parent: #'SCG - Moldable Editor';
		action: [ self reset ].
]

{ #category : #'private - model and ui' }
GtDemoEditorScg class >> model [
	^ (BlTextElement text: 'Model' asRopedText)
		padding: (BlInsets left: 10 right: 10)
]

{ #category : #'demo - editor details' }
GtDemoEditorScg class >> oneModelTwoEditors [
	BlUniverse reset.
	World closeAllWindowsDiscardingChanges.
	
	BrTextEditorExamples exampleOneEditorTwoElements
]

{ #category : #'private - model and ui' }
GtDemoEditorScg class >> requestFrom: aUiElement to: aModelElement in: aContainer [
	| uiModel requestChange |

	uiModel := BlParabollaArcElement new
		curvatureFraction: 0.3;
		border: (BlBorder paint: (Color gray alpha: 0.5) width: 2);
		fromAnchor: (BlElementLeftBottomAnchor element: aUiElement);
		toAnchor: (BlElementRightBottomAnchor element: aModelElement);
		toHead: (BlArrowheadSimpleArrow new
				arrowLengthFraction: 5;
				arrowNoseAngle: 60;
				border: (BlBorder builder paint: (Color gray alpha: 0.5); width: 2; build));
		constraintsDo: [ :c | c ignoreByLayout ].
	
	requestChange := BlTextElement text: ('request change' asRopedText).
	requestChange transformDo: [ :t | t scaleBy: 0.35 ].
	requestChange constraintsDo: [ :c | c ignoreByLayout ].
	requestChange relocate: 45@32.

	aContainer addChild: requestChange.
	aContainer addChild: uiModel
]

{ #category : #'world menu' }
GtDemoEditorScg class >> reset [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	BrTextEditorAttributedLineSegmentHolder cleanUp.
	BrTextEditor cleanUp
]

{ #category : #'demo - editor details' }
GtDemoEditorScg class >> ropeTree [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: GtDemoPlayPage ropeTree)
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #'demo - editor details' }
GtDemoEditorScg class >> rotatedText [
	| editor |
	
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	editor := BrTextEditorExamples new elementOnMethodWithSyntaxHighlighting.

	editor editor styler
		addEventHandlerOn: BrTextStyledEvent
		do: [ [ 0.2 seconds wait. editor childrenDo: [ :aSegment |
			aSegment clipChildren: false.		
			aSegment childrenDo: [ :aWord |
				aWord transformDo: [ :t |
					t rotateBy: 10 negated ] ] ] ] fork ].
	
	(Smalltalk tools inspector openOn: editor)
		extent: self largeExtent * ((2.0/3.0) @ 1);
		position: self largePosition
]

{ #category : #windows }
GtDemoEditorScg class >> smallExtent [
	^ 400@600
]

{ #category : #windows }
GtDemoEditorScg class >> smallPosition [
	^ 100@100
]

{ #category : #'demo - editor details' }
GtDemoEditorScg class >> text10k [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	(BrTextEditorExamples class>>#loremIpsum) browse
]

{ #category : #demo }
GtDemoEditorScg class >> title [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: GtDemoPlayPage moldableEditorTitle)
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #'demo - transcript' }
GtDemoEditorScg class >> transcriptAnimation [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: GtDemoPlayPage transcriptAnimation)
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #'demo - transcript' }
GtDemoEditorScg class >> transcriptApi [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: GtDemoPlayPage transcriptApi)
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #'demo - transcript' }
GtDemoEditorScg class >> transcriptIntro [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: GtDemoPlayPage transcriptIntro)
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #'demo - transcript' }
GtDemoEditorScg class >> transcriptObjectShower [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(Smalltalk tools inspector openOn: (GtTranscriptExamples new objectShower))
		extent: self smallExtent;
		position: self smallPosition
]

{ #category : #'private - model and ui' }
GtDemoEditorScg class >> ui [
	^ (BlTextElement text: 'UI' asRopedText)
		padding: (BlInsets left: 10 right: 10)
]

{ #category : #'demo - editor details' }
GtDemoEditorScg class >> uiModel [
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: GtDemoPlayPage uiModel)
		extent: self largeExtent;
		position: self largePosition
]

{ #category : #'private - model and ui' }
GtDemoEditorScg class >> view [
	^ BlScalableElement new
		clipChildren: false;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]
]
