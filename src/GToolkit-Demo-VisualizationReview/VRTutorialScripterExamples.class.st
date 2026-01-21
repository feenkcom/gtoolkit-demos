"
These examples are used in the GT book page `Tutorial: molding CSV data into an explainable system`.
"
Class {
	#name : #VRTutorialScripterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-VisualizationReview'
}

{ #category : #examples }
VRTutorialScripterExamples >> datasetFolder [
	<gtExample>
	| datasetFolder |
	datasetFolder := (FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos'
			/ 'data' / 'visualisation-review') asFileReference fileReference.
	self assert: datasetFolder exists.
	self assert: (datasetFolder allChildrenMatching: '*.csv') size equals: 2.
	^ datasetFolder
]

{ #category : #'as yet unclassified' }
VRTutorialScripterExamples >> inspectingDatasetAll [
	"To do: want to select the first dataset, and show the contents and the open in O/S button.
	Mouse over the second such button."
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: self datasetFolder).
	^ scripter
]
