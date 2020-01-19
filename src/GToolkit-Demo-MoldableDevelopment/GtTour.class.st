Class {
	#name : #GtTour,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'api - instantiation' }
GtTour >> create [
	| show |
	show := GtSlideShow new.
	show
		slides:
			{(GtFilePictureSlide new
				fileReference:
					(GtResourceReference
						path: Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'gtoolkit.png')).
			(GtTitleSlide new
				titleText:
					('moldable development environment' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtTextAndElementSlide new
				element: [ GtRawViewsSlide new asElement ];
				textWithFormat:
					('Consider how these different objects look quite similar in the inspector'
						asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTextAndElementSlide new
				element: [ GtCustomViewsSlide new asElement ];
				textWithFormat:
					('Yet, when we change the view, the differences are obvious'
						asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTextAndElementSlide new
				element: [ GtAllViewsSlide new asElement ];
				textWithFormat:
					('Every object is different, and the environment should show it, too'
						asRopedText
						glamorousRegularFont;
						foreground: Color gray)).

			"		GtTitleSlide new
			titleText: ('components' asRopedText fontSize: 50; glamorousRegularFont).
		GtTextAndElementSlide new 
			element: [ GtAllViewsSlide new asElement ];
			textWithFormat: ('Glamorous Toolkit is made of multiple programmable components' asRopedText glamorousRegularFont; foreground: Color gray).
		GtComponentsSlide new.
"
			(GtTitleSlide new
				titleText:
					('live programming and inspection' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element: [ GtExplainerExamples new inspectorOnOneObjectExample ]).
			(GtTitleSlide new
				titleText:
					('moldable coding' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element: [ GtInspector withToolOn: (GtClassCoder forClass: GtClassCoder) ]).
			(GtTitleSlide new
				titleText:
					('querying' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtTextAndElementSlide new
				element: [ (GtPlaygroundSlide new snippets: {'#gtView gtPragmas'}) create ];
				textWithFormat:
					('Inspect the result of this query. Expand the methods' asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTextAndElementSlide new
				element: [ (GtPlaygroundSlide new
					snippets: {'#gtView gtPragmas & #list gtReferences'})
					create ];
				textWithFormat:
					('Now, try with this composed query. Notice the highlighting'
						asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTitleSlide new
				titleText:
					('moldable search' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtTextAndElementSlide new
				element: [ GtSpotterSlide new asElement ];
				textWithFormat:
					('Search is pervasive. Try searching for Object' asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTextAndElementSlide new
				element: [ GtSpotterSlide new asElement ];
				textWithFormat:
					(('Or search for .' , FileSystem disk delimiter asString) asRopedText
						glamorousRegularFont;
						foreground: Color gray)).
			(GtTitleSlide new
				titleText:
					('live documents' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element:
					[ GtInspector withToolOn: (GtDocument forClass: BaselineOfGToolkit) ]).
"			(GtTitleSlide new
				titleText:
					('tracing variables' asRopedText
						fontSize: 50;
						fontName: 'Helvetica Neue';
						bold;
						yourself)).
			GtDebuggerOnRopeSlide new."
			(GtTitleSlide new
				titleText:
					('platform' asRopedText
						fontSize: 50;
						fontName: 'Helvetica Neue';
						bold;
						yourself)).
			(GtElementSlide new
				element: [ GtInspector withToolOn: (GtClassCoder forClass: JSParser) ])}.
	^ show
]

{ #category : #'api - instantiation' }
GtTour >> treemapWithViewsAndExamples [
	<gtExample>
	| tree |
	tree := GtNestedTreeBuilder new
			data: (Smalltalk allClassesAndTraits select: [:c | 
			{'Gt'.'Bl'.'Br'} anySatisfy: [:p |c name beginsWith: p]]);
		groupBy: [ :aClass | aClass package ];
		groupBy: [ :aClass | aClass package classTags detect: [ :e | e hasClass: aClass ] ];
		weight: [ :aClass | aClass methods size max: 1];
		build.
	^ GtNestedRectangleTreeMap new
		roots: { tree };
		leaves: [ :aNode | aNode leaves ];
		deep: [ :aNode | aNode nodes ];
		leavesSize: [ :aNode | aNode weight ];
		containerElement: [ :anElement :aNodeContext | 
			aNodeContext level = 2 ifTrue: [ 
				anElement addChild: (BrLabel new 
					text: (aNodeContext  model name name removePrefix: 'GToolkit-'); 
					look: (BrGlamorousLabelLook new fontSize: 8; foreground: Color gray); 
					constraintsDo: [ :c | c ignoreByLayout. ])].
			anElement border: (BlBorder 
				paint: (Color gray alpha: 0.7 / aNodeContext level) 
				width: 1).
			anElement padding: (BlInsets all: 1) ];
		leafElement: [ :anElement :aLeafContext | 
			| isGtView isGtExample |
			isGtView := aLeafContext model item itOrItsSuperclassesDefineGTViews.
			isGtExample := aLeafContext model item methods anySatisfy: [ :aMethod | 
				aMethod isGTExampleMethod ].
			anElement border: (BlBorder 
				paint: (Color gray alpha: 0.5 / aLeafContext level) 
				width: 1).
			anElement background: (isGtView 
				ifTrue: [(Color blue alpha: 0.6)] 
				ifFalse: [ 
					isGtExample 
						ifTrue: [ Color green muchDarker alpha: 0.6] 
						ifFalse: [ Color transparent ]]) ];
		create.
]
