"
These Scripter examples are used to illustrate Moldable Development Patterns.
They can also be used as tutorial examples for Scripter scripts.
"
Class {
	#name : #PatternScripterExamples,
	#superclass : #Object,
	#classInstVars : [
		'urlData'
	],
	#category : #'GToolkit-Demo-Scripter-Examples'
}

{ #category : #example }
PatternScripterExamples class >> feenkGitHubUrl [
	<gtExample>
	^ 'https://api.github.com/orgs/feenkcom'
]

{ #category : #accessing }
PatternScripterExamples class >> urlData [
	| url |
	^ urlData
		ifNil: [ url := self feenkGitHubUrl.
			urlData := ZnClient new get: url ]
]

{ #category : #accessing }
PatternScripterExamples class >> urlData: anObject [
	urlData := anObject
]

{ #category : #example }
PatternScripterExamples >> autoPlaySnippet [
	<gtExample>
	^ '1 to: 10 do: [ :n | 
  self isOver ifTrue: [ ^ self ].
  self playerToRoll
    ifTrue: [ self die roll ]
    ifFalse: [ self moveTokenNamed: 
      self tokensToMove atRandom name ] ].
self.'
]

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
PatternScripterExamples >> feenkGitHubOrgData [
	"NB: We cache this data to avoid exceeding the API rate limit."
	<gtExample>
	<noTest>
	^ self class urlData
]

{ #category : #example }
PatternScripterExamples >> moldableLudoGamePlaygroundScript [
	"NB: Note the use of `do` to replace the playground snippet code."
	<gtExample>
	| game scripter |
	game := GtLudoRecordingGame new.
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: game) maximized.
	scripter mouseMoveOver
		label: 'Position mouse over playground handle';
		id: LeInspectorPlaygroundResizerId.
	scripter mouseDown.
	scripter mouseMove
		by: 0 @ -240;
		label: 'Drag the playground handle up'.
	scripter mouseUp.
	scripter play.
	scripter click
		label: 'Activate the code snippet';
		id: GtSourceCoderEditorId;
		play.
	scripter do
		label: 'Replace the code in the playground snippet';
		id: GtSourceCoderEditorId;
		action: [ :aSnippetElement | aSnippetElement text: self autoPlaySnippet ];
		play.
	scripter click
		label: 'Perform the snippet and go.';
		id: GtSourceCoderDoItAndGoActionId;
		play.
	scripter click
		label: 'Select the Moves view in the second pager';
		id: GtPagerPageElementId index: 2;
		id: #bar index: 5;
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

{ #category : #example }
PatternScripterExamples >> rawGitHubDictionary [
	<gtExample>
	<noTest>
	^ STON fromString: self feenkGitHubOrgData
]

{ #category : #example }
PatternScripterExamples >> wrappedGitHubOrganization [
	<gtExample>
	<noTest>
	^ GhOrganization new rawData: self rawGitHubDictionary
]

{ #category : #example }
PatternScripterExamples >> wrappedGitHubOrganizationDataScript [
	<gtExample>
	<noTest>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtInspector createOn:  self wrappedGitHubOrganization) maximized.
	scripter click
		label: 'Select the 7th repo';
		id: GtPhlowColumnedListId;
		id: #scrollable;
		onChildAt: 7;
		// GtPhlowCellElement;
		@ 1;
		play.
	scripter doubleClick
		label: 'Double-click on the row';
		play.
	scripter click
		label: 'Select the 2nd (Contributors) view';
		id: GtPagerPageElementId index: 2;
		id: #bar index: 2;
		play.
	^ scripter	"elementWithoutParent"
]
