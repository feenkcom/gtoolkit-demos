Object subclass: #VRPaper
	instanceVariableNames: 'data'
	classVariableNames: ''
	package: 'VisualisationReview-Model'!

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:11'!
data
	^ data! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:11'!
data: anObject
	data := anObject! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:33'!
id
	^ self data at: 'ID'! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:33'!
type
	^ self data at: 'Type'! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:34'!
title
	^ self data at: 'Title'! !


!VRPaper methodsFor: 'testing' stamp: '1/13/2026 16:53'!
isDesignStudy
	^ self type = 'Design Study'! !

!VRPaper methodsFor: 'testing' stamp: '1/14/2026 16:26'!
isSelected
	^ self isDesignStudy! !


!VRPaper methodsFor: 'printing' stamp: '1/13/2026 16:54'!
printOn: aStream
	aStream nextPutAll: self title! !


!VRPaper methodsFor: 'views' stamp: '1/13/2026 17:18'!
gtJsonObjectFor: aView
	<gtView>
	^ aView forward
		title: 'JSON object';
		priority: 20;
		object: [ self data asGtJson ];
		view: #gtJsonObjectFor:context:! !

!VRPaper methodsFor: 'views' stamp: '1/14/2026 16:26'!
gtSummaryFor: aView
	<gtView>
	^ aView columnedList
		title: 'Summary';
		priority: 10;
		items: [ {{'ID'.
					self id}.
				{'Title'.
					self title}.
				{'Type'.
					self type}.
				{'# Authors'.
					self data at: '# Authors'}.
				{'# Pages'.
					self data at: '# Pages'}.
				{'Is selected'.
					self isSelected}} ];
		column: 'Key'
			text: #first
			width: 100;
		column: 'Value' text: #second;
		actionUpdateButton! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

VRPaper class
	instanceVariableNames: ''!

!VRPaper class methodsFor: 'accessing' stamp: '1/13/2026 16:11'!
for: data
	^ self new
		data: data;
		yourself! !
Object subclass: #VRDatasets
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'VisualisationReview-Examples'!

!VRDatasets methodsFor: 'accessing' stamp: '1/13/2026 15:44'!
datasetFolder
	<gtExample>
	| folder |
	folder := FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos'
			/ 'data' / 'visualisation-review'.
	self assert: folder exists.
	self assert: (folder allChildrenMatching: '*.csv') size equals: 2.
	^ folder! !

!VRDatasets methodsFor: 'accessing' stamp: '1/13/2026 15:44'!
allPapersJSON
	<gtExample>
	| json |
	json := (CSV2JSON
			for: (self datasetFolder / 'dataset-review-vissoft-all.csv') contents)
			jsonObject.
	self assert: json size equals: 346.
	^ json! !

!VRDatasets methodsFor: 'accessing' stamp: '1/13/2026 15:44'!
selectedPapersJSON
	<gtExample>
	| json |
	json := (CSV2JSON
			for: (self datasetFolder / 'dataset-review-vissoft-selected.csv') contents)
			jsonObject.
	self assert: json size equals: 65.
	^ json! !


!VRDatasets methodsFor: 'as yet unclassified' stamp: '1/13/2026 16:24'!
allPapers
	<gtExample>
	| papers |
	papers := self allPapersJSON collect: [ :data | VRPaper for: data ].
	self assert: papers size equals: 346.
	^ papers! !

!VRDatasets methodsFor: 'as yet unclassified' stamp: '1/13/2026 16:41'!
selectedPapers
	<gtExample>
	| papers |
	papers := self allPapers select: #isDesignStudy.
	self assert: papers size equals: 65.
	^ papers! !

!VRDatasets methodsFor: 'as yet unclassified' stamp: '1/13/2026 17:06'!
paper327
	<gtExample>
	| paper |
	paper := self allPapers detect: [ :p | p id = '327' ].
	self assert: paper id equals: '327'.
	self assert: paper isDesignStudy.
	^ paper! !
