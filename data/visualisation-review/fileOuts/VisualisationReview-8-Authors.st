Object subclass: #VRDataset
	instanceVariableNames: 'allJSON selectedJSON paperDict authorDict'
	classVariableNames: ''
	package: 'VisualisationReview-Model'!
!VRDataset commentStamp: '<historical>' prior: 0!
I encapsulate a Visualization Review dataset, consisting of two CSV files that have been converted to JSON.

I also provide an interface to instantiate and retrieve the various domain entities latent in the CSV files.!


!VRDataset methodsFor: 'accessing' stamp: '1/19/2026 10:19'!
allJSON
	^ allJSON! !

!VRDataset methodsFor: 'accessing' stamp: '1/19/2026 10:19'!
selectedJSON
	^ selectedJSON! !

!VRDataset methodsFor: 'accessing' stamp: '1/20/2026 08:48'!
allPapers
	^ VRPaperGroup withAll: self paperDict values in: self! !

!VRDataset methodsFor: 'accessing' stamp: '1/20/2026 08:38'!
paperDict
	self assert: paperDict notNil description: 'Dataset not properly initialized.'.
	^ paperDict! !

!VRDataset methodsFor: 'accessing' stamp: '1/20/2026 08:37'!
allJSON: aJSON selectedJSON: anotherJSON
	allJSON := aJSON.
	selectedJSON := anotherJSON.
	self initializePapers.
	self initializeAuthors! !

!VRDataset methodsFor: 'accessing' stamp: '1/20/2026 08:37'!
initializeAuthors
	authorDict := Dictionary new.
	self allPapers
		do: [ :p | 
			p authorNames
				do: [ :n | (authorDict at: n ifAbsentPut: [ VRAuthor named: n in: self ]) addPaper: p ] ].
	^ authorDict! !

!VRDataset methodsFor: 'accessing' stamp: '1/20/2026 08:39'!
authorDict
	self assert: authorDict notNil description: 'Dataset not properly initialized.'.
	^ authorDict! !

!VRDataset methodsFor: 'accessing' stamp: '1/20/2026 08:52'!
authors
	^ VRAuthorGroup withAll: self authorDict values sorted in: self! !


!VRDataset methodsFor: 'views' stamp: '1/20/2026 08:57'!
gtAllPapersFor: aView
	<gtView>
	^ aView forward
		title: 'Papers';
		priority: 10;
		object: [ self allPapers ];
		view: #gtItemsFor:! !

!VRDataset methodsFor: 'views' stamp: '1/20/2026 08:57'!
gtAuthorsFor: aView
	<gtView>
	^ aView forward
		title: 'Authors';
		priority: 20;
		object: [ self authors ];
		view: #gtItemsFor:! !


!VRDataset methodsFor: 'initialization' stamp: '1/20/2026 08:27'!
initializePapers
	^ paperDict := (self allJSON
			collect: [ :data | 
				| paper |
				paper := VRPaper for: data in: self.
				paper id -> paper ]) asDictionary! !


!VRDataset methodsFor: 'querying' stamp: '1/20/2026 09:03'!
authorNamed: aName
	^ self authorDict at: aName! !

!VRDataset methodsFor: 'querying' stamp: '1/20/2026 09:05'!
authorsNamed: aNameCollection
	^ VRAuthorGroup
		withAll: (aNameCollection sorted collect: [ :n | self authorDict at: n ])
		in: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

VRDataset class
	instanceVariableNames: ''!
!VRDataset class commentStamp: '<historical>' prior: 0!
I encapsulate a Visualization Review dataset, consisting of two CSV files that have been converted to JSON.

I also provide an interface to instantiate and retrieve the various domain entities latent in the CSV files.!


!VRDataset class methodsFor: 'instance creation' stamp: '1/19/2026 10:22'!
forAllCSV: aCSVFileReference andSelectedCSV: anotherCSVFileReference
	^ self
		forAllJSON: (CSV2JSON for: aCSVFileReference contents) jsonObject
		andSelectedJSON: (CSV2JSON for: anotherCSVFileReference contents) jsonObject! !

