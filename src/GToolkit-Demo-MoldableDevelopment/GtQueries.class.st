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
				titleText: ('Queries' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
			(GtSlideshowSlide new
				textWithFormat: 'Want to learn more about the Pharo syntax? Follow the show below' asRopedText glamorousRegularFont;
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
				titleText: ('Binary' asRopedText
						fontSize: 40;
						glamorousRegularFont)).
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
