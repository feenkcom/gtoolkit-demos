Class {
	#name : #GtInspectorScripterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment-Examples'
}

{ #category : #example }
GtInspectorScripterExamples >> emptyStackMachine [
	<gtExample>
	<return: #StackMachineV0>
	^ StackMachineV0 new
]

{ #category : #example }
GtInspectorScripterExamples >> emptyStackMachineV1 [
	<gtExample>
	<return: #StackMachineV1>
	^ StackMachineV1 new
]

{ #category : #example }
GtInspectorScripterExamples >> emptyStackMachineV1WithPlaygroundCode [
	<gtExample>
	<return: #GtInspector>
	| scripter |
	scripter := self
			scriptedInspectorOn: self emptyStackMachineV1
			withPlaygroundText: 'self ! 3. self ! 4.'.
	^ scripter elementWithoutParent
]

{ #category : #example }
GtInspectorScripterExamples >> emptyStackMachineWithGeneralizedPlaygroundCode [
	<gtExample>
	<return: #GtInspector>
	| scripter |
	scripter := self
			scriptedInspectorOn: self emptyStackMachine
			withPlaygroundText: 'stack addLast: aValue'.
	^ scripter elementWithoutParent
]

{ #category : #example }
GtInspectorScripterExamples >> emptyStackMachineWithPlaygroundCode [
	<gtExample>
	<return: #GtInspector>
	| scripter |
	scripter := self
			scriptedInspectorOn: self emptyStackMachine
			withPlaygroundText: 'stack addLast: 3'.
	^ scripter elementWithoutParent
]

{ #category : #accessing }
GtInspectorScripterExamples >> pixelsToMove [
	"Number of pixels to raise the playground handle."

	^ -170
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorInPagerOn: anObject withPlaygroundText: aText [
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
				onPagerPaneWithIndex: 1;
				id: GtSourceCoderEditorId ].
	scripter shortcut
		combination: BlKeyCombination primaryA;
		onPagerPaneWithIndex: 1;
		id: GtSourceCoderEditorId;
		play.
	scripter
		typeStep: [ :s | 
			s
				text: aText;
				onPagerPaneWithIndex: 1;
				id: GtSourceCoderEditorId ].
	^ scripter
]

{ #category : #accessing }
GtInspectorScripterExamples >> scriptedInspectorInPagerOn: anObject withPlaygroundTextAndDoit: aText [
	| scripter |
	scripter := self scriptedInspectorInPagerOn: anObject withPlaygroundText: aText.
	scripter shortcut
		combination: BlKeyCombination primaryG;
		onPagerPaneWithIndex: 1;
		id: GtSourceCoderEditorId;
		play.
	^ scripter
]

{ #category : #example }
GtInspectorScripterExamples >> scriptedInspectorOn3plus4WithPlayground [
	"Illustrates how to script an Inspector with an open playground."

	<gtExample>
	<noTest>
	| scripter |
	scripter := self
			scriptedInspectorOn: '3+ 4'
			withPlaygroundText: 'Smalltalk compiler evaluate: self'.
	^ scripter elementWithoutParent
]

{ #category : #example }
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
GtInspectorScripterExamples >> scriptedInspectorOn: anObject withPlaygroundText: aText [
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

{ #category : #example }
GtInspectorScripterExamples >> stackMachineV1WithCodeEvaluated [
	<gtExample>
	<return: #GtPager>
	| scripter |
	scripter := self
			scriptedInspectorInPagerOn: (StackMachineV1 new
					! 3;
					! 4;
					yourself)
			withPlaygroundTextAndDoit: 'self top'.
	^ scripter elementWithoutParent
]
