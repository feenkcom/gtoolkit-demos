Class {
	#name : #GtMetacelloExplanation,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #accessing }
GtMetacelloExplanation >> deepTraverserBaseline [
	<gtExample>
	^ BaselineOfDeepTraverser
]

{ #category : #accessing }
GtMetacelloExplanation >> packageWithRequiresDefinition [
	<gtExample>
	^ (BaselineOfDeepTraverser>>#baseline:) ast allChildren detect: [:each | each isMessage and: [each selector = 'package:with:' and: [ each arguments first value ='DeepTraverser-MemoryTraversal' ]]]
]

{ #category : #accessing }
GtMetacelloExplanation >> simpleBaselineDefinition [
	<gtExample>

	^ (BaselineOfDeepTraverser >> #baseline:) ast allChildren
		detect: [ :each | each isMessage and: [ each selector = #baseline:with: ] ]
]

{ #category : #accessing }
GtMetacelloExplanation >> simplePackageDefinition [
	<gtExample>
	^ (BaselineOfDeepTraverser>>#baseline:) ast allChildren detect: [:each | each isMessage and: [each selector = 'package:' and: [ each arguments anyOne value ='DeepTraverser' ]]]
]