!VRDataset class methodsFor: 'instance creation' stamp: '1/20/2026 08:27'!
forAllJSON: aJSON andSelectedJSON: anotherJSON
	^ self new
		allJSON: aJSON selectedJSON: anotherJSON;
		yourself! !


Object subclass: #VRDomainEntity
	instanceVariableNames: 'dataset'
	classVariableNames: ''
	package: 'VisualisationReview-Model'!
!VRDomainEntity commentStamp: '<historical>' prior: 0!
I am an asbtract class that provides common properties to all VR domain entities.!


!VRDomainEntity methodsFor: 'accessing' stamp: '1/19/2026 10:35'!
dataset
	^ dataset! !

!VRDomainEntity methodsFor: 'accessing' stamp: '1/19/2026 10:35'!
dataset: aDictionary
	dataset := aDictionary! !


VRDomainEntity subclass: #VRAuthor
	instanceVariableNames: 'authorName papers'
	classVariableNames: ''
	package: 'VisualisationReview-Model'!

!VRAuthor methodsFor: 'accessing' stamp: '1/20/2026 08:32'!
authorName
	^ authorName! !

!VRAuthor methodsFor: 'accessing' stamp: '1/20/2026 08:32'!
authorName: aDictionary
	authorName := aDictionary! !

!VRAuthor methodsFor: 'accessing' stamp: '1/20/2026 08:59'!
papers
	^ VRPaperGroup withAll: papers in: self dataset! !

!VRAuthor methodsFor: 'accessing' stamp: '1/20/2026 08:36'!
addPaper: aPaper
	^ papers add: aPaper! !


!VRAuthor methodsFor: 'initialization' stamp: '1/20/2026 08:35'!
initialize
	papers := OrderedCollection new! !


!VRAuthor methodsFor: 'comparing' stamp: '1/20/2026 08:53'!
<= anAuthor
	^ self authorName <= anAuthor authorName! !


!VRAuthor methodsFor: 'view' stamp: '1/20/2026 08:58'!
gtSummaryFor: aView
	<gtView>
	^ aView columnedList
		title: 'Summary';
		priority: 10;
		items: [ {{'Author name'.
					self authorName}.
				{'# Papers'.
					self papers size.
					self papers}} ];
		column: 'Key'
			text: #first
			width: 140;
		column: 'Value' text: #second;
		send: #last;
		actionUpdateButton! !


!VRAuthor methodsFor: 'printing' stamp: '1/20/2026 08:55'!
printOn: aStream
	aStream nextPutAll: self authorName! !


!VRAuthor methodsFor: 'views' stamp: '1/20/2026 09:07'!
gtPapersFor: aView
	<gtView>
	^ aView forward
		title: 'Papers';
		priority: 20;
		object: [ self papers ];
		view: #gtItemsFor:! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

VRAuthor class
	instanceVariableNames: ''!

!VRAuthor class methodsFor: 'accessing' stamp: '1/20/2026 08:34'!
named: aString in: aDataset
	^ self new
		authorName: aString;
		dataset: aDataset;
		yourself! !


VRDomainEntity subclass: #VRPaper
	instanceVariableNames: 'data'
	classVariableNames: ''
	package: 'VisualisationReview-Model'!
!VRPaper commentStamp: '<historical>' prior: 0!
I represent a paper (publication) in a Visualization Review dataset.!


!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:11'!
data
	^ data! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:11'!
data: aDictionary
	data := aDictionary! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:33'!
id
	^ self data at: 'ID'! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:33'!
type
	^ self data at: 'Type'! !

!VRPaper methodsFor: 'accessing' stamp: '1/13/2026 16:34'!
title
	^ self data at: 'Title'! !

