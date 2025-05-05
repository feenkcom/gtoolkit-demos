Class {
	#name : #UmlClassDiagramExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
UmlClassDiagramExamples >> collectionHierarchy [
	<gtExample>
	<return: #GtMondrian>
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
UmlClassDiagramExamples >> compiledMethodAndMethodWrapper [
	<gtExample>
	<return: #GtMondrian>
	| m classes associationsWithLabels positions |
	classes := self compiledMethodClasses.
	associationsWithLabels := self compiledMethodAssociationsWithLabels.
	positions := self compiledMethodExplicitPositions.

	m := UmlClassDiagram new
			classHierarchyFor: classes
			withAssociationsAndLabels: associationsWithLabels.

	m layout custom: BlBasicLayout new.
	m root children withIndexDo: [ :child :n | child relocate: (positions at: n) ].

	^ m
]

{ #category : #accessing }
UmlClassDiagramExamples >> compiledMethodAssociationsWithLabels [
	^ {CompiledMethod
			-> {{'methodClass'.
						Behavior}}.
		Behavior
			-> {{'methodDict'.
						MethodDictionary}}.
		MethodDictionary
			-> {{'at:'.
						CompiledMethod}.
					{'ast'.
						MinimalMethodWrapper}}.
		MinimalMethodWrapper
			-> {{'method'.
						CompiledMethod}}}
]

{ #category : #accessing }
UmlClassDiagramExamples >> compiledMethodClasses [
	^ {Behavior.
		ClassDescription.
		Class.
		Metaclass.
		MethodDictionary.
		CompiledMethod.
		MinimalMethodWrapper}
]

{ #category : #accessing }
UmlClassDiagramExamples >> compiledMethodExplicitPositions [

	^ {(97.29166666666669@349.90216064453125). (73.29166666666669@441.90216064453125). (57.291666666666686@524.9021606445313). (138.29166666666669@525.9021606445313). (289.2916666666667@310.90216064453125). (292.2916666666667@398.90216064453125). (496.2916666666667@359.90216064453125). (128.9827860961101@379.5). (88.31648798031176@471.5). (136.69751166249415@471.5). (162.70966974894208@371.9974438544482). (162.70966974894208@371.9974438544482). (162.70966974894208@371.9974438544482). (162.70966974894208@371.9974438544482). (162.70966974894208@371.9974438544482). (162.70966974894208@371.9974438544482). (162.70966974894208@371.9974438544482). (162.70966974894208@322.25688097864736). (162.70966974894208@322.25688097864736). (162.70966974894208@322.25688097864736). (162.70966974894208@322.25688097864736). (162.70966974894208@322.25688097864736). (162.70966974894208@322.25688097864736). (162.70966974894208@322.25688097864736). (348.772774789971@340.5000000000001). (348.772774789971@340.5000000000001). (348.772774789971@340.5000000000001). (348.772774789971@340.5000000000001). (348.772774789971@340.5000000000001). (348.772774789971@340.5000000000001). (348.772774789971@340.5000000000001). (407.8936640421549@329.6607540735696). (407.8936640421549@329.6607540735696). (407.8936640421549@329.6607540735696). (407.8936640421549@329.6607540735696). (407.8936640421549@329.6607540735696). (407.8936640421549@329.6607540735696). (407.8936640421549@329.6607540735696). (407.03566233317065@388.1972596958765). (407.03566233317065@388.1972596958765). (407.03566233317065@388.1972596958765). (407.03566233317065@388.1972596958765). (407.03566233317065@388.1972596958765). (407.03566233317065@388.1972596958765). (407.03566233317065@388.1972596958765)}
]

{ #category : #accessing }
UmlClassDiagramExamples >> navigatingClassesAndMethods [
	"NavigatingClassesAndMethods"

	<gtExample>
	<return: #GtMondrian>
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
UmlClassDiagramExamples >> navigatingClassesAndMethodsWithLabels [
	"NavigatingClassesAndMethods"

	<gtExample>
	<return: #GtMondrian>
	| m classes associationsWithLabels positions |
	classes := self navigationClasses.
	associationsWithLabels := self navigationAssociationsWithLabels.
	positions := self navigationExplicitPositions.

	m := UmlClassDiagram new
			classHierarchyFor: classes
			withAssociationsAndLabels: associationsWithLabels.

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
UmlClassDiagramExamples >> navigationAssociationsWithLabels [
	^ {CompiledMethod
			-> {{'methodClass'.
						Behavior}.
					{'ast'.
						RBMethodNode}}.
		Behavior
			-> {{'methodDict'.
						MethodDictionary}}.
		MethodDictionary
			-> {{'at:'.
						CompiledMethod}}}
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

	^ ((Array new: 56) at: 1 put: ((104.29166666666669@199.48549397786462)); at: 2 put: ((82.29166666666669@285.4854939778646)); at: 3 put: ((78.29166666666669@359.4854939778646)); at: 4 put: ((134.29166666666669@359.4854939778646)); at: 5 put: ((265.2916666666667@195.48549397786462)); at: 6 put: ((270.2916666666667@288.4854939778646)); at: 7 put: ((354.64866892496747@361.4854939778646)); at: 8 put: ((421.315668741862@194.48549397786462)); at: 9 put: ((471.36267344156903@277.4854939778646)); at: 10 put: ((495.7526728312175@360.4854939778646)); at: 11 put: ((137.13301710601988@229.0833333333334)); at: 12 put: ((107.98472251295145@315.0833333333334)); at: 13 put: ((144.1665996398191@315.0833333333334)); at: 14 put: ((413.5485250582585@224.0833333333334)); at: 15 put: ((484.36532535332543@224.0833333333334)); at: 16 put: ((523.7777885392485@307.08333333333337)); at: 17 put: ((168.7041105408737@229.0833333333334)); at: 18 put: ((168.7041105408737@229.0833333333334)); at: 19 put: ((168.7041105408737@229.0833333333334)); at: 20 put: ((168.7041105408737@229.0833333333334)); at: 21 put: ((168.7041105408737@229.0833333333334)); at: 22 put: ((168.7041105408737@229.0833333333334)); at: 23 put: ((168.7041105408737@229.0833333333334)); at: 24 put: ((168.7041105408737@229.0833333333334)); at: 25 put: ((168.7041105408737@229.0833333333334)); at: 26 put: ((168.7041105408737@229.0833333333334)); at: 27 put: ((343.822057798574@318.0833333333334)); at: 28 put: ((343.822057798574@318.0833333333334)); at: 29 put: ((343.822057798574@318.0833333333334)); at: 30 put: ((343.822057798574@318.0833333333334)); at: 31 put: ((343.822057798574@318.0833333333334)); at: 32 put: ((343.822057798574@318.0833333333334)); at: 33 put: ((343.822057798574@318.0833333333334)); at: 34 put: ((343.822057798574@318.0833333333334)); at: 35 put: ((343.822057798574@318.0833333333334)); at: 36 put: ((343.822057798574@318.0833333333334)); at: 37 put: ((169.70966974894208@193.45152313758234)); at: 38 put: ((169.70966974894208@193.45152313758234)); at: 39 put: ((169.70966974894208@193.45152313758234)); at: 40 put: ((169.70966974894208@193.45152313758234)); at: 41 put: ((169.70966974894208@193.45152313758234)); at: 42 put: ((169.70966974894208@193.45152313758234)); at: 43 put: ((169.70966974894208@193.45152313758234)); at: 44 put: ((169.70966974894208@193.45152313758234)); at: 45 put: ((169.70966974894208@193.45152313758234)); at: 46 put: ((169.70966974894208@193.45152313758234)); at: 47 put: ((325.0866595901148@225.0833333333334)); at: 48 put: ((325.0866595901148@225.0833333333334)); at: 49 put: ((325.0866595901148@225.0833333333334)); at: 50 put: ((325.0866595901148@225.0833333333334)); at: 51 put: ((325.0866595901148@225.0833333333334)); at: 52 put: ((325.0866595901148@225.0833333333334)); at: 53 put: ((325.0866595901148@225.0833333333334)); at: 54 put: ((325.0866595901148@225.0833333333334)); at: 55 put: ((325.0866595901148@225.0833333333334)); at: 56 put: ((325.0866595901148@225.0833333333334)); yourself)
]
