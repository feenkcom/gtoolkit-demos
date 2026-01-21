"
These examples are used in the GT book page `Tutorial: molding CSV data into an explainable system`.
"
Class {
	#name : #VRTutorialExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-VisualizationReview'
}

{ #category : #examples }
VRTutorialExamples >> datasetAllCsv [
	<gtExample>
	| dataset |
	dataset := self datasetFolder / 'dataset-review-vissoft-all.csv'.
	self assert: dataset exists.
	^ dataset
]

{ #category : #examples }
VRTutorialExamples >> datasetFolder [
	<gtExample>
	| datasetFolder |
	datasetFolder := (FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos'
			/ 'data' / 'visualisation-review') asFileReference fileReference.
	self assert: datasetFolder exists.
	self assert: (datasetFolder allChildrenMatching: '*.csv') size equals: 2.
	^ datasetFolder
]
