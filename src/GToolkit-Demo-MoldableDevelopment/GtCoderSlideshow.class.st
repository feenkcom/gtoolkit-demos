Class {
	#name : #GtCoderSlideshow,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #accessing }
GtCoderSlideshow >> coderExplanationText [
	| text |
	text := 'Coder is the place where you can manage your code. It offers you the means through which you can manipulate static code. You can create and manage packages, classes and methods all in place.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> coderInterfaceExplanationText [
	| text |
	text := '' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> coderInterfaceExplanationWithLinks [
	^ BlElement new.
]

{ #category : #accessing }
GtCoderSlideshow >> coderMashExample [
	<gtExample>
	^ (GtMashExampleSlide new
		leftElement: 
			(BlElement new
				look: BrShadowLook;
				background: Color white;
				addChild: ((GtClassCoderSlide new 
					class: GtClassCoder;
					headerExpanded: true) asElement));
		centerElement:
			(BlElement new
				look: BrShadowLook;
				background: Color white;
				addChild: ((GtClassCoderSlide new
					class: GtCoderSlideshow;
					methodExpanded: 3) asElement));
		rightElement:
			(BlElement new
				margin: (BlInsets all: 5);
				addChild: (((GtMethodCoder 
					forMethod: GtABAddressBookExample>>#myContactsAddressBook) 
						expanded:true) asElement))) asElement.
]

{ #category : #accessing }
GtCoderSlideshow >> create [
	| slideshow |
	slideshow := GtSlideShow new.
	slideshow
		slides: {
			(GtTitleSlide new
				titleText: ('Coder' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
			(GtTextAndElementSlide new
				newTextWithFormat: self coderExplanationText;
				element: [ self coderMashExample ];
				elementWeight: 0.6).
			(GtTextAndElementSlide new
				newTextWithFormat: self coderInterfaceExplanationText;
				element: [ self coderInterfaceExplanationWithLinks ];
				elementWeight: 0.6)
		}.
	^ slideshow.
]
