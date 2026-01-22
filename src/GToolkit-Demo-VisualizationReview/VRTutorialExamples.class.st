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

{ #category : #examples }
VRTutorialExamples >> newClassSnippetDialog [
	"Caveat -- this only works if VRDatasetExamples does not yet exist, else it's an error!"
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter
		element: (LePharoSnippet new
				code: 'VRDatasetExamples new datasetFolder';
				yourself) asSnippetViewModel asSnippetElement.
	scripter
		substeps: 'Create non-existent class'
		do: [ :aStep | 
			aStep click
				label: 'Click on class fixit button';
				// (GtMethodAdviceElementId indexed: 1);
				play.
			aStep click
				label: 'Click on create class';
				onSpaceRoot;
				// (GtDefineClassFixItActionElementId indexed: 1);
				play.
			aStep click
				label: 'Click on package input field';
				onSpaceRoot;
				// (GtMagritteFieldElementId new
						description: GtCreationForm new packageAndTagDescription);
				// #package;
				play.
			aStep type
				text: 'VisualisationReview';
				play.
			aStep click
				label: 'Click on tag input field';
				onSpaceRoot;
				// (GtMagritteFieldElementId new
						description: GtCreationForm new packageAndTagDescription);
				// #tag;
				play.
			aStep type
				text: 'Examples';
				play ].
	^ scripter
]

{ #category : #examples }
VRTutorialExamples >> newClassSnippetDialogElement [
	<gtExample>
	^ self newClassSnippetDialog elementWithoutParent
]

{ #category : #examples }
VRTutorialExamples >> newClassSnippetWithFixitClicked [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter
		element: (LePharoSnippet new
				code: 'VRDatasetExamples new datasetFolder';
				yourself) asSnippetViewModel asSnippetElement.
	scripter click
		label: 'Hover over fixit';
		// (GtMethodAdviceElementId indexed: 1);
		play.
	^ scripter
]

{ #category : #examples }
VRTutorialExamples >> newClassSnippetWithFixitClickedElement [
	<gtExample>
	^ self newClassSnippetWithFixitClicked elementWithoutParent
]
