"
A diagram showing how to navigate from classes to compiled methods and their ASTs.
Just points to UmlClassDiagramExamples.

NB: This is used in the GT Book pages on “Understanding Reflection”, particularly “Querying classes and methods.”
"
Class {
	#name : #NavigatingClassesAndMethods,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
NavigatingClassesAndMethods >> mondrian [
	<gtExample>
	<return: #GtMondrian>
	^ UmlClassDiagramExamples new navigatingClassesAndMethodsWithLabels
]