!VRPaper methodsFor: 'accessing' stamp: '1/20/2026 08:51'!
authorNames
	"Just the names ofthe authors, in order, not the author entities."

	^ self authorFields
		collect: [ :k | (self data at: k) trimBoth: [ :c | c = $" ] ]
		thenSelect: [ :f | f notEmpty ]! !

!VRPaper methodsFor: 'accessing' stamp: '1/20/2026 08:14'!
numAuthorsStored
	"The stored # authors, not necessarily correct."

	^ (self data at: '# Authors') asNumber! !

!VRPaper methodsFor: 'accessing' stamp: '1/20/2026 08:15'!
numAuthors
	"The actual # found authors."

	^ self authorNames size! !

!VRPaper methodsFor: 'accessing' stamp: '1/20/2026 09:05'!
authors
	^ self dataset authorsNamed: self authorNames! !


!VRPaper methodsFor: 'testing' stamp: '1/13/2026 16:53'!
isDesignStudy
	^ self type = 'Design Study'! !

!VRPaper methodsFor: 'testing' stamp: '1/14/2026 16:26'!
isSelected
	^ self isDesignStudy! !


!VRPaper methodsFor: 'printing' stamp: '1/13/2026 16:54'!
printOn: aStream
	aStream nextPutAll: self title! !


!VRPaper methodsFor: 'views' stamp: '1/20/2026 09:13'!
gtJsonObjectFor: aView
	<gtView>
	^ aView forward
		title: 'JSON object';
		priority: 50;
		object: [ self data asGtJson ];
		view: #gtJsonObjectFor:context:! !

!VRPaper methodsFor: 'views' stamp: '1/20/2026 09:00'!
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
				{'# Authors (recorded)'.
					self numAuthorsStored}.
				{'# Authors (found)'.
					self numAuthors}.
				{'# Pages'.
					self data at: '# Pages'}.
				{'Is selected'.
					self isSelected}} ];
		column: 'Key'
			text: #first
			width: 140;
		column: 'Value' text: #second;
		send: #last;
		actionUpdateButton! !

!VRPaper methodsFor: 'views' stamp: '1/20/2026 09:13'!
gtAuthorsFor: aView
	<gtView>
	^ aView forward
		title: 'Authors';
		priority: 20;
		object: [ self authors ];
		view: #gtItemsFor:! !


!VRPaper methodsFor: 'as yet unclassified' stamp: '1/19/2026 11:03'!
authorFields
	"All the author fields of the JSON, in order, including the original typos in the source CSV files."
	^ #(
		'First Author'
		'Second Author'
		'Third Author'
		'Fourth Author'
		'Fifth Author'
		'Sixth Author'
		'Seven Author'
		'Eighth Author'
		'Nineth Author'
		'Tenth Author'
		'Eleventh Author'
		'Twelfth Author'
	)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

VRPaper class
	instanceVariableNames: ''!
!VRPaper class commentStamp: '<historical>' prior: 0!
I represent a paper (publication) in a Visualization Review dataset.!


!VRPaper class methodsFor: 'accessing' stamp: '1/19/2026 10:38'!
for: jsonData in: aDataset
	^ self new
		data: jsonData;
		dataset: aDataset
		yourself! !


VRDomainEntity subclass: #VRDomainEntityGroup
	uses: TGtGroupWithItems
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'VisualisationReview-Model'!
!VRDomainEntityGroup commentStamp: '<historical>' prior: 0!
I am an abstract parent for all groups of VR domain entities.
I hold the common trait, and I ensure all groups have a dataset reference for queries.

Send the class message `#withAll:in:` to create instances.
!










!VRDomainEntityGroup methodsFor: 'as yet unclassified' stamp: '1/20/2026 08:46'!
withAll: aCollection in: aDataset! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

VRDomainEntityGroup class
	uses: TGtGroupWithItems classTrait
	instanceVariableNames: ''!
