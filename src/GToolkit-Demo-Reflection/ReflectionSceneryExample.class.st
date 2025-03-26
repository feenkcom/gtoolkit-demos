Class {
	#name : #ReflectionSceneryExample,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
ReflectionSceneryExample >> arcLabeled: aString [
	^ self arcLabeled: aString curvature: self curvature
]

{ #category : #accessing }
ReflectionSceneryExample >> arcLabeled: aString curvature: curvature [
	^ GtSceneryParabollaArcStencil new
		labelText: aString;
		fontSize: self smallFont;
		arrowLengthFraction: self arrowHeadSize;
		curvatureFraction: curvature;
		yourself
]

{ #category : #accessing }
ReflectionSceneryExample >> arrowHeadSize [
	^ 5
]

{ #category : #accessing }
ReflectionSceneryExample >> bigFont [
	^ 14
]

{ #category : #accessing }
ReflectionSceneryExample >> bigLabel: label [
	^ GtSceneryItem new
		stencil: (GtSceneryTextStencil new
				text: (label first asRopedText
						fontSize: self bigFont;
						bold))
]

{ #category : #accessing }
ReflectionSceneryExample >> circle [
	^ GtSceneryItem new
		stencil: [ BlElement new
				geometry: BlCircleGeometry new;
				border: (BlBorder paint: Color black width: 1);
				yourself ] asStencil
]

{ #category : #accessing }
ReflectionSceneryExample >> curvature [
	^ 0.5
]

{ #category : #accessing }
ReflectionSceneryExample >> eyecon [
	<gtExample>
	^ GtSceneryItem new
		stencil: [ GtFileUtility imageElementFromFileReference: self eyeconFile ] asStencil
]

{ #category : #accessing }
ReflectionSceneryExample >> eyeconFile [
	<gtExample>
	<noTest>
	^ FileLocator gtResource / 'feenkcom/gtoolkit-demos/doc/reflection/eyecon.png'
]

{ #category : #accessing }
ReflectionSceneryExample >> fatLine [
	^ [ BlLineElement new
		border: (BlBorder paint: Color black width: 2);
		zIndex: -100;
		toHead: BlArrowheadNone new ] asStencil
]

{ #category : #accessing }
ReflectionSceneryExample >> lineEndPoint [
	^ GtSceneryItem new
		stencil: [ BlElement new
				size: 10 @ 10;
				background: Color white;
				border: Color white ] asStencil
]

{ #category : #accessing }
ReflectionSceneryExample >> rectangle [
	^ GtSceneryItem new
		stencil: [ BlElement new
				border: (BlBorder paint: Color black width: 1);
				yourself ] asStencil
]

{ #category : #accessing }
ReflectionSceneryExample >> reflectionScenery [
	<gtExample>
	| scenery |
	scenery := GtSceneryEditedExamples new reflectionScenery.
	^ scenery
]

{ #category : #accessing }
ReflectionSceneryExample >> reflectionSceneryOLD [
	<gtExample>
	| scenery items meta reified eyecon |
	scenery := GtScenery new.
	items := Dictionary new.

	{{'Metaobjects'.
			50 @ 60}.
		{'Objects'.
			50 @ 120}}
		do: [ :label | 
			| item |
			item := scenery addItem: (self bigLabel: label).
			item
				position: label second;
				extent: 100 @ 30.
			items at: label first put: item ].

	{{'start'.
			40 @ 100}.
		{'end'.
			300 @ 100}}
		do: [ :label | 
			| item |
			item := scenery addItem: self lineEndPoint.
			item
				position: label second;
				extent: 10 @ 10.
			items at: label first put: item ].

	scenery
		addConnectionWithStencil: self fatLine
		from: (items at: 'start')
		to: (items at: 'end').

	meta := scenery addItem: self circle.
	meta
		position: 230 @ 40;
		extent: 20 @ 20.

	reified := scenery addItem: self rectangle.
	reified
		position: 230 @ 140;
		extent: 20 @ 20.

	scenery
		addConnectionWithStencil: (self arcLabeled: 'reification')
		from: meta
		to: reified.

	scenery
		addConnectionWithStencil: (self arcLabeled: 'reflection')
		from: reified
		to: meta.

	eyecon := scenery addItem: self eyecon.
	eyecon
		position: 140 @ 140;
		extent: 20 @ 20.

	scenery
		addConnectionWithStencil: (self arcLabeled: 'introspection' curvature: 0)
		from: eyecon
		to: reified.

	^ scenery
]

{ #category : #accessing }
ReflectionSceneryExample >> smallFont [
	^ 6
]
