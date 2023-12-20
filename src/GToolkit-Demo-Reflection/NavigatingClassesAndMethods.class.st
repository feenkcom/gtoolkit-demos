"
A diagram showing how to navigate from classes to compiled methods and their ASTs.
Just points to UmlClassDiagramExamples
"
Class {
	#name : #NavigatingClassesAndMethods,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
NavigatingClassesAndMethods >> mondrian [
	<gtExample>
	^ UmlClassDiagramExamples new navigatingClassesAndMethodsWithLabels
]
