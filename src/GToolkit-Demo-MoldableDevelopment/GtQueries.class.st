Class {
	#name : #GtQueries,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'api - instantiation' }
GtQueries >> create [
	| show |
	show := GtSlideShow new.
	show
		slides:
			{(GtTitleSlide new
				titleText: ('Querying Code' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
			(GtSlideshowSlide new
				textWithFormat: 'This slideshow relies on pharo syntax. Follow the tutorial below if you want to learn more about that first' asRopedText glamorousRegularFont;
				slideshow: [ GtPharo101 new create ] withTitle: 'Pharo101').
			(GtTextSlide new
				newTextWithFormat: ('One of the design principles behind Glamorous Toolkit is that search must be universal. This is achieved using queries' asRopedText
					glamorousRegularFont;
					fontSize: 20)).
			(GtLabelAndElementSlide new
				text: 'Let''s start with an example: a search for all methods that are annoted with <gtView> and reference the GtMethodCoder class';
				element: [GtPlaygroundSlide new
					snippets: {'#gtView gtPragmas & GtMethodCoder gtReferences'};
					asElement]).
			(GtTextAndElementSlide new
				newTextWithFormat: self explanationTextOnPragmaAndReferenceExampleResult;
				element: [self inspectorResultOnPragmaAndReferenceExample]).
			(GtTextSlide new
				newTextWithFormat: ('And it gets even better. Since the queries are plain Pharo code, they can be easily extensible and filters can be composed.' asRopedText
					glamorousRegularFont;
					fontSize:20)).
			(GtLabelAndElementSlide new
				text: 'Using & and | message we search for all view methods that implement either a list or a columned list';
				element: [GtPlaygroundSlide new
					snippets: {'#gtView gtPragmas & (#list gtReferences | #columnedList gtReferences)'};
					asElement]).
			(GtTitleSlide new
				titleText: ('Filters' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				text: 'There already exists a number of filters readily available';
				element: [(GtSearchFilter gtHierarchyFor: GtPhlowView empty) 
					asElementDo: [ :e | e ]]).
			(GtTextSlide new
				newTextWithFormat: ('So let''s take a closer look at them' asRopedText glamorousRegularFont; fontSize: 20)).
			(GtTitleSlide new
				titleText: ('Method Filters' asRopedText
						fontSize: 40;
						glamorousRegularFont)).
			(GtTextSlide new
				newTextWithFormat: ('They are called method filters because they always return a list of methods' asRopedText glamorousRegularFont; fontSize: 20)).
			(GtLabelAndElementSlide new
				text: 'They can be applied to match methods, for example:';
				element: [GtPlaygroundSlide new
					snippets: {'"Methods with a certain name"
#printString gtImplementors'.
'"Methods with a certain expression in the source code"
''filter matches: ``@a'' gtASTMatches'.
'"Methods with a certain subsrting in the source code"
''children: #children'' gtSubstringMatch'.
'"Methods with a certain annotation"
#gtView gtPragmas'.
'"Or methods that reference another method"
#printString gtReferences'};
					asElement]).
			(GtLabelAndElementSlide new
				text: 'Reference filters can match not only methods but classes, global variables and literal values';
				element: [GtPlaygroundSlide new
					snippets: {'"Class"
GtSearchReferencesFilter gtReferences'.
'"Array"
#(4 2) gtReferences'.
'"Literal value: number"
42 gtReferences'.
'"Literal value: symbol"
#list gtReferences'.};
					asElement]).
			(GtLabelAndElementSlide new
				text: 'Method filters can also be applied to match classes and packages, for example:';
				element: [GtPlaygroundSlide new
					snippets: {'"All methods in a certain class"
''GtSearchMethodFilterExamples'' gtClassMatches'.
'"All methods in a certain package"
''GToolkit-Docs'' gtPackageMatches'};
					asElement]).
			(GtTitleSlide new
				titleText: ('Binary Filters' asRopedText
						fontSize: 40;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				text: 'Here we have the intersection filter, obtained using the & message';
				element: [GtPlaygroundSlide new
					snippets: {'filter1 := #gtExample gtPragmas.
filter2 := #filter gtReferences.
intersection := filter1 & filter2.'};
					asElement]).
			(GtLabelAndElementSlide new
				text: 'And the union filter, obtained using the | message';
				element: [GtPlaygroundSlide new
					snippets: {'filter1 := #unionDifferentMethods gtImplementors.
filter2 := #foo gtImplementors.
union := filter1 | filter2.'};
					asElement]).
			(GtTitleSlide new
				titleText: ('Negation Filter' asRopedText
						fontSize: 40;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				text: 'This one gets a filter and searches for the opposite of that filter';
				element: [GtPlaygroundSlide new
					snippets: {'"All packages that are not deprecated"
basicFilter := GtSearchDeprecatedPackagesFilter new.
negationFilter := GtSearchNegationFilter new
	originalFilter: basicFilter.'.
'"All methods that define a view and do not specify the priority"
#gtView gtPragmas & #priority: gtReferences not'};
					asElement]).
			(GtTitleSlide new
				titleText: ('Null Filter' asRopedText
						fontSize: 40;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				text: 'A filter that doesn''t match anything. It returns false for everything';
				element: [GtPlaygroundSlide new
					snippets: {'filter := GtSearchNullFilter new.
filter size'.
'BrList allSubclasses 
	inject: GtSearchNullFilter new
	into: [:union :each | union | each gtReferences ]'};
					asElement]).
			(GtTextSlide new
				newTextWithFormat: ('Filters can also be extended to return a list of classes or packages' asRopedText glamorousRegularFont; fontSize: 20)).
			(GtTitleSlide new
				titleText: ('Package Filters' asRopedText
						fontSize: 40;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				text: 'They allow us to search for package related informations. For example:';
				element: [GtPlaygroundSlide new
					snippets: {'"Packages in the current image"
filter := GtSearchImagePackagesFilter new.'.
'"Deprecated packages"
filter := GtSearchDeprecatedPackagesFilter new.'};
					asElement]).
			(GtTitleSlide new
				titleText: ('Class Filters' asRopedText
						fontSize: 40;
						glamorousRegularFont)).
			(GtLabelAndElementSlide new
				text: 'Used to search for class related informations. For example:';
				element: [GtPlaygroundSlide new
					snippets: {'"Classes in the current image"
filter := GtSearchImageClassesFilter new.'.
'"Classes in a package"
filter := GtSearchClassesInPackageFilter forPackageNamed: ''GToolkit-Coder-Examples-SystemS1''.'.
'"Deprecated classes"
filter := GtSearchDeprecatedClassesFilter new.'.
'"Test classes"
filter := GtSearchTestClassesFilter new.'};
					asElement]).
			}.
	
	^ show.
]

{ #category : #'as yet unclassified' }
GtQueries >> explanationTextOnPragmaAndReferenceExampleResult [
	| text |
	
	text := 'Executing the query opens an ' asRopedText,
('inspector' asRopedText glamorousExplanationFor: #inspector),
' on the result of the query which, in this case, is an instance of ' asRopedText,
('GtSearchIntersectionFilter' asRopedText glamorousExplanationFor: #inspector),
'.
The filter instance knows how to present itself through a ' asRopedText,
('view' asRopedText glamorousExplanationFor: #view),
' through which the inspector diligently shows method widgets. Beside showing the method code, these method widgets also know how to match the input query to the abstract syntax tree (AST) nodes to produce the orange highlighting.' asRopedText.

	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtQueries >> inspectorResultOnPragmaAndReferenceExample [
	<gtExample>
	| inspectorContainer subject inspectorHeader inspectorView inspectorLabel verticalContainer |
	
	verticalContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.
			c padding: (BlInsets all: 5)];
		layout: BlLinearLayout vertical.
	
	inspectorLabel := BrLabel new
		text: ('Inspector on query result' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		look: BrGlamorousLabelLook new.
	
	inspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		background: Color white;
		margin: (BlInsets all: 10);
		look: BrShadowLook.

	subject := BlUseAsyncFeatures
		disableDuring: [ (self pragmaAndReferenceQueryExample gtViewsFor: GtPhlowView empty) asElementDo: [ :e | e ] ].
	subject forceLayout.
	inspectorHeader := subject phlow firstChildWithView.
	inspectorView := inspectorHeader viewContentElement phlow
		firstChildWithView.
	inspectorContainer addChild: subject.
		
	inspectorHeader
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #inspector);
				relocate:
					(5 @ inspectorHeader extent y / 2)). 
	inspectorView
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #view);
				relocate:
					(5 @ inspectorView extent y / 2)).
					
	^ verticalContainer
		addChild: inspectorLabel;
		addChild: inspectorContainer.
]

{ #category : #'as yet unclassified' }
GtQueries >> pragmaAndReferenceQueryExample [
	<gtExample>
	
	^ #gtView gtPragmas & GtMethodCoder gtReferences.
]
