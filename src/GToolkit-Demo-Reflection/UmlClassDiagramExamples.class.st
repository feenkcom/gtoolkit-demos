Class {
	#name : #UmlClassDiagramExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
UmlClassDiagramExamples >> collectionHierarchy [
	<gtExample>
	^ UmlClassDiagram new classHierarchyFor: self collectionHierarchyClasses
]

{ #category : #accessing }
UmlClassDiagramExamples >> collectionHierarchyClasses [
	^ {Object.
		Collection.
		SequenceableCollection.
		ArrayedCollection.
		Array.
		String.
		ByteString.
		Symbol.
		Text.
		OrderedCollection.
		SortedCollection.
		LinkedList.
		Interval.
		Heap.
		HashedCollection.
		Set.
		Dictionary.
		IdentityDictionary.
		Bag}
]

{ #category : #accessing }
UmlClassDiagramExamples >> navigatingClassesAndMethods [
	"NavigatingClassesAndMethods"

	<gtExample>
	| m classes associations positions |

	classes := self navigationClasses.
	associations := self navigationAssociations.
	positions := self navigationExplicitPositions.

	m := UmlClassDiagram new
			classHierarchyFor: classes
			withAssociations: associations.

	m layout custom: BlBasicLayout new.

	m root children withIndexDo: [ :child :n | child relocate: (positions at: n) ].

	^ m
]

{ #category : #accessing }
UmlClassDiagramExamples >> navigationAssociations [
	^ {CompiledMethod
			-> {Behavior.
					RBMethodNode}.
		Behavior -> {MethodDictionary}.
		MethodDictionary -> {CompiledMethod}}
]

{ #category : #accessing }
UmlClassDiagramExamples >> navigationClasses [
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
UmlClassDiagramExamples >> navigationExplicitPositions [

	^ ((Array new: 56) at: 1 put: ((96.29166666666669@201.48549397786462)); at: 2 put: ((66.29166666666669@288.4854939778646)); at: 3 put: ((65.29166666666669@384.4854939778646)); at: 4 put: ((148.29166666666669@384.4854939778646)); at: 5 put: ((264.2916666666667@200.48549397786462)); at: 6 put: ((266.2916666666667@287.4854939778646)); at: 7 put: ((352.64866892496747@384.4854939778646)); at: 8 put: ((452.315668741862@200.48549397786462)); at: 9 put: ((509.36267344156903@289.4854939778646)); at: 10 put: ((542.7526728312175@382.4854939778646)); at: 11 put: ((138.05039523280948@227.48549397786462)); at: 12 put: ((98.25841820933833@317.4854939778646)); at: 13 put: ((146.89480699811665@317.4854939778646)); at: 14 put: ((427.4277095568234@229.4854939778646)); at: 15 put: ((531.5502603730702@229.48549397786462)); at: 16 put: ((574.7471498761857@315.4854939778646)); at: 17 put: ((168.03841364542646@227.48549397786462)); at: 18 put: ((168.03841364542646@227.48549397786462)); at: 19 put: ((168.03841364542646@227.48549397786462)); at: 20 put: ((168.03841364542646@227.48549397786462)); at: 21 put: ((168.03841364542646@227.48549397786462)); at: 22 put: ((168.03841364542646@227.48549397786462)); at: 23 put: ((168.03841364542646@227.48549397786462)); at: 24 put: ((168.03841364542646@227.48549397786462)); at: 25 put: ((168.03841364542646@227.48549397786462)); at: 26 put: ((168.03841364542646@227.48549397786462)); at: 27 put: ((352.46353631410716@316.48549397786456)); at: 28 put: ((352.46353631410716@316.48549397786456)); at: 29 put: ((352.46353631410716@316.48549397786456)); at: 30 put: ((352.46353631410716@316.48549397786456)); at: 31 put: ((352.46353631410716@316.48549397786456)); at: 32 put: ((352.46353631410716@316.48549397786456)); at: 33 put: ((352.46353631410716@316.48549397786456)); at: 34 put: ((352.46353631410716@316.48549397786456)); at: 35 put: ((352.46353631410716@316.48549397786456)); at: 36 put: ((352.46353631410716@316.48549397786456)); at: 37 put: ((179.64166514078778@197.76149316373574)); at: 38 put: ((179.64166514078778@197.76149316373574)); at: 39 put: ((179.64166514078778@197.76149316373574)); at: 40 put: ((179.64166514078778@197.76149316373574)); at: 41 put: ((179.64166514078778@197.76149316373574)); at: 42 put: ((179.64166514078778@197.76149316373574)); at: 43 put: ((179.64166514078778@197.76149316373574)); at: 44 put: ((179.64166514078778@197.76149316373574)); at: 45 put: ((179.64166514078778@197.76149316373574)); at: 46 put: ((179.64166514078778@197.76149316373574)); at: 47 put: ((340.61899439493817@229.48549397786462)); at: 48 put: ((340.61899439493817@229.48549397786462)); at: 49 put: ((340.61899439493817@229.48549397786462)); at: 50 put: ((340.61899439493817@229.48549397786462)); at: 51 put: ((340.61899439493817@229.48549397786462)); at: 52 put: ((340.61899439493817@229.48549397786462)); at: 53 put: ((340.61899439493817@229.48549397786462)); at: 54 put: ((340.61899439493817@229.48549397786462)); at: 55 put: ((340.61899439493817@229.48549397786462)); at: 56 put: ((340.61899439493817@229.48549397786462)); yourself)
]
