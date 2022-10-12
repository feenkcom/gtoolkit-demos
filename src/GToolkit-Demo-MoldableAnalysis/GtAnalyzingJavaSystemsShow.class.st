"
Inspect the presentation
```
(GtLiveShow createWithArrowsVisible: GtMoldableAnalysisPresentation new) create.		
```

Open the presentation in a new window.
```
space := BlSpace new.
space root addChild: (GtLiveShow createWithArrowsVisible: GtMoldableAnalysisPresentation new) create.
space title: 'Moldable analysis'.
space show			
```


"
Class {
	#name : #GtAnalyzingJavaSystemsShow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableAnalysis'
}

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> buildSystemIntroductionFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 61;
		newTextWithFormat:
			('Ok. So, we went from a question to playing with a custom analysis that makes the whole problem simpler to grasp. Now, let''s look at another problem, this time involving the build script.' asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
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
			copyFrom: notTemp start to: aMethod ast stop) lines 
				do: [ :aLine |
					stream nextPutAll: (aLine removePrefix: String tab) ]
				separatedBy: [ stream cr ] ]
]

{ #category : #utils }
GtAnalyzingJavaSystemsShow >> codeFromSelector: aSelector [
	^ self codeFromMethod: self class >> aSelector
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> downloadArgoUMLCodeAndMSE [
	"Download ArgoUML code and MSE model file"

	<gtExample>
	<noTest>
	| targetFolder archiveFileName archiveUrl |
	"Download ArgoUML code and MSE model file"
	targetFolder := (FileLocator imageDirectory / 'models') asFileReference
			ensureCreateDirectory.
	archiveFileName := 'ArgoUML-0-34.zip'.

	(targetFolder / archiveFileName) exists
		ifFalse: [ archiveUrl := 'https://dl.feenk.com/moose-tutorial/argouml/'.
			ZnClient new
				url: archiveUrl , archiveFileName;
				signalProgress: true;
				downloadTo: targetFolder.
			(ZipArchive new readFrom: targetFolder / archiveFileName)
				extractAllTo: targetFolder ].

	targetFolder
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> enginesSlidesFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 115;
		newFadedText: 'Assessment is a dialog that starts from a question. For it to be effective, we need custom tools.';
		newFadedText: 'To make this practical, we need an environment that makes their creation inexpensive.';
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
	"Find the deprecated classes"
	| deprecatedClasses |
	deprecatedClasses := model allModelClasses select: [ :each |
		each isAnnotatedWith: 'Deprecated' ].
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> extractBuildFoldersAndFilesFromModel: model [
	<gtExample>
	"Find all build.xml files"
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

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> extractGraphicalComponentsFrom: model [
	<gtExample>
	| graphicalComponents |
	graphicalComponents := model allModelClasses select: [ :aClass |
		aClass superclassHierarchyGroup anySatisfy: [ :aSuperclass |
			aSuperclass mooseName = 'java::awt::Component' ] ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> filterUsedDeprecatedClassesFrom: deprecatedClasses [
	<gtExample>
	"Find deprecated classes that have clients (i.e., that are still in use)"
	| stillUsedClasses |

	stillUsedClasses := deprecatedClasses select: [ :each |
		each clientTypes isNotEmpty ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> getArgoUMLModel [
	<gtExample>
	<noTest>
	"Get the model from the global variable"
	| model |
	model := MooseModel root allModels detect: [ :each | 
		each name = 'ArgoUML-0-34' ]
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 2;
		newTextWithFormat:
			('Glamorous Toolkit is a platform for analyzing artifacts statically, too. In this show, we exemplify how that works with a couple of simple scenarios. The first one is this: in a Java system we have a few classes marked as deprecated. Which of these we can remove right now, and how do we deal with those that we cannot remove?' asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> loadArgoMULSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 20;
		newFadedText: ('We first download the case study code and import the model into Glamorous Toolkit.');
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #downloadArgoUMLCodeAndMSE;
				newSnippetFromMethod: self class>> #loadMSEModelIntoImage;
				newSnippetFromMethod: self class>> #saveTheModel: ]
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
	"Run the report"
	GtArgoUMLReport onModel: model
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> openArgoUmlReportSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 90;
		newFadedText: 'We place constraints in a report that we can then run against an input model. It''s like running tests against a database. Ah, and the report can be run from the command line, too.';
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #getArgoUMLModel;
				newSnippetFromMethod: self class>> #openArgoUmlReportOn: ]
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> reportIntroductionFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 71;
		newTextWithFormat:
			('What did we learn? We used the same tools! OK, now, one final thing. If we can build queries and visualizations like that, we can also transform them into constraints that are checked regularly.' asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> saveTheModel: model [
	<gtExample>
	"Add the model to a global variable so that we can reuse it in other slides"
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
	"Visualize where the build.xml files are within the file system."
	| view |
	view := GtMondrian new.
	view nodes
		stencil: [ :each |
			BlElement new
				size: 5@5;
				geometry: BlCircleGeometry new;
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
	^ aSlide labelAndElement
		priority: 70;
		newFadedText: 'The system is based on Ant. So, how do we get an overview? First, we visualize all build.xml files. Second, we take one, and see how the targets depend on each other.' ;
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #getArgoUMLModel;
				newSnippetFromMethod: self class>> #extractBuildFoldersAndFilesFromModel:;
				newSnippetFromMethod: self class>> #visualizeBuildFilesFrom:;
				newSnippetFromMethod: self class>> #visualizeXMLFileTargets: ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassesFor: stillUsedClasses [
	<gtExample>
	"Visualize deprecated classes (in red) together with all their client classes and the interconnections."
	| view |
	view := GtMondrian new. 
	view nodes
		stencil: [:each |
			BlElement new
				size: 5@5;
				geometry: BlCircleGeometry new;
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
						geometry: BlCircleGeometry new;
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
	^ aSlide labelAndElement
		priority: 60;
		newFadedText: 'How large are these methods?';
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #getArgoUMLModel;
				newSnippetFromMethod: self class>> #extractAllDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #filterUsedDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #visualizeDeprecatedClassesWithMethodWithUsageSizeFor: ]
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
	^ aSlide labelAndElement
		priority: 50;
		newFadedText: 'Well, let''s look at the actual methods.';
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #getArgoUMLModel;
				newSnippetFromMethod: self class>> #extractAllDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #filterUsedDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #visualizeDeprecatedClassesWithMethodsFor: ]
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
				geometry: BlCircleGeometry new;
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
	^ aSlide labelAndElement
		priority: 40;
		newFadedText: 'Until now, we visualized classes. But, to remove dependencies to the deprecated classes, we have to affect methods.';
		newFadedText: 'So, we look at how many methods each classes has.';
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #getArgoUMLModel;
				newSnippetFromMethod: self class>> #extractAllDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #filterUsedDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #visualizeDeprecatedClassesWithSizeFor:]
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
				geometry: BlCircleGeometry new;
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
	^ aSlide labelAndElement
		priority: 30;
		newFadedText: ('We find the deprecated classes that are still used. And then we visualize their dependencies to adjacent classes.');
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>>#getArgoUMLModel;
				newSnippetFromMethod: self class>>#extractAllDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>>#filterUsedDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>>#visualizeDeprecatedClassesFor: ]
]

{ #category : #slides }
GtAnalyzingJavaSystemsShow >> visualizeDeprecatedClassessWithUIBorderSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 31;
		newFadedText: 'The previous visualization is exciting, but still generic (you can apply on any Java system). Yet, value is always contextual.';
		newFadedText: 'Instead, let''s map the context we know onto the visualization. For example, in our case we know that the system is split into UI and non-UI, so we highlight that.';
		element: [
			GtPlaygroundLiveSlide new 
				newSnippetFromMethod: self class>> #getArgoUMLModel; 
				newSnippetFromMethod: self class>> #extractAllDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #filterUsedDeprecatedClassesFrom:;
				newSnippetFromMethod: self class>> #visualizeDeprecatedClassesWithUIBorderFor: ]
]

{ #category : #'code examples' }
GtAnalyzingJavaSystemsShow >> visualizeXMLFileTargets: interestingDirectories [
	"For a given build.xml, visualize the target dependencies."
	| xmlDoc tags view|
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
