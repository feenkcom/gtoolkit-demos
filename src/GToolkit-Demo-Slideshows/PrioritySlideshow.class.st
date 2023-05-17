"
A convenience class for creating slideshows.

Instead of explicitly setting the priority for a given page, just list the names of the pages in a `pages` method, and then lookup the priority in that list.

See, for example, {{gtMethod:name=SmalltalkIntroSlideshow>>#titleSlideFor:}}.

There are also numerous convenience methods, such as `asTitle:`.

Methods that you should configure:
- `slidePriorities` — the list of slide pages in the order you want them to appear
- `initializeDb` — create and add all the internal Lepiter pages you use in the slideshow (if any)
- `myLepiterDB` — database of any external pages you might refer to (you should prefer the internal one)
- `show` — do a `super show` for convenience


"
Class {
	#name : #PrioritySlideshow,
	#superclass : #Object,
	#instVars : [
		'db',
		'slideshow'
	],
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #utility }
PrioritySlideshow class >> show [
	"NB: this is a class-side method."
	GtPresenterSlideShow openInSpace: self
]

{ #category : #presentation }
PrioritySlideshow class >> show: aSelector [
	^ self new perform: aSelector with: GtLiveSlide new
]

{ #category : #text }
PrioritySlideshow >> asBigCode: aString [
	^ (aString asRopedText)
		glamorousMonospace;
		fontSize: 40
]

{ #category : #text }
PrioritySlideshow >> asBigText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: 40
]

{ #category : #text }
PrioritySlideshow >> asCode: aString [
	^ aString asRopedText
		glamorousMonospace;
		fontSize: self codeAndTextSize
]

{ #category : #text }
PrioritySlideshow >> asHeader: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 60
]

{ #category : #text }
PrioritySlideshow >> asSubTitle: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 50
]

{ #category : #text }
PrioritySlideshow >> asSubtitle: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 60
]

{ #category : #text }
PrioritySlideshow >> asText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: self codeAndTextSize
]

{ #category : #text }
PrioritySlideshow >> asTitle: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 70
]

{ #category : #constant }
PrioritySlideshow >> codeAndTextSize [
	^ 30
]

{ #category : #text }
PrioritySlideshow >> cr [
	"Useful when gluing together text snippets with asHeader and asText."

	^ String cr asRopedText
]

{ #category : #accessing }
PrioritySlideshow >> db [
	"Transient Lepiter database for the dynamically created pages."

	db
		ifNil: [ db := LeDatabase new.
			db parent: LeDatabasesRegistry uniqueInstance defaultLogicalDatabase ].
	^ db
]

{ #category : #utility }
PrioritySlideshow >> ensureEmptyPageNamed: aPageName [
	| page |
	page := self ensurePageNamed: aPageName.
	[ page children notEmpty ]
		whileTrue: [ page removeSnippet: page children last ].
	^ page
]

{ #category : #utility }
PrioritySlideshow >> ensurePageNamed: aPageName [
	| database |
	database := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase
			databaseNamed: self myLepiterDB.
	(database hasPageNamed: aPageName)
		ifFalse: [ database addPage: (LePage named: aPageName) ].
	^ database pageNamed: aPageName
]

{ #category : #accessing }
PrioritySlideshow >> gtActionShowFor: anAction [
	<gtAction>
	^ anAction explicit
		priority: 2;
		stencil: [ | button |
			button := BrButton new
					id: GtInspectorInspectButtonId;
					aptitude: BrGlamorousButtonWithIconAptitude;
					icon: BrGlamorousVectorIcons play;
					label: 'Play slideshow';
					action: [ :aButton :aModel :anEvent | self class show ].
			button ]
]

{ #category : #constants }
PrioritySlideshow >> gtBook [
	^ 'Glamorous Toolkit Book'
]

{ #category : #views }
PrioritySlideshow >> gtDatabaseFor: aView [
	<gtView>
	^ aView forward
		title: 'Database';
		priority: 40;
		object: [ self db ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtLiveFor: aView [
	<gtView>
	^ aView forward
		title: 'Live';
		priority: 10;
		object: [ self slideshow ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtSlideMethodsListViewFor: aView [
	<gtView>
	^ aView list
		priority: 30;
		title: 'Slide methods';
		items: [ self slideMethods ];
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtSlidesListViewFor: aView [
	<gtView>
	| dictionary |
	dictionary := self slideDictionary.
	^ aView columnedList
		priority: 20;
		title: 'Slides';
		items: [ dictionary keys ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Slides' text: [ :each | (dictionary at: each) selector ];
		actionUpdateButton
]

{ #category : #initialization }
PrioritySlideshow >> initialize [
	super initialize.
	self initializeDb
]

{ #category : #initialization }
PrioritySlideshow >> initializeDb [
	"Add pages to db, if needed."
]

{ #category : #constants }
PrioritySlideshow >> myLepiterDB [
	"Default Lepiter DB to use"
	^ self gtBook
]

{ #category : #accessing }
PrioritySlideshow >> pages [
	self error: 'Use self slidePriorities instead'.
	^ self slidePriorities
]

{ #category : #accessing }
PrioritySlideshow >> priorityFor: aSlideMethodSelector [
	^ self slidePriorities indexOf: aSlideMethodSelector
]

{ #category : #accessing }
PrioritySlideshow >> slideDictionary [
	"A dictionary mapping slides to the methods that produce them."

	| methods |
	methods := self slideMethods select: [ :each | each isCompiledMethod ].
	^ (methods
		collect: [ :each | (self perform: each selector withArguments: {GtProtoLiveSlide new}) -> each ])
		asOrderedDictionary
]

{ #category : #accessing }
PrioritySlideshow >> slideMethods [
	^ self slidePriorities
		collect: [ :each | self class methodDict at: each ifAbsent: [ each -> nil ] ]
]

{ #category : #accessing }
PrioritySlideshow >> slidePriorities [
	"Override this method in the subclass.
	Instead of manually setting priorities, just list the slides in order here.
	NB: the names can be the same as the method selectors, but need not be."
	
	<gtExample>
	^ #( 
		"Add the names of the slides here ..."
		)
]

{ #category : #accessing }
PrioritySlideshow >> slideshow [
	^ slideshow ifNil: [ slideshow := GtPresenterSlideShow create: self ]
]
