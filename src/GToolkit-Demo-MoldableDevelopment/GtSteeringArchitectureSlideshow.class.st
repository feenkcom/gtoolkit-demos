Class {
	#name : #GtSteeringArchitectureSlideshow,
	#superclass : #Object,
	#category : 'GToolkit-Demo-MoldableDevelopment-GToolkit-Demo-MoldableDevelopment'
}

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide10For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 14;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/roles-1.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide11For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 15;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/roles-2.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide12For: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 10;
		snippets: {'model := MooseModel root allModels anyOne'}
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide13For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 11;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-1.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide14For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 12;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-2.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide15For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 13;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-3.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide17For: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 9;
		element: [ GtInspector createOn: '.' asFileReference ]
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide18For: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 8;
		titleWithFormat: ('glamoroustoolkit' asRopedText 
			fontSize: 60;
			glamorousRegularFont;
			thin;
			in: [:t | (t from: 'glamorous' size + 1 to: t size) bold]; yourself);
		subtitleWithFormat: ('gtoolkit.com' asRopedText 
			fontSize: 30;
			glamorousRegularFont;
			bold)
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide2For: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 2;
		titleWithFormat: ('what is architecture?' asRopedText 
			fontSize: 40;
			fontName: 'Desyrel';
			bold)
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide3For: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 3;
		titleWithFormat: ('what is architecture ' asRopedText 
			fontSize: 40;
			fontName: 'Desyrel';
			bold), 
			('for' asRopedText fontSize: 40;
			fontName: 'Desyrel'; foreground: Color red),
			('?' asRopedText 
			fontSize: 40;
			fontName: 'Desyrel';
			bold)
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide4For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 4;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-1.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide5For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 5;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-2.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide6For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 6;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-3.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> slide7For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 7;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-4.png')
]

{ #category : #slides }
GtSteeringArchitectureSlideshow >> titleFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('steering architecture' asRopedText 
			fontSize: 70;
			fontName: 'Desyrel';
			bold);
		subtitleWithFormat: ('@girba' asRopedText 
			fontSize: 50;
			fontName: 'Desyrel';
			bold)
]
