"
I am a Slide desgine that gets a Text and displays it. I can be included in presentations.
"
Class {
	#name : #GtTextSlide,
	#superclass : #GtSlide,
	#instVars : [
		'subtitle',
		'firstText',
		'secondText'
	],
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #'api - instantiation' }
GtTextSlide >> create [
	| container |
	container := BlElement new
		constraintsDo: [:c |
			c horizontal fitContent.
			c vertical fitContent ];
		layout: (BlGridLayout new vertical);
		addChild: (BlTextElement new
				constraintsDo: [ :c |
					c linear horizontal alignCenter.
					c linear vertical alignCenter];
				padding: (BlInsets top: 80; bottom: 20);
				margin: (BlInsets top: 40; left: 20);
				text: subtitle);
		addChild: (BlTextElement new
				constraintsDo: [ :c |
					c linear horizontal alignCenter.
					c linear vertical alignCenter];
				padding: (BlInsets top: 20; bottom: 20);
				margin: (BlInsets left: 20);
				text: firstText);
		addChild: (BlTextElement new
				constraintsDo: [ :c |
					c linear horizontal alignCenter.
					c linear vertical alignCenter];
				padding: (BlInsets top: 20; bottom: 20);
				margin: (BlInsets left: 20);
				text: secondText).
	^ container asPannableElement
]

{ #category : #accessing }
GtTextSlide >> firstText: aText [
	firstText := aText asRopedText fontSize: 20; glamorousRegularFont.
]

{ #category : #accessing }
GtTextSlide >> firstTextWithFormat: aText [
	firstText := aText.
]

{ #category : #initialization }
GtTextSlide >> initialize [
	super initialize.
	self subtitle: ''.
	self firstText: ''.
	self secondText: ''.
]

{ #category : #accessing }
GtTextSlide >> secondText: aText [
	secondText := aText asRopedText fontSize: 20; glamorousRegularFont.
]

{ #category : #'as yet unclassified' }
GtTextSlide >> secondTextWithFormat: aText [
	secondText := aText.
]

{ #category : #accessing }
GtTextSlide >> subtitle: aSubtitle [
	subtitle := aSubtitle asRopedText fontSize: 40; glamorousRegularFont.
]

{ #category : #'as yet unclassified' }
GtTextSlide >> subtitleWithFormat: aSubtitle [
	subtitle := aSubtitle.
]
