"
An attempt to unify the various ways to draw UML diagrams from numerous random examples.
Used in NavigatingClassesAndMethods.
"
Class {
	#name : #UmlClassDiagram,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Mondrian'
}

{ #category : #accessing }
UmlClassDiagram >> associationArrowStencil [
	^ [ :c | 
	BlParabollaArcElement new
		zIndex: -1;
		curvatureFraction: 0.2;
		border: (BlBorder paint: self associationColor);
		toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: self associationColor)) ]
]

{ #category : #accessing }
UmlClassDiagram >> associationArrowStencilWithLabel: labelText [
	^ [ :class | 
	| line |
	line := BlParabollaArcElement new
			zIndex: 0;
			curvatureFraction: 0.2;
			border: (BlBorder paint: self associationColor).

	labelText notNil
		ifTrue: [ line
				clipChildren: false;
				addChild: (BrLabel new
						text: labelText;
						zIndex: 0;
						background: Color white;
						aptitude: (BrGlamorousLabelAptitude new fontSize: self labelFontSize);
						margin: (BlInsets top: 10);
						constraintsDo: [ :c | 
							c ignored vertical alignCenterAt: 0.3.
							c ignored horizontal alignCenter.
							c ignoreByLayout ]) ].

	line := line
			toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: self associationColor)).


	line ]
]

{ #category : #accessing }
UmlClassDiagram >> associationColor [
	^ Color orange alpha: 0.4
]

{ #category : #accessing }
UmlClassDiagram >> classHierarchyFor: classes [
	"This is a simpler visualization than the umlClasses one, with just class names.
	From GtMondrianDomainExamples"

	| m |
	m := GtMondrian new.
	m nodes
		stencil: self classStencil;
		with: classes.
	m edges
		stencil: self inheritanceArrowStencil;
		connectFrom: #superclass.
	m layout tree levelDistance: 20.
	^ m
]

{ #category : #accessing }
UmlClassDiagram >> classHierarchyFor: classes withAssociations: associations [
	"NB: When using this, you will need to fix the layout, for example,
	by manually repositioning the nodes, saving the positions:
		(self root children collect: #position) storeString
	and explicitly overriding them. 
	See: 
		UmlClassDiagramExamples>>#navigatingClassesAndMethods"

	<gtExample>
	| m |
	m := self classHierarchyFor: classes.

	associations
		do: [ :assoc | 
			assoc value
				do: [ :target | 
					m edges
						stencil: self associationArrowStencil;
						connectFrom: [ :each | assoc key ] to: [ :each | target ] ] ].

	^ m
]

{ #category : #accessing }
UmlClassDiagram >> classHierarchyFor: classes withAssociations: associations andRoots: roots [
	"See the comment for #classHierarchyFor:withAssociations: concerning positions."

	<gtExample>
	| m |
	m := self classHierarchyFor: classes.

	m nodes
		stencil: self rootClassStencil;
		with: roots.

	associations
		do: [ :assoc | 
			assoc value
				do: [ :target | 
					m edges
						stencil: self associationArrowStencil;
						connectFrom: [ :each | assoc key ] to: [ :each | target ] ] ].

	^ m
]

{ #category : #accessing }
UmlClassDiagram >> classHierarchyFor: classes withAssociationsAndLabels: associationsWithLabels [
	"Each association should look like:
		CompiledMethod -> { 
			{ 'methodClass' . Behavior } .
			{ 'ast' . RBMethodNode } }
	"

	<gtExample>
	| m |
	m := self classHierarchyFor: classes.

	associationsWithLabels
		do: [ :assoc | 
			assoc value
				do: [ :labelClassPair | 
					m edges
						stencil: (self associationArrowStencilWithLabel: labelClassPair first);
						connectFrom: [ :each | assoc key ] to: [ :each | labelClassPair second ] ] ].

	^ m
]

{ #category : #accessing }
UmlClassDiagram >> classStencil [
	^ [ :class | 
	BrLabel new
		border: (BlBorder paint: Color lightGray);
		text: class name;
		aptitude: BrGlamorousLabelAptitude new
				+ (BrStyleCommonAptitude new
						hovered: [ :aStyle | aStyle background: (Color blue alpha: 0.2) ]);
		when: BlClickEvent
			do: [ :e | 
				e target phlow spawnTool: (GtClassCoderTool forClass: class).
				e consumed: true ];
		padding: (BlInsets all: 5) ]
]

{ #category : #accessing }
UmlClassDiagram >> inheritanceArrowStencil [
	^ [ :c | 
	BlLineElement new
		border: (BlBorder paint: Color gray);
		fromHead: (BlArrowheadTriangle new
				scale: 4;
				border: (BlBorder paint: Color gray)) ]
]

{ #category : #accessing }
UmlClassDiagram >> labelFontSize [
	^ 12
]

{ #category : #accessing }
UmlClassDiagram >> rootClassStencil [
	"Just a small circle."

	^ [ :c | 
	BlElement new
		geometry: BlCircleGeometry new;
		border: (BlBorder paint: Color black);
		background: Color white;
		size: 5 @ 5;
		aptitude: (BrGlamorousWithExplicitTooltipAptitude text: [ c name ]);
		when: BlClickEvent
			do: [ :e | 
				e consumed: true.
				e target phlow spawnTool: (GtClassCoderTool forClass: c) ] ]
]
