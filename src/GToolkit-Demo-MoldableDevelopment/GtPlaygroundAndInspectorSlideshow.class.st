Class {
	#name : #GtPlaygroundAndInspectorSlideshow,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> create [
	| slideshow |
	slideshow := GtSlideShow new.
	slideshow
		slides:
			{
			(GtTitleSlide new
				titleText: ('Playground and Inspector' asRopedText
					fontSize: 70;
					glamorousRegularFont)).
			(GtTextAndElementSlide new
				newTextWithFormat: self playgroundAndInspectorExplanationText;
				element: [self playgroundAndInspectorMashExample];
				elementWeight: 0.6).
			(GtTextAndElementSlide new
				newTextWithFormat: self playgroundInterfaceExplanationText;
				element: [ self playgroundInterfaceExplanationWithLinks ];
				elementWeight: 0.6).
			(GtTextAndElementSlide new
				newTextWithFormat: self fixItAdornmentForClassExplanationText;
				element: [ self fixItAdornmentForClassExplanation ]).
			(GtTextAndElementSlide new
				newTextWithFormat: self fixItAdornmentForMethodExplanationText;
				element: [ self fixItAdornmentForMethodExplanation ]).
			(GtTextAndElementSlide new
				newTextWithFormat: self inspectorInterfaceExplanationText;
				element: [ self inspectorInterfaceExplanationWithLinks ];
				elementWeight: 0.6).
			(GtTextAndElementSlide new
				newTextWithFormat: self inspectorMethodExplanationText;
				element: [ self inspectorMethodExplanationWithLinks ];
				elementWeight: 0.6).
			(GtSlideshowSlide new
				text: 'Want to learn more about custom inspector views? Follow the show below.' asRopedText glamorousRegularFont;
				slideshow: (GtInspectorViews new create) withTitle: 'GtInspectorViews')
			}.
	^ slideshow.
]
