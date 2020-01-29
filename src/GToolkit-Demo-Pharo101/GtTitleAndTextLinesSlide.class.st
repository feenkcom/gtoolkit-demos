"
I am a Slide desgine that gets a Text and displays it. I can be included in presentations.
"
Class {
	#name : #GtTitleAndTextLinesSlide,
	#superclass : #GtSlide,
	#instVars : [
		'subtitle',
		'firstText',
		'secondText'
	],
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #'api - instantiation' }
GtTitleAndTextLinesSlide >> create [
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
				padding: (BlInsets top: 0 left: 40 bottom: 20 right: 40);
				text: subtitle);
		addChild: (BlTextElement new
				constraintsDo: [ :c |
					c linear horizontal alignCenter.
					c linear vertical alignCenter];
				padding: (BlInsets top: 20 left: 40 bottom: 10 right: 40);
				text: firstText);
		addChild: (BlTextElement new
				constraintsDo: [ :c |
					c linear horizontal alignCenter.
					c linear vertical alignCenter];
				padding: (BlInsets top: 10 left: 40 bottom: 10 right: 40);
				text: secondText).
	^ container asPannableElement
]

{ #category : #accessing }
GtTitleAndTextLinesSlide >> firstText: aText [
	firstText := aText asRopedText fontSize: 20; glamorousRegularFont.
]

{ #category : #accessing }
GtTitleAndTextLinesSlide >> firstTextWithFormat: aText [
	firstText := aText.
]

{ #category : #initialization }
GtTitleAndTextLinesSlide >> initialize [
	super initialize.
	self subtitle: ''.
	self firstText: ''.
	self secondText: ''.
]

{ #category : #accessing }
GtTitleAndTextLinesSlide >> secondText: aText [
	secondText := aText asRopedText fontSize: 20; glamorousRegularFont.
]

{ #category : #'as yet unclassified' }
GtTitleAndTextLinesSlide >> secondTextWithFormat: aText [
	secondText := aText.
]

{ #category : #accessing }
GtTitleAndTextLinesSlide >> subtitle: aSubtitle [
	subtitle := aSubtitle asRopedText fontSize: 40; glamorousRegularFont.
]

{ #category : #'as yet unclassified' }
GtTitleAndTextLinesSlide >> subtitleWithFormat: aSubtitle [
	subtitle := aSubtitle.
]
