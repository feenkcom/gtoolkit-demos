"
These examples are used in the GT book page `Tutorial: molding CSV data into an explainable system`.
"
Class {
	#name : #VRTutorialExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-VisualizationReview'
}

{ #category : #examples }
VRTutorialExamples >> applyTutorialChanges [
	"NB: later changes may break earlier  examples."

	<gtExample>
	<noTest>
	^ self vrTutorialPage allChangeSnippets
		collect: [ :each | 
			| examples |
			each asSnippetViewModel changes applyChanges.
			examples := GtExplicitExampleGroup
					withAll: #VisualisationReview asPackage gtExamplesAllContained.
			examples runAll ]
]

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
VRTutorialExamples >> ensureVRPackage [
	"Initialize the VisualisationReview package so we don't have problems with package naming when filing in the classes."

	<gtExample>
	<noTest>
	self removeVRPackages.
	Smalltalk packageOrganizer ensurePackage: 'VisualisationReview'.
	^ #VisualisationReview asPackage
]

{ #category : #examples }
VRTutorialExamples >> fileIn10MoldingAuthors [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-10-MoldingAuthors.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRDataset asClass.
				#VRDomainEntity asClass.
				#VRAuthor asClass.
				#VRPaper asClass.
				#VRDomainEntityGroup asClass.
				#VRAuthorGroup asClass.
				#VRPaperGroup asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 9.
	self assert: #VRDataset asClass methods size equals: 16.
	self assert: #VRDomainEntity asClass methods size equals: 2.
	self assert: #VRAuthor asClass methods size equals: 10.
	self assert: #VRPaper asClass methods size equals: 15.
	self
		assert: (#VRDomainEntityGroup asClass methods reject: #isFromTrait) size
		equals: 0.
	self assert: #VRAuthorGroup asClass methods size equals: 1.
	self assert: #VRPaperGroup asClass methods size equals: 1.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn11Actions [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-11-Actions.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRDataset asClass.
				#VRDomainEntity asClass.
				#VRAuthor asClass.
				#VRPaper asClass.
				#VRDomainEntityGroup asClass.
				#VRAuthorGroup asClass.
				#VRPaperGroup asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 9.
	self assert: #VRDataset asClass methods size equals: 16.
	self assert: #VRDomainEntity asClass methods size equals: 3.
	self assert: #VRAuthor asClass methods size equals: 10.
	self assert: #VRPaper asClass methods size equals: 16.
	self
		assert: (#VRDomainEntityGroup asClass methods reject: #isFromTrait) size
		equals: 0.
	self assert: #VRAuthorGroup asClass methods size equals: 1.
	self assert: #VRPaperGroup asClass methods size equals: 1.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn12Searches [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-12-Searches.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRDataset asClass.
				#VRDomainEntity asClass.
				#VRAuthor asClass.
				#VRPaper asClass.
				#VRDomainEntityGroup asClass.
				#VRAuthorGroup asClass.
				#VRPaperGroup asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 9.
	self assert: #VRDataset asClass methods size equals: 19.
	self assert: #VRDomainEntity asClass methods size equals: 3.
	self assert: #VRAuthor asClass methods size equals: 10.
	self assert: #VRPaper asClass methods size equals: 16.
	self
		assert: (#VRDomainEntityGroup asClass methods reject: #isFromTrait) size
		equals: 0.
	self assert: #VRAuthorGroup asClass methods size equals: 1.
	self assert: #VRPaperGroup asClass methods size equals: 1.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn13Mondrian [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-13-Mondrian.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRDataset asClass.
				#VRDomainEntity asClass.
				#VRAuthor asClass.
				#VRPaper asClass.
				#VRDomainEntityGroup asClass.
				#VRAuthorGroup asClass.
				#VRPaperGroup asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 9.
	self assert: #VRDataset asClass methods size equals: 19.
	self assert: #VRDomainEntity asClass methods size equals: 7.
	self assert: #VRAuthor asClass methods size equals: 16.
	self assert: #VRPaper asClass methods size equals: 19.
	self
		assert: (#VRDomainEntityGroup asClass methods reject: #isFromTrait) size
		equals: 0.
	self assert: #VRAuthorGroup asClass methods size equals: 1.
	self assert: #VRPaperGroup asClass methods size equals: 1.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn1DatasetExamples [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-1-DatasetExamples.st') fileIn.
	self assert: package classes equals: {#VRDatasetExamples asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 3.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn2PaperWrapper [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-2a-PaperWrapper-Example.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRPaper asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 4.
	self assert: #VRPaper asClass methods size equals: 2.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn3DesignStudyPapers [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-3-DesignStudyPapers.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRPaper asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 5.
	self assert: #VRPaper asClass methods size equals: 5.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn4PrintOn [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-4-PrintOn.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRPaper asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 5.
	self assert: #VRPaper asClass methods size equals: 7.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn5ForwardJSONView [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-5-ForwardJSONView.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRPaper asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 6.
	self assert: #VRPaper asClass methods size equals: 8.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn6SummaryView [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-6-SummaryView.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRPaper asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 6.
	self assert: #VRPaper asClass methods size equals: 9.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn7PaperGroup [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-7-PaperGroup.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRPaper asClass.
				#VRPaperGroup asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 7.
	self assert: #VRPaper asClass methods size equals: 9.
	self
		assert: (#VRPaperGroup asClass methods reject: #isFromTrait) size
		equals: 1.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn8Dataset [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-8-Dataset.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRDataset asClass.
				#VRPaper asClass.
				#VRPaperGroup asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 8.
	self assert: #VRDataset asClass methods size equals: 11.
	self assert: #VRPaper asClass methods size equals: 11.
	self
		assert: (#VRPaperGroup asClass methods reject: #isFromTrait) size
		equals: 1.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileIn9Authors [
	<gtExample>
	| package examples |
	package := self ensureVRPackage.
	(self fileOutsFolder / 'VisualisationReview-9-Authors.st') fileIn.
	self
		assert: package classes
		equals: {#VRDatasetExamples asClass.
				#VRDataset asClass.
				#VRDomainEntity asClass.
				#VRAuthor asClass.
				#VRPaper asClass.
				#VRPaperGroup asClass} asSet.
	self assert: #VRDatasetExamples asClass methods size equals: 8.
	self assert: #VRDataset asClass methods size equals: 14.
	self assert: #VRDomainEntity asClass methods size equals: 2.
	self assert: #VRAuthor asClass methods size equals: 5.
	self assert: #VRPaper asClass methods size equals: 13.
	self
		assert: (#VRPaperGroup asClass methods reject: #isFromTrait) size
		equals: 1.
	examples := self runAllVRExamples.
	self assert: examples failedExamples isEmpty.
	self assert: examples erroredExamples isEmpty.
	^ package
]

{ #category : #examples }
VRTutorialExamples >> fileOutVRPackage [
	<gtExample>
	<noTest>
	#VisualisationReview asPackage fileOut.
	^ FileLocator imageDirectory
]

{ #category : #examples }
VRTutorialExamples >> fileOutsFolder [
	<gtExample>
	^ self datasetFolder / 'fileOuts'
]

{ #category : #examples }
VRTutorialExamples >> linkFileOutDir [
	"Useful for copying fileOuts to the relevant package folder."

	<gtExample>
	<noTest>
	GtShellScriptProcess new
		script: 'ln -s pharo-local/iceberg/feenkcom/gtoolkit-demos/data/visualisation-review/fileOuts ';
		start.
	^ FileLocator imageDirectory
]

{ #category : #examples }
VRTutorialExamples >> newClassSnippetDialog [
	"Caveat -- this only works if VRDatasetExamples does not yet exist, else it's an error!"
	<gtExample>
	<noTest>
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
	<noTest>
	^ self newClassSnippetDialog elementWithoutParent
]

{ #category : #examples }
VRTutorialExamples >> newClassSnippetWithFixitClicked [
	<gtExample>
	<noTest>
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
	<noTest>
	^ self newClassSnippetWithFixitClicked elementWithoutParent
]

{ #category : #examples }
VRTutorialExamples >> removeVRPackages [
	<gtExample>
	<noTest>
	self packageOrganizer
		packageNamed: #VisualisationReview
		ifPresent: [ :p | p removeFromSystem ].
	self packageOrganizer
		packageNamed: #'VisualisationReview-Examples'
		ifPresent: [ :p | p removeFromSystem ].
	self packageOrganizer
		packageNamed: #'VisualisationReview-Model'
		ifPresent: [ :p | p removeFromSystem ].
]

{ #category : #'as yet unclassified' }
VRTutorialExamples >> runAllVRExamples [
	"NB: Not an example. To be used by the fileIn* examples to check there are no errors or failures."

	| examples |
	examples := GtExplicitExampleGroup
			withAll: #VisualisationReview asPackage gtExamplesAllContained.
	examples runAll.
	^ examples
]

{ #category : #examples }
VRTutorialExamples >> vrTutorialPage [
	<gtExample>
	| page pageName |
	pageName := 'Tutorial: molding CSV data into an explainable system'.
	self assert: (LeDatabase gtBook hasPageNamed: pageName).
	page := LeDatabase gtBook pageNamed: pageName.
	^ page
]
