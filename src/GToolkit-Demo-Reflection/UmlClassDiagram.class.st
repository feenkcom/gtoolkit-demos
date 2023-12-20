"
An attempt to unify the various ways to draw UML diagrams from numerous random examples.
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
		border: (BlBorder paint: (Color orange alpha: 0.4));
		toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: (Color orange alpha: 0.4))) ]
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
UmlClassDiagram >> classStencil [
	^ [ :class | 
	BrLabel new
		border: (BlBorder paint: Color lightGray);
		text: class name;
		aptitude: BrGlamorousLabelAptitude new
				+ (BrStyleCommonAptitude new
						hovered: [ :aStyle | aStyle background: (Color blue alpha: 0.5) ]);
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
UmlClassDiagram >> rootClassStencil [
	"Just a small circle."

	^ [ :c | 
	BlElement new
		geometry: BlCircleGeometry new;
		border: (BlBorder paint: Color black);
		background: Color white;
		size: 5 @ 5;
		aptitude: (BrGlamorousWithLabelTooltipAptitude new text: [ c name ]);
		when: BlClickEvent
			do: [ :e | 
				e consumed: true.
				e target phlow spawnTool: (GtClassCoderTool forClass: c) ] ]
]
