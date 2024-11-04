"
These Scripter examples are used to illustrate Moldable Development Patterns.
They can also be used as tutorial examples for Scripter scripts.
"
Class {
	#name : #PatternScripterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Scripter-Examples'
}

{ #category : #example }
PatternScripterExamples >> cartoonAddressBookScript [
	<gtExample>
	| addressBook scripter |
	addressBook := GtABCartoonAddressBookExample new cartoonAddressBook.
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: addressBook) maximized.
	^ scripter	"elementWithoutParent"
]

{ #category : #example }
PatternScripterExamples >> cartoonAddressBookSearchScript [
	"NB: This does not work very well as an embedded example as the dropdown menu will disappear when you click anywhere on the page. The dropdown menu also obscure important text as you scroll."
	<gtExample>
	| scripter |
	scripter := self cartoonAddressBookScript.
	scripter click
		label: 'Click on the Spotter button';
		id: GtSpotterObjectActionSearchId;
		play.
	scripter click
		label: 'Move to the text input field';
		id: GtPhlowColumnedListHeaderId;
		id: #label index: 2;
		play.
	scripter type
		label: 'Enter some text in the text field';
		text: 'u';
		play.

	^ scripter	"elementWithoutParent"
]

{ #category : #example }
PatternScripterExamples >> customLePageActionScript [
	"NB: Hovering the mouse is obviously ephemeral."
	<gtExample>
	| scripter page |
	page := LeDatabase gtBook pageNamed: 'Custom Action'.
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: page) maximized.
	scripter click
		label: 'Click on the Database button';
		id: LePageDatabaseActionId;
		play.
	scripter mouseMoveOver
		label: 'Hover over the Database button';
		id: LePageDatabaseActionId;
		play.
	^ scripter	"elementWithoutParent"
]

{ #category : #example }
PatternScripterExamples >> customViewCustomMovesViewScript [
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

{ #category : #example }
PatternScripterExamples >> customViewRawViewScript [
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

{ #category : #example }
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
