Class {
	#name : #GtInspectorScripterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment-Examples'
}

{ #category : #accessing }
GtInspectorScripterExamples >> pixelsToMove [
	"Number of pixels to raise the playground handle."

	^ -170
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorOn3plus4WithPlaygroundSmalltalkEvaluate [
	"Illustrates how to script an Inspector with an open playground."

	<gtExample>
	<noTest>
	| scripter |
	scripter := self
			scriptedInspectorOn: '3+ 4'
			WithPlaygroundTextAndDoit: 'Smalltalk compiler evaluate: self'.
	^ scripter elementWithoutParent
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorOn: anObject WithPlaygroundText: aText [
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: anObject).
	scripter mouseMoveOver id: #handle.
	scripter mouseDown.
	scripter mouseMove by: 0 @ self pixelsToMove.
	scripter mouseUp.
	scripter play.

	scripter
		clickStep: [ :s | 
			s
				id: GtPagerPageElementId index: 1;
				id: GtSourceCoderEditorId ].
	scripter shortcut
		combination: BlKeyCombination primaryA;
		id: GtPagerPageElementId index: 1;
		id: GtSourceCoderEditorId;
		play.
	scripter
		typeStep: [ :s | 
			s
				text: aText;
				id: GtPagerPageElementId index: 1;
				id: GtSourceCoderEditorId ].
	^ scripter
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorOn: anObject WithPlaygroundTextAndDoit: aText [
	| scripter |
	scripter := self scriptedInspectorOn: anObject WithPlaygroundText: aText.
	scripter shortcut
		combination: BlKeyCombination primaryG;
		id: GtPagerPageElementId index: 1;
		id: GtSourceCoderEditorId;
		play.
	^ scripter
]
