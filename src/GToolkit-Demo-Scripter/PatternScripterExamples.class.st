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

{ #category : #accessing }
PatternScripterExamples class >> cachedUrlData [
	"self urlData: self cachedUrlData"
	^ '{"login":"feenkcom","id":22122366,"node_id":"MDEyOk9yZ2FuaXphdGlvbjIyMTIyMzY2","url":"https://api.github.com/orgs/feenkcom","repos_url":"https://api.github.com/orgs/feenkcom/repos","events_url":"https://api.github.com/orgs/feenkcom/events","hooks_url":"https://api.github.com/orgs/feenkcom/hooks","issues_url":"https://api.github.com/orgs/feenkcom/issues","members_url":"https://api.github.com/orgs/feenkcom/members{/member}","public_members_url":"https://api.github.com/orgs/feenkcom/public_members{/member}","avatar_url":"https://avatars.githubusercontent.com/u/22122366?v=4","description":"We make your systems explainable","name":"feenk","company":null,"blog":"https://feenk.com","location":"Switzerland","email":null,"twitter_username":"feenkcom","is_verified":false,"has_organization_projects":true,"has_repository_projects":true,"public_repos":224,"public_gists":0,"followers":56,"following":0,"html_url":"https://github.com/feenkcom","created_at":"2016-09-10T20:36:21Z","updated_at":"2024-01-29T11:27:42Z","archived_at":null,"type":"Organization","total_private_repos":101,"owned_private_repos":101,"private_gists":0,"disk_usage":1444800,"collaborators":7,"billing_email":"feenk@tudorgirba.com","default_repository_permission":"write","members_can_create_repositories":true,"two_factor_requirement_enabled":false,"members_allowed_repository_creation_type":"all","members_can_create_public_repositories":true,"members_can_create_private_repositories":true,"members_can_create_internal_repositories":false,"members_can_create_pages":true,"members_can_fork_private_repositories":false,"web_commit_signoff_required":false,"members_can_create_public_pages":true,"members_can_create_private_pages":true,"deploy_keys_enabled_for_repositories":false,"plan":{"name":"team","space":976562499,"private_repos":999999,"filled_seats":15,"seats":15},"advanced_security_enabled_for_new_repositories":false,"dependabot_alerts_enabled_for_new_repositories":false,"dependabot_security_updates_enabled_for_new_repositories":false,"dependency_graph_enabled_for_new_repositories":false,"secret_scanning_enabled_for_new_repositories":false,"secret_scanning_push_protection_enabled_for_new_repositories":false,"secret_scanning_push_protection_custom_link_enabled":false,"secret_scanning_push_protection_custom_link":null,"secret_scanning_validity_checks_enabled":false}'
]

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

	^ scripter elementWithoutParent
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
	^ scripter elementWithoutParent
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
	^ scripter elementWithoutParent
]

{ #category : #example }
PatternScripterExamples >> explicitMoveViewScript [
	<gtExample>
	| move scripter |
	move := GtLudoRecordingGameExamples new gameShowingAllMoves6 moves fifth.
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: move) maximized.
	scripter click
		label: 'Open the source view';
		id: #bar index: 1;
		modifiers: BlKeyModifiers alt;
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
		action: [ :aSnippetElement | 
			aSnippetElement textualCoderViewModel coderModel
				currentSourceString: self autoPlaySnippet ];
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
	game := GtLudoRecordingGameExamples new gameShowingAllMoves6.
	scripter := BlScripter new.
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
	^ scripter elementWithoutParent
]

