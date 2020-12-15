Class {
	#name : #GtMoldableDevelopmentSlideshow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide2For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 54;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/50percent-1.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide3For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 55;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/50percent-2.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide4For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 56;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/50percent-3.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide5For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 60;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/craft-1.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide6For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 62;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/craft-2.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide7For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 63;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/craft-3.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide8For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 70;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/roles-1.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide9For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 71;
		fileReference: './pharo-local/iceberg/feenkcom/gtoolkit-demos/doc/moldable-development/roles-3.png'.
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> titleFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('moldabledevelopment' asRopedText 
			fontSize: 80;
			glamorousRegularFont;
			thin; 
			in: [:t | (t from: 'moldable' size + 1 to: t size) bold]; yourself)
]
