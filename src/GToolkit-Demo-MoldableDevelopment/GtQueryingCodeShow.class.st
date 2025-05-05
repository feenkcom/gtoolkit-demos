Class {
	#name : #GtQueryingCodeShow,
	#superclass : #Object,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#category : #'GToolkit-Demo-MoldableDevelopment-Slideshows'
}

{ #category : #accessing }
GtQueryingCodeShow >> binaryFiltersTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 18;
		titleWithFormat: ('Binary Filters' asRopedText
			fontSize: 40;
			glamorousRegularFont).
]

{ #category : #accessing }
GtQueryingCodeShow >> classFiltersExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 29;
		newText: 'Used to search for class related informations. For example:';
		element: [GtPlaygroundLiveSlide new
			snippets: {'"Classes in the current image"
filter := GtSearchImageClassesFilter new.'.
'"Classes in a package"
filter := GtSearchClassesInPackageFilter forPackageNamed: ''GToolkit-Coder-Examples-SystemS1''.'.
'"Deprecated classes"
filter := GtSearchDeprecatedClassesFilter new.'.
'"Test classes"
filter := GtSearchTestClassesFilter new.'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> classFiltersTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 28;
		titleWithFormat: ('Class Filters' asRopedText
			fontSize: 40;
			glamorousRegularFont).
]

{ #category : #accessing }
GtQueryingCodeShow >> classesAndPackagesFiltersIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 25;
		newTextWithFormat: ('Filters can also be extended to return a list of classes or packages' asRopedText 
			glamorousRegularFont;
			fontSize: 20).
]

{ #category : #examples }
GtQueryingCodeShow >> explanationTextOnPragmaAndReferenceExampleResult [
	| text |
	
	text := 'Executing the query opens an ' asRopedText,
('inspector' asRopedText glamorousExplanationFor: #inspector),
' on the result of the query which, in this case, is an instance of ' asRopedText,
('GtSearchIntersectionFilter' asRopedText glamorousExplanationFor: #inspector),
'.
The filter instance knows how to present itself through a ' asRopedText,
('view' asRopedText glamorousExplanationFor: #view),
' through which the inspector diligently shows method widgets. In addition to showing the method code, these method widgets also know how to match the input query to the abstract syntax tree (AST) nodes to produce the orange highlighting.' asRopedText.

	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtQueryingCodeShow >> filtersCategoriesIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 12;
		newTextWithFormat: ('So let''s take a closer look at them' asRopedText 
			glamorousRegularFont;
			fontSize: 20).
]

{ #category : #accessing }
GtQueryingCodeShow >> filtersCompositionExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 9;
		newText: 'Using & and | message we search for all view methods that implement either a list or a columned list';
		element: [GtPlaygroundLiveSlide new
			snippets: {'#gtView gtPragmas & (#list gtReferences | #columnedList gtReferences)'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> filtersCompositionIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 8;
		newTextWithFormat: ('And it gets even better. Since the queries are plain Pharo code, they can be easily extensible and filters can be composed.' asRopedText
			glamorousRegularFont;
			fontSize:20).
]

{ #category : #accessing }
GtQueryingCodeShow >> filtersTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 10;
		titleWithFormat: ('Filters' asRopedText
			fontSize: 70;
			glamorousRegularFont).
]

{ #category : #examples }
GtQueryingCodeShow >> filtersTreeExample [
	<gtExample>
	<return: #BlElement>
	| filtersTreeElement |
	filtersTreeElement := (GtPhlowView empty composite
			views: {GtSearchFilter gtHierarchyFor: GtPhlowView empty};
			labelled: 'a GtABAddressBook (Cartoons)' asRopedText) asElementDo: [ :e | e ].

	^ BlElement new
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ];
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild: filtersTreeElement
]

{ #category : #accessing }
GtQueryingCodeShow >> filtersTreeExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 11;
		newText: 'There already exists a number of filters readily available';
		element: [ self filtersTreeExample ].
]

{ #category : #examples }
GtQueryingCodeShow >> inspectorResultOnPragmaAndReferenceExample [
	<gtExample>
	<return: #BlElement>
	| inspectorContainer subject inspectorHeader inspectorViewTitle inspectorLabel verticalContainer |
	verticalContainer := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent.
				c padding: (BlInsets all: 5) ];
			layout: BlLinearLayout vertical.

	inspectorLabel := BrLabel new
			text: ('Inspector on query result' asRopedText
					glamorousRegularFont;
					fontSize: 15;
					foreground: Color gray);
			margin: (BlInsets
					top: 20
					right: 0
					bottom: 0
					left: 10);
			aptitude: BrGlamorousLabelAptitude new.

	inspectorContainer := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			layout: BlLinearLayout horizontal;
			background: Color white;
			margin: (BlInsets all: 10);
			aptitude: BrShadowAptitude.

	verticalContainer
		addChild: inspectorLabel;
		addChild: inspectorContainer.

	subject := (self pragmaAndReferenceQueryExample gtViewsFor: GtPhlowView empty)
			asElementDo: [ :e | e ].
	inspectorContainer addChild: subject.

	inspectorHeader := subject phlow firstChildWithViewTitle.
	inspectorViewTitle := subject phlow firstChildWithViewContent phlow
			firstChildWithViewTitle.

	inspectorHeader
		addChild: (BrButton new
				constraintsDo: [ :c | 
					c ignoreByLayout.
					c ignored horizontal alignLeft.
					c ignored vertical alignCenter ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #inspector)).
	inspectorViewTitle
		addChild: (BrButton new
				constraintsDo: [ :c | 
					c ignoreByLayout.
					c ignored horizontal alignLeft.
					c ignored vertical alignCenter ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #view)).

	^ verticalContainer
]

{ #category : #accessing }
GtQueryingCodeShow >> intersectionFilterExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 19;
		newText: 'Here we have the intersection filter, obtained using the & message';
		element: [GtPlaygroundLiveSlide new
			snippets: {'filter1 := #gtExample gtPragmas.
filter2 := #filter gtReferences.
intersection := filter1 & filter2.'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 5;
		newTextWithFormat: ('One of the design principles behind Glamorous Toolkit is that search must be universal. This is achieved using queries' asRopedText
			glamorousRegularFont;
			fontSize: 20).
]

{ #category : #accessing }
GtQueryingCodeShow >> methodFiltersExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 15;
		newText: 'They can be applied to match methods, for example:';
		element: [GtPlaygroundLiveSlide new
			snippets: {'"Methods with a certain name"
#printString gtImplementors'.
'"Methods with a certain expression in the source code. For example, here we are searching for code that looks like 
	filter matches: something"
''filter matches: ``@a'' gtASTMatches'.
'"Methods with a certain substring in the source code"
''children: #children'' gtSubstringMatch'.
'"Methods with a certain annotation"
#gtView gtPragmas'.
'"Or methods that reference another method"
#printString gtReferences'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> methodFiltersExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 14;
		newTextWithFormat: ('They are called method filters because they always return a list of methods' asRopedText 
			glamorousRegularFont;
			fontSize: 20).
]

{ #category : #accessing }
GtQueryingCodeShow >> methodFiltersForClassesAndPackagesExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 17;
		newText: 'Method filters can also be applied to match classes and packages, for example:';
		element: [GtPlaygroundLiveSlide new
			snippets: {'"All methods in a certain class"
''GtSearchMethodFilterExamples'' gtClassMatches'.
'"All methods in a certain package"
''GToolkit-Docs'' gtPackageMatches'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> methodFiltersTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 13;
		titleWithFormat: ('Method Filters' asRopedText
			fontSize: 40;
			glamorousRegularFont).
]

{ #category : #accessing }
GtQueryingCodeShow >> negationFilterExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 22;
		newText: 'This one gets a filter and searches for the opposite of that filter';
		element: [GtPlaygroundLiveSlide new
			snippets: {'"All packages that are not deprecated"
basicFilter := GtSearchDeprecatedPackagesFilter new.
negationFilter := GtSearchNegationFilter new
	originalFilter: basicFilter.'.
'"All methods that define a view and do not specify the priority"
#gtView gtPragmas & #priority: gtReferences not'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> negationFilterTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 21;
		titleWithFormat: ('Negation Filter' asRopedText
			fontSize: 40;
			glamorousRegularFont).
]

{ #category : #accessing }
GtQueryingCodeShow >> nullFilterExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 24;
		newText: 'A filter that doesn''t match anything. It returns false for everything';
		element: [GtPlaygroundLiveSlide new
			snippets: {'filter := GtSearchNullFilter new.
filter size'.
'BrList allSubclasses 
	inject: GtSearchNullFilter new
	into: [:union :each | union | each gtReferences ]'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> nullFilterTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 23;
		titleWithFormat: ('Null Filter' asRopedText
			fontSize: 40;
			glamorousRegularFont).
]

{ #category : #accessing }
GtQueryingCodeShow >> packageFiltersExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 27;
		newText: 'They allow us to search for package related informations. For example:';
		element: [GtPlaygroundLiveSlide new
			snippets: {'"Packages in the current image"
filter := GtSearchImagePackagesFilter new.'.
'"Deprecated packages"
filter := GtSearchDeprecatedPackagesFilter new.'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> packageFiltersTitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 26;
		titleWithFormat: ('Package Filters' asRopedText
			fontSize: 40;
			glamorousRegularFont).
]

{ #category : #examples }
GtQueryingCodeShow >> pragmaAndReferenceQueryExample [
	<gtExample>
	<return: #GtSearchIntersectionFilter>
	^ #gtView gtPragmas & GtPharoMethodCoder gtReferences
]

{ #category : #accessing }
GtQueryingCodeShow >> queryResultExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: self explanationTextOnPragmaAndReferenceExampleResult;
		element: [self inspectorResultOnPragmaAndReferenceExample].
]

{ #category : #accessing }
GtQueryingCodeShow >> referenceFiltersExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 16;
		newText: 'Reference filters can match not only methods but classes, global variables and literal values';
		element: [GtPlaygroundLiveSlide new
			snippets: {'"Class"
GtSearchReferencesFilter gtReferences'.
'"Array"
#(4 2) gtReferences'.
'"Literal value: number"
42 gtReferences'.
'"Literal value: symbol"
#list gtReferences'.};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> searchForGtViewAnnotationsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 6;
		newText: 'Let''s start with an example: a search for all methods that are annoted with <gtView> and reference the GtMethodCoder class';
		element: [GtPlaygroundLiveSlide new
			snippets: {'#gtView gtPragmas & GtPharoMethodCoder gtReferences'};
			asElement].
]

{ #category : #accessing }
GtQueryingCodeShow >> slideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 2;
		textWithFormat: 'This slideshow relies on pharo syntax. Follow the tutorial below if you want to learn more about that first' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtPharo101 new ] withTitle: 'Pharo101'.
]

{ #category : #accessing }
GtQueryingCodeShow >> title: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Querying Pharo code' asRopedText
			fontSize: 50;
			bold;
			glamorousRegularFont);
		subtitleWithFormat: ('use case' asRopedText
			fontSize: 40;
			thin;
			glamorousRegularFont).
]

{ #category : #accessing }
GtQueryingCodeShow >> unionFiltersExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 20;
		newText: 'And the union filter, obtained using the | message';
		element: [GtPlaygroundLiveSlide new
			snippets: {'filter1 := #unionDifferentMethods gtImplementors.
filter2 := #foo gtImplementors.
union := filter1 | filter2.'};
			asElement].
]
