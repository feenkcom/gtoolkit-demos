Class {
	#name : #GtTour,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'api - instantiation' }
GtTour >> create [
	| show |
	show := GtSlideShow new.
	show slides: { 
		GtFilePictureSlide new fileReference: (GtIcebergUtility resourceAtPath: (Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'gtoolkit.png')).

		GtTitleSlide new
			titleText: ('moldable development environment' asRopedText fontSize: 50; glamorousRegularFont).
		GtTextAndElementSlide new 
			element: [ GtRawViewsSlide new asElement ];
			textWithFormat: ('Consider how these different objects look quite similar in the inspector' asRopedText glamorousRegularFont; foreground: Color gray).
		GtTextAndElementSlide new 
			element: [ GtCustomViewsSlide new asElement ];
			textWithFormat: ('Yet, when we change the view, the differences are obvious' asRopedText glamorousRegularFont; foreground: Color gray).
		GtTextAndElementSlide new 
			element: [ GtAllViewsSlide new asElement ];
			textWithFormat: ('Every object is different, and the environment should show it, too' asRopedText glamorousRegularFont; foreground: Color gray).
	
"		GtTitleSlide new
			titleText: ('components' asRopedText fontSize: 50; glamorousRegularFont).
		GtTextAndElementSlide new 
			element: [ GtAllViewsSlide new asElement ];
			textWithFormat: ('Glamorous Toolkit is made of multiple programmable components' asRopedText glamorousRegularFont; foreground: Color gray).
		GtComponentsSlide new.
"	
		GtTitleSlide new
			titleText: ('live programming and inspection' asRopedText fontSize: 50; glamorousRegularFont).

		GtElementSlide new element: [GtExplainerExamples new inspectorOnOneObjectExample ].

		GtTitleSlide new
			titleText: ('moldable inspection' asRopedText fontSize: 50; glamorousRegularFont).
		
		GtTitleSlide new
			titleText: ('coding' asRopedText fontSize: 50; glamorousRegularFont).
		GtElementSlide new element: [GtInspector createOnPlayBook: (GtClassCoder forClass: GtClassCoder)].

		GtTitleSlide new
			titleText: ('moldable coding' asRopedText fontSize: 50; glamorousRegularFont).
		
		GtTitleSlide new
			titleText: ('querying' asRopedText fontSize: 50; glamorousRegularFont).
		GtTextAndElementSlide new 
			element: [ GtAllViewsSlide new asElement ];
			textWithFormat: ('Inspect the result of this query. Expand the methods' asRopedText glamorousRegularFont; foreground: Color gray).
		GtPlaygroundSlide new snippets: {'#gtView gtPragmas'}.
		GtTextAndElementSlide new 
			element: [ GtAllViewsSlide new asElement ];
			textWithFormat: ('Now, try with this composed query. Notice the highlighting' asRopedText glamorousRegularFont; foreground: Color gray).
		GtPlaygroundSlide new snippets: {'#gtView gtPragmas & #list gtReferences'}.
		
		GtTitleSlide new
			titleText: ('moldable search' asRopedText fontSize: 50; glamorousRegularFont).
		GtTextAndElementSlide new 
			element: [ GtSpotterSlide new asElement ];
			textWithFormat: ('Search is pervasive. Try searching for Object' asRopedText glamorousRegularFont; foreground: Color gray).
		GtTextAndElementSlide new 
			element: [ GtSpotterSlide new asElement ];
			textWithFormat: (('Or search for .', FileSystem disk delimiter asString) asRopedText glamorousRegularFont; foreground: Color gray).
		

		GtTitleSlide new
			titleText: ('live documents' asRopedText fontSize: 50; glamorousRegularFont).
		GtElementSlide new element: [GtInspector createOnPlayBook: (GtDocument forClass: BaselineOfGToolkit)].
		
		GtTitleSlide new
			titleText: ('tracing variables' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtDebuggerOnRopeSlide new.
		
		GtTitleSlide new
			titleText: ('platform' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtElementSlide new element: [GtInspector createOnPlayBook: (GtClassCoder forClass: JSParser)].
	}.
	^ show
]
