"
I am a Slide designe that gets a Text and and Element and displays them. I can be included in presentations.
"
Class {
	#name : #GtTextAndElementSlide,
	#superclass : #GtSlide,
	#instVars : [
		'text',
		'element'
	],
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #'api - instantiation' }
GtTextAndElementSlide >> create [
	| container |
	container := BlElement new
		constraintsDo: [:c |
			c horizontal fitContent.
			c vertical fitContent ];
		layout: (BlLinearLayout vertical);
		addChild: (BlTextElement new
				constraintsDo: [ :c |
					c linear horizontal alignCenter.
					c linear vertical alignCenter];
				padding: (BlInsets top: 60; bottom: 40);
				margin: (BlInsets top: 20; left: 10);
				text: text);
		addChild: (BlElement new
			constraintsDo: [:ct |
				ct linear horizontal alignCenter.
				ct linear vertical alignCenter ];
			layout: (BlGridLayout new vertical));
			addChild: ((BlElement new 
								look: BrShadowLook;
								background: Color white;
								margin: (BlInsets all: 20);
								addChild: element)
							size: 800@500).
	^ container asPannableElement
]

{ #category : #accessing }
GtTextAndElementSlide >> element: anElement [
	element := anElement.
]

{ #category : #initialization }
GtTextAndElementSlide >> initialize [
	super initialize.
	self text: ''.
	self element: nil.
]

{ #category : #accessing }
GtTextAndElementSlide >> text: aText [
	text := aText asRopedText fontSize: 30; glamorousRegularFont.
]

{ #category : #'as yet unclassified' }
GtTextAndElementSlide >> textWithFormat: aText [
	text := aText.
]