{ #category : #example }
PatternScripterExamples >> projectDiaryExample [
	"Nothing to script, but better display"
	<gtExample>
	^ (GtPager
		createWrappedOn: (LePagePhlowTool
				page: (LeDatabase gtBook
						pageNamed: 'Adding simple list views for Ludo Players and Squares')))
		maximized
]

{ #category : #example }
PatternScripterExamples >> rawGitHubDictionary [
	<gtExample>
	<noTest>
	^ STON fromString: self feenkGitHubOrgData
]

{ #category : #example }
PatternScripterExamples >> simpleColumnedListViewScript [
	<gtExample>
	^ self moldableToolViewCodeScript
]

{ #category : #example }
PatternScripterExamples >> simpleForwardViewScript [
	<gtExample>
	| pillarWebpage scripter |
	pillarWebpage := PillarWebPageExamples new esug2014bikesPage.
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: pillarWebpage) maximized.
	scripter click
		label: 'Select the 2nd (Contents) view';
		id: #bar index: 2;
		play.
	scripter click
		label: 'Open the source view';
		id: #bar index: 2;
		modifiers: BlKeyModifiers alt;
		play.
	^ scripter	"elementWithoutParent"
]

{ #category : #example }
PatternScripterExamples >> simpleListViewScript [
	<gtExample>
	| addressBook scripter |
	addressBook := GtABCartoonAddressBookExample new cartoonAddressBook.
		scripter := BlScripter new.
	scripter element: (GtInspector createOn: addressBook) maximized.
		scripter click
		label: 'Select the Contacts list view';
		id: #bar index: 2;
		play.
	scripter click
		label: 'Open the source view';
		id: #bar index: 2;
		modifiers: BlKeyModifiers alt;
		play.
	^ scripter	"elementWithoutParent"
]

{ #category : #example }
PatternScripterExamples >> throwawayLinkTool [
	<gtExample>
	^ (LePage named: 'Reachable links')
	addSnippet: (LePharoSnippet new
			code: 'pages := thisSnippet database pages
		reject: [ :each | each title = ''Glamorous Toolkit Book'' ].
getStartedPage := pages detect: [ :each | each title = ''Glamorous Toolkit'' ].
allReachedPages := getStartedPage
		deepCollect: [ :each | 
			each allChildOutgoingTextualLinks
				collectAsSet: [ :x | x target ifNotNil: #page ] ].
m := GtMondrian new.
m nodes
	stencil: [ :each | 
		| color size |
		color := (allReachedPages includes: each)
				ifTrue: [ Color red ]
				ifFalse: [ Color black ].
		size := 5 @ 5.
		each = getStartedPage
			ifTrue: [ color := Color blue.
				size := 10 @ 10 ].
		BlElement new
			background: color;
			size: size;
			when: BlClickEvent
				do: [ :e | e currentTarget phlow spawnTool: each asPhlowTool ] ];
	with: pages.
m edges
	stencil: [ BlLineElement new
			border: Color veryLightGray;
			toHead: (BlArrowheadSimpleArrow new border: Color veryLightGray);
			zIndex: -1 ];
	connectToAll: [ :page | page allOutgoingTextualLinks collectAsSet: #target ].
m layout force
	nbIterations: 30;
	charge: -50.
m';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	yourself
]

{ #category : #example }
PatternScripterExamples >> throwawayLinkToolScript [
	<gtExample>
	| pager scripter |
	pager := GtPager
			createWrappedOn: (LePagePhlowTool page: self throwawayLinkTool).
	scripter := BlScripter new.
	scripter element: pager.
	scripter click
		label: 'Perform the snippet and go.';
		id: GtSourceCoderDoItAndGoActionId;
		play.
	^ scripter "elementWithoutParent"
]

{ #category : #example }
PatternScripterExamples >> throwawayQueryTool [
	<gtExample>
	^ (LePage named: 'Find Ludo examples')
		addSnippet: (LePharoSnippet new
				code: '(LeDatabase gtBook pages
	select: [ :page | page asMarkdownString includesSubstring: ''Ludo'' ])
	select: [ :page | 
		exampleSnippets := page
				deep: #children
				select: [ :child | child isKindOf: LeExampleSnippet ].
		exampleSnippets notEmpty ]';
				yourself);
		yourself
]

{ #category : #example }
PatternScripterExamples >> throwawayQueryToolScript [
	<gtExample>
	| pager scripter |
	pager := GtPager
			createWrappedOn: (LePagePhlowTool page: self throwawayQueryTool).
	scripter := BlScripter new.
	scripter element: pager.
	scripter click
		label: 'Perform the snippet and go.';
		id: GtSourceCoderDoItAndGoActionId;
		play.
	^ scripter "elementWithoutParent"
]

{ #category : #example }
PatternScripterExamples >> wrappedEsugWebsitePageCollectionScript [
	<gtExample>
	<noTest>
	| website scripter |
	website := PillarWebsiteExamples new esug2014.
	scripter := BlScripter new.
	scripter element: (GtInspector createOn: website) maximized.
	scripter click
		label: 'Select the 4th row';
		id: GtPhlowColumnedListId;
		id: #scrollable;
		onChildAt: 4;
		// GtPhlowCellElement;
		@ 1;
		play.
	scripter doubleClick
		label: 'Double-click on the row';
		play.
	scripter click
		label: 'Select the 2nd (Map) view';
		id: GtPagerPageElementId index: 2;
		id: #bar index: 2;
		play.
	^ scripter	"elementWithoutParent"
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
