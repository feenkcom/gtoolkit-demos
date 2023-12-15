Class {
	#name : #NavigatingClassesAndMethods,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Mondrian'
}

{ #category : #accessing }
NavigatingClassesAndMethods >> classes [
	^ {Behavior.
		ClassDescription.
		Class.
		Metaclass.
		MethodDictionary.
		CompiledMethod.
		RBMethodNode.
		RBProgramNode.
		RBValueNode.
		RBMessageNode}
]

{ #category : #accessing }
NavigatingClassesAndMethods >> mondrian [
	<gtExample>
	| m roots |
	roots := {}.
	m := GtMondrian new.

	m nodes
		stencil: [ :class | 
			GtMondrianUMLClassElement new
				label: ((class name withoutPrefix: 'GtLudo') asRopedText
						glamorousRegularFont;
						fontSize: 18;
						bold);
				when: BlClickEvent
					do: [ :e | 
						e consumed: true.
						e target phlow spawnTool: (GtClassCoderTool forClass: class) ] ];
		with: self classes.


	m nodes
		stencil: [ :c | 
			BlElement new
				geometry: BlCircleGeometry new;
				border: (BlBorder paint: Color black);
				background: Color white;
				size: 5 @ 5;
				aptitude: (BrGlamorousWithLabelTooltipAptitude new text: [ c name ]);
				when: BlClickEvent
					do: [ :e | 
						e consumed: true.
						e target phlow spawnTool: (GtClassCoderTool forClass: c) ] ];
		with: roots.

	m edges
		stencil: [ :class | 
			BlLineElement new
				border: (BlBorder paint: (Color black alpha: 0.4));
				fromHead: (BlArrowheadTriangle new
						scale: 5;
						border: (BlBorder paint: (Color black alpha: 0.4))) ];
		connectFrom: [ :c | c superclass ].

	m edges
		stencil: [ :c | 
			BlParabollaArcElement new
				zIndex: -1;
				curvatureFraction: 0.2;
				border: (BlBorder paint: (Color orange alpha: 0.4));
				toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: (Color orange alpha: 0.4))) ];
		connectFrom: [ :each | CompiledMethod ] to: [ :each | Behavior ];
		connectFrom: [ :each | CompiledMethod ] to: [ :each | RBMethodNode ];
		connectFrom: [ :each | Behavior ] to: [ :each | MethodDictionary ];
		connectFrom: [ :each | MethodDictionary ] to: [ :each | CompiledMethod ].	"m layout tree levelDistance: 20."

	m layout custom: BlBasicLayout new.


	m root children
		withIndexDo: [ :child :n | child relocate: (self positions at: n) ].


	^ m
]

{ #category : #accessing }
NavigatingClassesAndMethods >> positions [
	^ ((Array new: 56) at: 1 put: ((96.29166666666669@201.48549397786462)); at: 2 put: ((66.29166666666669@288.4854939778646)); at: 3 put: ((65.29166666666669@384.4854939778646)); at: 4 put: ((148.29166666666669@384.4854939778646)); at: 5 put: ((264.2916666666667@200.48549397786462)); at: 6 put: ((266.2916666666667@287.4854939778646)); at: 7 put: ((353.64866892496747@381.4854939778646)); at: 8 put: ((452.315668741862@200.48549397786462)); at: 9 put: ((509.36267344156903@289.4854939778646)); at: 10 put: ((536.7526728312175@377.4854939778646)); at: 11 put: ((138.05039523280948@227.48549397786462)); at: 12 put: ((98.25841820933833@317.4854939778646)); at: 13 put: ((146.89480699811662@317.48549397786456)); at: 14 put: ((428.4793313680807@229.48549397786468)); at: 15 put: ((531.5502603730702@229.48549397786462)); at: 16 put: ((574.2214781549834@315.4854939778646)); at: 17 put: ((168.0384136454264@227.48549397786456)); at: 18 put: ((168.0384136454264@227.48549397786456)); at: 19 put: ((168.0384136454264@227.48549397786456)); at: 20 put: ((168.0384136454264@227.48549397786456)); at: 21 put: ((168.0384136454264@227.48549397786456)); at: 22 put: ((168.0384136454264@227.48549397786456)); at: 23 put: ((168.0384136454264@227.48549397786456)); at: 24 put: ((168.0384136454264@227.48549397786456)); at: 25 put: ((168.0384136454264@227.48549397786456)); at: 26 put: ((168.0384136454264@227.48549397786456)); at: 27 put: ((353.01242958962376@316.4854939778646)); at: 28 put: ((353.01242958962376@316.4854939778646)); at: 29 put: ((353.01242958962376@316.4854939778646)); at: 30 put: ((353.01242958962376@316.4854939778646)); at: 31 put: ((353.01242958962376@316.4854939778646)); at: 32 put: ((353.01242958962376@316.4854939778646)); at: 33 put: ((353.01242958962376@316.4854939778646)); at: 34 put: ((353.01242958962376@316.4854939778646)); at: 35 put: ((353.01242958962376@316.4854939778646)); at: 36 put: ((353.01242958962376@316.4854939778646)); at: 37 put: ((179.6416651407878@197.7614931637358)); at: 38 put: ((179.6416651407878@197.7614931637358)); at: 39 put: ((179.6416651407878@197.7614931637358)); at: 40 put: ((179.6416651407878@197.7614931637358)); at: 41 put: ((179.6416651407878@197.7614931637358)); at: 42 put: ((179.6416651407878@197.7614931637358)); at: 43 put: ((179.6416651407878@197.7614931637358)); at: 44 put: ((179.6416651407878@197.7614931637358)); at: 45 put: ((179.6416651407878@197.7614931637358)); at: 46 put: ((179.6416651407878@197.7614931637358)); at: 47 put: ((340.61345879772625@229.4854939778646)); at: 48 put: ((340.61345879772625@229.4854939778646)); at: 49 put: ((340.61345879772625@229.4854939778646)); at: 50 put: ((340.61345879772625@229.4854939778646)); at: 51 put: ((340.61345879772625@229.4854939778646)); at: 52 put: ((340.61345879772625@229.4854939778646)); at: 53 put: ((340.61345879772625@229.4854939778646)); at: 54 put: ((340.61345879772625@229.4854939778646)); at: 55 put: ((340.61345879772625@229.4854939778646)); at: 56 put: ((340.61345879772625@229.4854939778646)); yourself)
]
