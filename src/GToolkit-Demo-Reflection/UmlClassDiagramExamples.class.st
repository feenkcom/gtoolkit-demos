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

	^ ((Array new: 56) at: 1 put: ((89.29166666666669@201.48549397786462)); at: 2 put: ((66.29166666666669@288.4854939778646)); at: 3 put: ((52.291666666666686@362.4854939778646)); at: 4 put: ((143.29166666666669@361.4854939778646)); at: 5 put: ((246.29166666666669@200.48549397786462)); at: 6 put: ((248.29166666666669@286.4854939778646)); at: 7 put: ((344.64866892496747@360.4854939778646)); at: 8 put: ((438.315668741862@199.48549397786462)); at: 9 put: ((498.36267344156903@280.4854939778646)); at: 10 put: ((533.7526728312175@360.4854939778646)); at: 11 put: ((121.82389742434735@231.08333333333334)); at: 12 put: ((83.98457652345606@318.08333333333337)); at: 13 put: ((133.32210548274983@318.08333333333337)); at: 14 put: ((406.2605995114165@229.08333333333337)); at: 15 put: ((503.37185019828433@229.08333333333337)); at: 16 put: ((553.0342694140967@310.08333333333337)); at: 17 put: ((153.97730267720465@231.08333333333337)); at: 18 put: ((153.97730267720465@231.08333333333337)); at: 19 put: ((153.97730267720465@231.08333333333337)); at: 20 put: ((153.97730267720465@231.08333333333337)); at: 21 put: ((153.97730267720465@231.08333333333337)); at: 22 put: ((153.97730267720465@231.08333333333337)); at: 23 put: ((153.97730267720465@231.08333333333337)); at: 24 put: ((153.97730267720465@231.08333333333337)); at: 25 put: ((153.97730267720465@231.08333333333337)); at: 26 put: ((153.97730267720465@231.08333333333337)); at: 27 put: ((324.00352594498145@316.08333333333337)); at: 28 put: ((324.00352594498145@316.08333333333337)); at: 29 put: ((324.00352594498145@316.08333333333337)); at: 30 put: ((324.00352594498145@316.08333333333337)); at: 31 put: ((324.00352594498145@316.08333333333337)); at: 32 put: ((324.00352594498145@316.08333333333337)); at: 33 put: ((324.00352594498145@316.08333333333337)); at: 34 put: ((324.00352594498145@316.08333333333337)); at: 35 put: ((324.00352594498145@316.08333333333337)); at: 36 put: ((324.00352594498145@316.08333333333337)); at: 37 put: ((154.70966974894208@197.54043572168123)); at: 38 put: ((154.70966974894208@197.54043572168123)); at: 39 put: ((154.70966974894208@197.54043572168123)); at: 40 put: ((154.70966974894208@197.54043572168123)); at: 41 put: ((154.70966974894208@197.54043572168123)); at: 42 put: ((154.70966974894208@197.54043572168123)); at: 43 put: ((154.70966974894208@197.54043572168123)); at: 44 put: ((154.70966974894208@197.54043572168123)); at: 45 put: ((154.70966974894208@197.54043572168123)); at: 46 put: ((154.70966974894208@197.54043572168123)); at: 47 put: ((305.6047424883368@230.08333333333337)); at: 48 put: ((305.6047424883368@230.08333333333337)); at: 49 put: ((305.6047424883368@230.08333333333337)); at: 50 put: ((305.6047424883368@230.08333333333337)); at: 51 put: ((305.6047424883368@230.08333333333337)); at: 52 put: ((305.6047424883368@230.08333333333337)); at: 53 put: ((305.6047424883368@230.08333333333337)); at: 54 put: ((305.6047424883368@230.08333333333337)); at: 55 put: ((305.6047424883368@230.08333333333337)); at: 56 put: ((305.6047424883368@230.08333333333337)); yourself)
]