!VRDomainEntityGroup class commentStamp: '<historical>' prior: 0!
I am an abstract parent for all groups of VR domain entities.
I hold the common trait, and I ensure all groups have a dataset reference for queries.

Send the class message `#withAll:in:` to create instances.
!



!VRDomainEntityGroup class methodsFor: 'instance creation' stamp: '1/20/2026 08:47'!
withAll: aCollection in: aDataset
	^ (self withAll: aCollection)
		dataset: aDataset;
		yourself! !


VRDomainEntityGroup subclass: #VRAuthorGroup
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'VisualisationReview-Model'!

!VRAuthorGroup methodsFor: 'as yet unclassified' stamp: '1/20/2026 08:56'!
gtItemsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Authors';
		items: [ self items ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Title'
			text: [ :each | each authorName ]
			width: 200;
		column: '# Papers'
			text: [ :each | each papers size ]
			width: 80;
		actionUpdateButton! !


VRDomainEntityGroup subclass: #VRPaperGroup
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'VisualisationReview-Model'!
!VRPaperGroup commentStamp: '<historical>' prior: 0!
I am a moldable collection data wrapper for groups of papers.!


!VRPaperGroup methodsFor: 'views' stamp: '1/20/2026 09:16'!
gtItemsFor: aView
	<gtView>
	^ aView columnedList
		title: 'Papers';
		items: [ self items ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Title' text: [ :each | each title ] width: 500;
		column: 'Type' text: [ :each | each type ] width: 100;
		column: '# Authors' text: [ :each | each authors size ] width: 100;
		actionUpdateButton! !
Object subclass: #VRDatasetExamples
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'VisualisationReview-Examples'!
!VRDatasetExamples commentStamp: '<historical>' prior: 0!
I provide some basic examples and test for the Visualization Review dataset.!


!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:25'!
allCSVFile
	<gtExample>
	^ self datasetFolder / 'dataset-review-vissoft-all.csv'! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:56'!
allPapers
	<gtExample>
	| papers |
	"papers := self allPapersJSON collect: [ :data | VRPaper for: data ]."
	papers := self vrDataset allPapers.
	self assert: papers size equals: 346.
	^ papers! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:26'!
allPapersJSON
	<gtExample>
	| json |
	json := (CSV2JSON for: self allCSVFile contents) jsonObject.
	self assert: json size equals: 346.
	^ json! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/20/2026 08:48'!
allPapersWrapped
	"NB: the dataset slot will be nil in this example."

	<gtExample>
	| papers |
	papers := VRPaperGroup withAll: self allPapers.
	self assert: papers size equals: 346.
	^ papers! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:25'!
datasetFolder
	<gtExample>
	| folder |
	folder := FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos'
			/ 'data' / 'visualisation-review'.
	self assert: folder exists.
	self assert: (folder allChildrenMatching: '*.csv') size equals: 2.
	^ folder! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:25'!
paper327
	<gtExample>
	| paper |
	paper := self allPapers detect: [ :p | p id = '327' ].
	self assert: paper id equals: '327'.
	self assert: paper isDesignStudy.
	^ paper! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:25'!
selectedPapers
	<gtExample>
	| papers |
	papers := self allPapers select: #isDesignStudy.
	self assert: papers size equals: 65.
	^ papers! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:25'!
selectedPapersJSON
	<gtExample>
	| json |
	json := (CSV2JSON
			for: (self datasetFolder / 'dataset-review-vissoft-selected.csv') contents)
			jsonObject.
	self assert: json size equals: 65.
	^ json! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:27'!
vrDataset
	<gtExample>
	| dataset |
	dataset := VRDataset
			forAllCSV: self allCSVFile
			andSelectedCSV: self selectedCSVFile.
	^ dataset! !

!VRDatasetExamples methodsFor: 'example' stamp: '1/19/2026 10:26'!
selectedCSVFile
	<gtExample>
	^ self datasetFolder / 'dataset-review-vissoft-selected.csv'! !
