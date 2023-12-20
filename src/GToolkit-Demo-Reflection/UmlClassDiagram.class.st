"
An attempt to unify the various ways to draw UML diagrams from numerous random examples.
"
Class {
	#name : #UmlClassDiagram,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Mondrian'
}

{ #category : #accessing }
UmlClassDiagram >> classHierarchyFor: classes [
	"This is a simpler visualization than the umlClasses one, with just class names.
	From GtMondrianDomainExamples"

	| m |
	m := GtMondrian new.
	m nodes
		stencil: [ :c | 
			BrLabel new
				border: (BlBorder paint: Color lightGray);
				text: c name;
				aptitude: (BrGlamorousLabelAptitude new + (BrStyleCommonAptitude new hovered: [:aStyle | aStyle background: (Color blue alpha: 0.5) ]));
				when: BlClickEvent
					do: [ :e | e target phlow spawnTool: (GtClassCoderTool forClass: c). e consumed: true ];
				padding: (BlInsets all: 5) ];
		with: classes.
	m edges
		stencil: [ :c | 
			BlLineElement new
				border: (BlBorder paint: Color gray);
				fromHead: (BlArrowheadTriangle new
						scale: 4;
						border: (BlBorder paint: Color gray)) ];
		connectFrom: #superclass.
	m layout tree levelDistance: 20.
	^ m
]
