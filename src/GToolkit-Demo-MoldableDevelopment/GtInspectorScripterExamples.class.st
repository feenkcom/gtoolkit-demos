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
GtInspectorScripterExamples >> scriptedInspectorInPagerOn: anObject WithPlaygroundText: aText [
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
GtInspectorScripterExamples >> scriptedInspectorInPagerOn: anObject withPlaygroundTextAndDoit: aText [
	| scripter |
	scripter := self scriptedInspectorInPagerOn: anObject WithPlaygroundText: aText.
	scripter shortcut
		combination: BlKeyCombination primaryG;
		id: GtPagerPageElementId index: 1;
		id: GtSourceCoderEditorId;
		play.
	^ scripter
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorOn3plus4WithPlayground [
	"Illustrates how to script an Inspector with an open playground."

	<gtExample>
	<noTest>
	| scripter |
	scripter := self
			scriptedInspectorOn: '3+ 4'
			WithPlaygroundText: 'Smalltalk compiler evaluate: self'.
	^ scripter elementWithoutParent
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorOn3plus4WithPlaygroundSmalltalkEvaluate [
	"Illustrates how to script an Inspector with an open playground."

	<gtExample>
	<noTest>
	| scripter |
	scripter := self
			scriptedInspectorInPagerOn: '3+ 4'
			withPlaygroundTextAndDoit: 'Smalltalk compiler evaluate: self'.
	^ scripter elementWithoutParent
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorOn: anObject WithPlaygroundText: aText [
	"This one is not in a Pager"

	| scripter |
	scripter := BlScripter new.
	scripter element: (GtInspector newOn: anObject).
	scripter mouseMoveOver id: #handle.
	scripter mouseDown.
	scripter mouseMove by: 0 @ self pixelsToMove.
	scripter mouseUp.
	scripter play.
	scripter clickStep: [ :s | s id: GtSourceCoderEditorId ].
	scripter shortcut
		combination: BlKeyCombination primaryA;
		id: GtSourceCoderEditorId;
		play.
	scripter
		typeStep: [ :s | 
			s
				text: aText;
				id: GtSourceCoderEditorId ].

	^ scripter
]
