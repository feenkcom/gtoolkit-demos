"
Inspect the presentation
[[[
(GtLiveShow createWithArrowsVisible: GtMoldableAnalysisPresentation new) create.		
]]]

Open the presentation in a new window.
[[[
space := BlSpace new.
space root addChild: (GtLiveShow createWithArrowsVisible: GtMoldableAnalysisPresentation new) create.
space title: 'Moldable analysis'.
space show			
]]]
"
Class {
	#name : #GtAnalyzingJavaSystemsShow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableAnalysis'
}

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> anyBoundarySlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 10;
		newTextWithFormat: ('any boundary in software is arbitrary.' asRopedText glamorousRegularFont fontSize: 40; bold)
]

{ #category : #utils }
GtAnalyzingJavaSystemsShow >> codeFromMethod: aMethod [
	| notTemp |
	notTemp := aMethod ast body children detect: [:aNode | aNode isTemp not ].

	^ String streamContents: [ :stream |
		aMethod ast comments ifNotEmpty: [
			stream
				nextPutAll: '"';
				nextPutAll: aMethod ast comments first contents;
				nextPutAll: '"';
				nextPutAll: String cr].
			
		(aMethod sourceCode 
			copyFrom: notTemp start to: aMethod ast stop) linesDo: [ :aLine |
				stream 
					nextPutAll: (aLine removePrefix: String tab);
					cr ] ]
]

{ #category : #utils }
GtAnalyzingJavaSystemsShow >> codeFromSelector: aSelector [
	^ self codeFromMethod: self class >> aSelector
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> downloadArgoUMLCodeAndMSE [
	<gtExample>
	<noTest>
	| targetFolder archiveFileName archiveUrl |
	"Download ArgoUML code and MSE model file"
	targetFolder := (FileLocator imageDirectory / 
		'models') asFileReference ensureCreateDirectory.
	archiveFileName := 'ArgoUML-0-34.zip'.
	archiveUrl := 'https://dl.feenk.com/moose-tutorial/argouml/'. 
	ZnClient new
		url: archiveUrl, archiveFileName;
		signalProgress: true;
		downloadTo: targetFolder.
	(ZipArchive new 
		readFrom: targetFolder / archiveFileName) 
		extractAllTo: targetFolder.
	targetFolder
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> enginesSlidesFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 15;
		element: [| form |
			form := PNGReadWriter formFromFileNamed: (GtResourceReference
				path: Path * 'feenkcom' / 'gtoolkit-demos' / 'data' / 'moldableanalysis' / 'analysis-engines.png') fullName.
			BlElement new 
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ];
				addChild: form asElement asScalableElement 
					fitWidth ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> extractAllDeprecatedClassesFrom: model [
	<gtExample>
	| deprecatedClasses |
	deprecatedClasses := model allModelClasses select: [ :each |
		each isAnnotatedWith: 'Deprecated' ].
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> extractBuildFoldersAndFilesFromModel: model [
	<gtExample>
	| interestingDirectories |
	interestingDirectories := model rootFolder/ 'src' withDeepCollect: [: each | 
		(each files anySatisfy: [ :f |
			f basename asLowercase = 'build.xml' ])
				ifTrue: [ #() ]
				ifFalse: [ each directories ] ].        
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> extractDeprecatedGraphicalComponentsFrom: graphicalComponents [
	<gtExample>
	graphicalComponents select: [ :each |
		each providerTypes anySatisfy: [ :provider |
			provider isAnnotatedWith: 'Deprecated'] ]
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> extractDeprecatedGraphicalComponentsSlidesFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 80;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #extractGraphicalComponentsFrom:.
				self codeFromSelector: #extractDeprecatedGraphicalComponentsFrom:
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> extractGraphicalComponentsFrom: model [
	<gtExample>
	| graphicalComponents |
	graphicalComponents := model allModelClasses select: [ :aClass |
		aClass superclassHierarchyGroup anySatisfy: [ :aSuperclass |
			aSuperclass mooseName = 'java::awt::Component' ] ]
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> feenkSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 1.1;
		element: [| container form |
				form := PNGReadWriter formFromFileNamed: (GtResourceReference
						path: Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'feenk.png') fullName.
BlElement new 
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			layout: BlLinearLayout horizontal;
				addChild: (
					BlElement new
						constraintsDo: [ :c |
							c horizontal matchParent.
							c vertical fitContent.
							c linear vertical alignCenter ];
						layout: BlLinearLayout vertical;
						addChild: (BrVerticalPane new 
							constraintsDo: [ :c |
								c linear horizontal alignCenter ];
							addChild: (form asElement asScalableElement maxScale: 0.2; constraintsDo: [:c | c horizontal matchParent. c vertical matchParent]); hExact: 400; vExact: 200);
						addChild: (BlTextElement new 
							constraintsDo: [ :c |
								c linear horizontal alignCenter ];
							text: (('we make your systems explainable.' asRopedText glamorousRegularFont bold fontSize: 30))))
				]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> filterUsedDeprecatedClassesFrom: deprecatedClasses [
	<gtExample>
	| stillUsedClasses |

	stillUsedClasses := deprecatedClasses select: [ :each |
		(each isAnnotatedWith: 'Deprecated') and: [
			each clientTypes isNotEmpty ] ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> getArgoUMLModel [
	<gtExample>
	<noTest>
	| model |
	model := MooseModel root allModels detect: [ :each | 
		each name = 'ArgoUML-0-34' ]
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> loadArgoMULSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 20;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #downloadArgoUMLCodeAndMSE. 
				self codeFromSelector: #loadMSEModelIntoImage.
				self codeFromSelector: #saveTheModel:
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> loadMSEModelIntoImage [
	<gtExample>
	<noTest>
	"Load the MSE file into a FAMIX model. Takes a few minutes"
	| modelFile model |
	modelFile := (FileLocator imageDirectory / 
		'models') asFileReference
			/ 'ArgoUML-0-34'
			/ 'ArgoUML-0-34.mse'.
	model := MooseModel new
		importMSEFromFile: modelFile.
	model
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> openArgoUmlReportOn: model [
	<gtExample>
	GtArgoUMLReport onModel: model
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> openArgoUmlReportSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 90;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #openArgoUmlReportOn:
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> saveTheModel: model [
	<gtExample>
	"Save the model so we can reuse it other sides"
	MooseModel root add: model
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Analyzing Java systems' asRopedText 
			fontSize: 50;
			glamorousRegularFont;
			bold);
		subtitleWithFormat: ('use case' asRopedText 
			fontSize: 40;
			glamorousRegularFont;
			thin)
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeBuildFilesFrom: interestingDirectories [
	<gtExample>
	| view |
	view := GtMondrian new.
	view nodes
		stencil: [ :each |
			BlElement new
				size: 5@5;
				geometry: BlCircle new;
            background: ((each files anySatisfy: [ :f |
					f basename asLowercase = 'build.xml'])
						ifTrue: [  Color red]
						ifFalse: [Color gray])  ];
		with: interestingDirectories.
	view edges connectFrom: #parent.
	view layout tree. 
	view
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> visualizeBuildFilesSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 70;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #extractBuildFoldersAndFilesFromModel:.
				self codeFromSelector: #visualizeBuildFilesFrom:.
				
				self codeFromSelector: #visualizeXMLFileTargets
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesFor: stillUsedClasses [
	<gtExample>
	| view |
	view := GtMondrian new. 
	
	view nodes
		stencil: [:each |
			BlElement new
				size: 5@5;
				geometry: BlCircle new;
				background:((each isAnnotatedWith: 'Deprecated')
					ifTrue: [Color red]
					ifFalse: [Color gray]) ];
		with: (stillUsedClasses, (stillUsedClasses flatCollect: #clientTypes)) asSet.

	view edges connectFromAll: #clientTypes. 
	view layout force. 
	view
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesWithMethodWithUsageSizeFor: stillUsedClasses [
	<gtExample>
	| deprecateMethods clientMethods interestingMethods view |
	deprecateMethods := (stillUsedClasses flatCollect: #methods)
		select: [ :aMethod | aMethod clientTypes notEmpty ].
	clientMethods := (deprecateMethods collect: [ :aMethod | 
		aMethod clientMethods reject: [ :each | 
	each parentType = aMethod parentType ] ]) flatten.
	interestingMethods := deprecateMethods, clientMethods.
	
	view := GtMondrian new.
	view nodes 
		stencil: [ :each |
			BlElement new 
				padding: (BlInsets all: 2);
				constraintsDo: [:c | 
					c horizontal fitContent.
					c vertical fitContent ];
				background: ((each isAnnotatedWith: 'Deprecated')
					ifTrue: [ Color lightRed ]
					ifFalse: [ Color veryLightGray ]) ];
		with: (stillUsedClasses, 
			(stillUsedClasses flatCollect: #clientTypes)) asSet;
		forEach: [ :aClass |
			view nodes
				stencil: [ :each |
					BlElement new
						margin: (BlInsets all: 2);
						geometry: BlCircle new;
						size: ((each parentType 
							isAnnotatedWith: 'Deprecated')
								ifTrue: [ (each clientMethods 
									intersection: clientMethods) size + 5  ]
								ifFalse: [ 5 ]) asPoint;
						background: Color gray ];
				with:(aClass methods intersection: interestingMethods).
			view layout rectanglePack ].
	view edges connectFromAll: #clientTypes.
	view layout force
		strength: 0.15;
		charge: -250;
		length: 70.
	view
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesWithMethodWithUsageSizeSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 60;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #extractAllDeprecatedClassesFrom:.
				self codeFromSelector: #filterUsedDeprecatedClassesFrom:.
				self codeFromSelector: #visualizeDeprecatedClassesWithMethodWithUsageSizeFor:
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesWithMethodsFor: stillUsedClasses [
	<gtExample>
	| deprecateMethods clientMethods interestingMethods view |
	deprecateMethods := (stillUsedClasses flatCollect: #methods)
		select: [ :aMethod | aMethod clientTypes notEmpty ].
	clientMethods := (deprecateMethods collect: [ :aMethod | 
		aMethod clientMethods reject: [ :each | 
	each parentType = aMethod parentType ] ]) flatten.
	interestingMethods := deprecateMethods, clientMethods.
	
	view := GtMondrian new.
	view nodes 
		stencil: [ :each |
			BlElement new 
				background: ((each isAnnotatedWith: 'Deprecated')
					ifTrue: [ Color lightRed ]
					ifFalse: [ Color veryLightGray ]) ];
		with: (stillUsedClasses, 
			(stillUsedClasses flatCollect: #clientTypes)) asSet;
		forEach: [ :aClass |
			view nodes
				stencil: [ :each |
					BlElement new 
						size: 5@5;
						background: Color gray ];
				with:(aClass methods intersection: interestingMethods).
			view layout grid ].
	view edges connectFromAll: #clientTypes.
	view layout force
		strength: 0.15;
		charge: -250;
		length: 70.
	view
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesWithMethodsSlidesFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 50;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #extractAllDeprecatedClassesFrom:.
				self codeFromSelector: #filterUsedDeprecatedClassesFrom:.
				self codeFromSelector: #visualizeDeprecatedClassesWithMethodsFor:
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesWithSizeFor: stillUsedClasses [
	<gtExample>
	| view |
	view := GtMondrian new.
	view nodes 
		stencil: [ :each |
			BlElement new 
				size: (each numberOfMethods min: 50) asPoint;
				geometry: BlCircle new;
				background: ((each isAnnotatedWith: 'Deprecated')
					ifTrue: [ Color red ]
					ifFalse: [ Color gray ]);
				border: (BlBorder paint: 
					((each mooseName includesSubstring: '::ui')
						ifTrue: [ Color blue ]
						ifFalse: [ Color transparent ])) ];
		with: (stillUsedClasses, 
			(stillUsedClasses flatCollect: #clientTypes)) asSet.
	view edges connectFromAll: #clientTypes.
	view layout force
		strength: 0.15;
		charge: -250;
		length: 70.
	view
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesWithSizeSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 40;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #extractAllDeprecatedClassesFrom:.
				self codeFromSelector: #filterUsedDeprecatedClassesFrom:.
				self codeFromSelector: #visualizeDeprecatedClassesWithSizeFor:
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesWithUIBorderFor: stillUsedClasses [
	<gtExample>
	| view |
	view := GtMondrian new. 
	
	view nodes
		stencil: [:each |
			BlElement new
				size: 5@5;
				geometry: BlCircle new;
				background:((each isAnnotatedWith: 'Deprecated')
					ifTrue: [Color red]
					ifFalse: [Color gray]);
				border: (BlBorder paint: 
					((each mooseName includesSubstring: '::ui')
						ifTrue: [ Color blue ]
						ifFalse: [ Color transparent ])) ];
		with: (stillUsedClasses, (stillUsedClasses flatCollect: #clientTypes)) asSet.

	view edges connectFromAll: #clientTypes. 
	view layout force. 
	view
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassessSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 30;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #extractAllDeprecatedClassesFrom:.
				self codeFromSelector: #filterUsedDeprecatedClassesFrom:.
				self codeFromSelector: #visualizeDeprecatedClassesFor:
			}) asElement. ]
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassessWithUIBorderSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 31;
		element: [
			(GtPlaygroundLiveSlide new snippets: {
				self codeFromSelector: #getArgoUMLModel. 
				self codeFromSelector: #extractAllDeprecatedClassesFrom:.
				self codeFromSelector: #filterUsedDeprecatedClassesFrom:.
				self codeFromSelector: #visualizeDeprecatedClassesWithUIBorderFor:
			}) asElement. ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeXMLFileTargets [
	|interestingDirectories xmlDoc tags view|
	xmlDoc := XMLDOMParser parse: (interestingDirectories at: 8) / 'build.xml'.
	tags := xmlDoc // 'target'.
	view := GtMondrian new.
	view nodes 
		stencil: [ :each | 
			BrLabel new
				text: (each attributeAt: #name);
				aptitude: BrGlamorousLabelAptitude ];
		with: tags.
	view edges 
		shape: [ :each |
			BlParabollaArcElement new 
				zIndex: 0;
				curvatureFraction: 0.2;
				border: (BlBorder paint: (Color gray alpha: 0.2) width: 2);
				toHead: (BlArrowheadSimpleArrow new
					border: (BlBorder builder 
						paint: (Color gray alpha: 0.2); width: 2; build))  ];
		connectFromAll:  [ :aTag | |depends|
			depends :=(aTag @ 'depends') stringValue splitOn: ', '.
				tags select: [ :each | 
					depends includes: (each @ 'name') stringValue] ].
	view layout horizontalDominanceTree.
	view.

]
