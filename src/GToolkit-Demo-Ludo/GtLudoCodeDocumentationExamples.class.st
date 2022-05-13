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
	^ mondrian
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
