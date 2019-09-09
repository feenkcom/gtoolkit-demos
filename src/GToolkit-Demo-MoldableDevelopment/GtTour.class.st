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
		GtTitleSlide new
			titleText: ('glamoroustoolkit' asRopedText 
				fontSize: 70; fontName: 'Helvetica Neue'; bold;
				in: [:title | (title from: 1 to: 'glamorous' size) thin];
				yourself).

		GtTitleSlide new
			titleText: ('moldable development environment' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtElementSlide new element: [GtInspector createOnPlayBook: (GtClassCoder forClass: GtClassCoder)].
		
		GtRawViewsSlide new.
		GtCustomViewsSlide new.
		GtAllViewsSlide new.
			
		GtTitleSlide new
			titleText: ('components' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtElementSlide new element: [GtInspector createOnPlayBook: (GtClassCoder forClass: GtClassCoder)].	
			
		GtComponentsSlide new.
	
		GtTitleSlide new
			titleText: ('coder' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtElementSlide new element: [GtInspector createOnPlayBook: (GtClassCoder forClass: GtClassCoder)].
		
		GtTitleSlide new
			titleText: ('querying' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtElementSlide new element: [GtInspector createOnPlayBook: (GtPlayBook newDefault)].
		
		GtTitleSlide new
			titleText: ('spotter' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtSpotterSlide new.
		
		GtTitleSlide new
			titleText: ('one rendering tree' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtEditorElementWithTreeSlide new.
		
		GtTitleSlide new
			titleText: ('combining widgets with visualization' asRopedText 
				fontSize: 50; fontName: 'Helvetica Neue'; bold;
				yourself).
		GtSearchFilterHierarchySlide new.
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
