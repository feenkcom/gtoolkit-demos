"
These Scripter examples are used to illustrate Moldable Development Patterns.
They can also be used as tutorial examples for Scripter scripts.
"
Class {
	#name : #PatternScripterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Scripter-Examples'
}

{ #category : #'as yet unclassified' }
PatternScripterExamples >> customViewCustomMovesView [
	"NB: It is not enough to double-click directly on the 6th row. 
	We have to first click to select it, and then double-click."

	<gtExample>
	| scripter game |
	game := GtLudoRecordingGameExamples new gameShowingAllMoves5.
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: game) maximized.
	scripter click
		label: 'Select the Moves view';
		id: #bar index: 5;
		play.
	scripter click
		label: 'Select the 6th move';
		id: GtPhlowColumnedListId;
		id: #scrollable;
		onChildAt: 6;
		// GtPhlowCellElement;
		@ 1;
		play.
	scripter doubleClick
		label: 'Double-click on the row';
		play.
	^ scripter	"elementWithoutParent"
]

{ #category : #'as yet unclassified' }
PatternScripterExamples >> customViewRawView [
	<gtExample>
	| scripter game |
	scripter := BlScripter new.
	game := GtLudoRecordingGameExamples new gameShowingAllMoves3.
	scripter element: (GtInspector createOn: game) maximized.
	scripter click
		label: 'Select the Raw view';
		id: #bar index: 7;
		play.
	scripter click
		label: 'Open the moves slot';
		id: #triangle index: 8;
		play.
	scripter click
		label: 'Open the array slot';
		id: #triangle index: 9;
		play.
	scripter click
		label: 'Open the 6th move';
		id: #triangle index: 15;
		play.
	^ scripter	"elementWithoutParent"
]

{ #category : #'as yet unclassified' }
PatternScripterExamples >> moldableToolViewCodeScript [
	<gtExample>
	| scripter game |
	scripter := BlScripter new.
	game := GtLudoRecordingGameExamples new gameShowingAllMoves6.
	scripter element: (GtInspector createOn: game) maximized.
	scripter click
		label: 'Select the Moves view';
		id: #bar index: 5;
		play.
	scripter click
		label: 'Open the source view';
		id: #bar index: 2;
		modifiers: BlKeyModifiers alt;
		play.
	^ scripter	"elementWithoutParent"
]
