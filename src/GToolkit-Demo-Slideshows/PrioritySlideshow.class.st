"
A convenience class for creating slideshows.

Instead of explicitly setting the priority for a given page, just list the names of the pages in a `pages` method, and then lookup the priority in that list by sending `setPriority`.

See, for example, {{gtMethod:name=SmalltalkIntroSlideshow>>#titleSlideFor:}}.

There are also numerous convenience methods, such as `asTitle:`.

Methods that you should configure:
- `slidePriorities` — the list of slide pages in the order you want them to appear
- `initializeDb` — create and add all the internal Lepiter pages you use in the slideshow (if any)
- `myLepiterDB` — database of any external pages you might refer to (you should prefer the internal one)
- `show` — do a `super show` for convenience

**NB:** if you have slides that set the priority ""manually"" by sending `priority: (self priorityFor: aSelector)`, you can now send `setPriority` instead. You can use a rewrite snippet to refactor this.

Search for:
```language=text
	``@slide priority: (self priorityFor: ``@selector)
```

and replace by: 
```language=text
	``@slide setPriority
```


"
Class {
	#name : #PrioritySlideshow,
	#superclass : #Object,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#instVars : [
		'db'
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
		fontSize: self bigCodeAndTextSize
]

{ #category : #text }
PrioritySlideshow >> asBigText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: self bigCodeAndTextSize
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
		fontSize: self headerSize
]

{ #category : #text }
PrioritySlideshow >> asSubtitle: aString [
	^ aString asRopedText
		glamorousRegularFont;
		bold;
		fontSize: self subtitleSize
]

{ #category : #text }
PrioritySlideshow >> asText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: self codeAndTextSize
]

{ #category : #text }
PrioritySlideshow >> asTitle: aString [
	^ aString asRopedText
		glamorousRegularFont;
		bold;
		fontSize: self titleSize
]

{ #category : #constant }
PrioritySlideshow >> bigCodeAndTextSize [
	^ 30
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
PrioritySlideshow >> demoPage [
	"Extract the demo notes, if there are any."

	| page |
	page := LePage named: 'Demo notes'.
	LeDatabase new addPage: page.
	page
		addSnippet: (LeTextSnippet new
				string: self demoText; 
				yourself).
	^ page
]

{ #category : #accessing }
PrioritySlideshow >> demoText [
	"Glue together any text in <demo: ''> pragmas."

	^ String cr , String cr
		join: ((self slideDictionary associations
				collect: [ :assoc | 
					assoc value pragmas
						detect: [ :p | p selector = #demo: ]
						ifFound: [ :pragma | pragma arguments first ]
						ifNone: [ '' ] ]) select: #notEmpty)
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
	<gtExample>
	<noTest>
	^ LeDatabasesRegistry getDatabaseByName: self gtBookName
]

{ #category : #constants }
PrioritySlideshow >> gtBookName [
	^ 'Glamorous Toolkit Book'
]

{ #category : #views }
PrioritySlideshow >> gtDatabaseFor: aView [
	<gtView>
	self db pages ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Database';
		priority: 80;
		object: [ self db ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtDemoNotesFor: aView [
	<gtView>
	self hasDemoPragmas ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Demo notes';
		priority: 71;
		object: [ self demoPage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #accessing }
PrioritySlideshow >> gtGitButtonFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Go to repository';
		priority: 4;
		icon: BrGlamorousVectorIcons branching;
		id: GtCoderGitButtonId;
		action: [ :aButton | 
			| repository |
			repository := self class repository.
			repository
				ifNil: [ aButton phlow
						spawnTool: (GtPhlowValuableTool new
								valuable: [ GtGitAddToRepositoryElement new package: self class package ]) ]
				ifNotNil: [ aButton phlow
						spawnTool: (GtGitPhlowTool new repository: repository) ] ]
]

{ #category : #views }
PrioritySlideshow >> gtLiveFor: aView [
	<gtView>
	^ aView empty
		"title: 'Live';
		priority: 10;
		object: [ self slideshow ];
		view: #gtLiveFor:;
		actionUpdateButton"
]

{ #category : #views }
PrioritySlideshow >> gtMetricsFor: aView [
	<gtView>
	self hasTextPragmas ifFalse: [ ^ aView empty ].
	^ aView columnedList
		title: 'Metrics';
		priority: 75;
		items: [ self metrics ];
		column: 'Metric' text: #key;
		column: 'Value' text: [ :assoc | assoc value asString ];
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtScriptFor: aView [
	<gtView>
	self hasTextPragmas ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Script';
		priority: 70;
		object: [ self scriptPage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtSlideDeckFor: aView [
	"Eventually push this method up."

	<gtView>
	^ aView forward
		title: 'Slide deck';
		priority: 60;
		object: [ self slideDeckPage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtSlideMethodsListViewFor: aView [
	<gtView>
	^ aView columnedList
		priority: 30;
		title: 'Slides';
		items: [ self slideMethods ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Methods'
			text: [ :each | each selector ]
			width: 200;
		column: 'Text' text: [ :each | self textForSlide: each selector ];
		actionUpdateButton
]

{ #category : #accessing }
PrioritySlideshow >> gtSlidePrioritiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Slide priorities';
		priority: 40;
		object: [ self class >> #slidePriorities ];
		view: #gtSourceFor:;
		actionUpdateButton
]

{ #category : #views }
PrioritySlideshow >> gtSlidesListViewFor: aView [
	"NB: the send: message wll transform the items to what we see in the next pane"

	"<gtView>"
	
	"We don't really need this anymore since the slide methods view also shows the slides."
	^ aView columnedList
		priority: 20;
		title: 'Slides';
		items: [ self slideDictionary associations ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Slides'
			text: [ :each | each value selector ]
			width: 200;
		column: 'Text'
			text: [ :each | self textForSlide: each value selector ]
			width: 300;
		send: #key;
		actionUpdateButton
]

{ #category : #searching }
PrioritySlideshow >> gtSpotterForSourceCodeFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 30;
		title: 'Source code';
		items: [ self slideMethods ];
		itemName: #sourceCode;
		filterBySubstring;
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #views }
PrioritySlideshow >> hasDemoPragmas [
	^ self class methods
		detect: [ :m | m hasPragmaNamed: 'demo:' ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #views }
PrioritySlideshow >> hasTextPragmas [
	^ self class methods
		detect: [ :m | m hasPragmaNamed: 'text:' ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #constant }
PrioritySlideshow >> headerSize [
	^ 60
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

{ #category : #utility }
PrioritySlideshow >> killList [
"Used by scriptText to remove text lines starting with any of these prefixes. Can be overridden by subclasses."
	^ #('#' '*(' '```')
]

{ #category : #utility }
PrioritySlideshow >> metrics [
	| words |
	words := self scriptText substrings.
	^ {'Number of words' -> words size.
		'Estimated duration'
			-> ((Duration minutes: words size / self wordsPerMinute) roundTo: 1 second)}
]

{ #category : #accessing }
PrioritySlideshow >> pages [
	self error: 'Use self slidePriorities instead'.
	^ self slidePriorities
]

{ #category : #constants }
PrioritySlideshow >> picturesDirectoryPath [
	"Default path may be overridden"

	^ Path * 'feenkcom' / 'gtoolkit-demos' / 'data' / 'images'
]

{ #category : #accessing }
PrioritySlideshow >> priorityFor: aSlideMethodSelector [
	^ self slidePriorities
		indexOf: aSlideMethodSelector
		ifAbsent: [ self error: 'Missing slide priority for ' , aSlideMethodSelector printString ]
]

{ #category : #utility }
PrioritySlideshow >> scalableSlide: aSlide [
	"Not all gtSlides are scalable, so we wrap them for displaying in the Slides and Slide deck views.
	If this is fixed, we can remove the wrappers."
	<todo: 'remove this once slides become scalable.'>

	| scalableSlide |
	scalableSlide := GtProtoLiveSlide new element
			element: [ (aSlide asElement size: 1200 @ 900) asScalableElement ].
	^ scalableSlide
]

{ #category : #utility }
PrioritySlideshow >> scriptPage [
	"Just the script text, without headings, directions or code snippets."

	| page |
	page := LePage named: 'Script'.
	LeDatabase new addPage: page.
	page
		addSnippet: (LeTextSnippet new
				string: self scriptText;
				yourself).
	^ page
]

{ #category : #utility }
PrioritySlideshow >> scriptText [
	"Remove headings (starting with '#'), directions (starting with '*('), and code snippets (starting with '```')."

	| script separator regexStrings scriptText |
	self hasTextPragmas ifFalse: [ ^ '' ].
	regexStrings := {'`([^`]+)`'.
			'\*([^*]+)\*'.
			'\*\*([^*]+)\*\*'.
			'\*\*\*([^*]+)\*\*\*'}.
	script := String new writeStream.
	separator := String cr repeat: 2.	"Collect all the <text: ...> strings"
	self slideDictionary
		do: [ :assoc | 
			| text |
			text := assoc value pragmas
					detect: [ :p | p selector = #text: ]
					ifFound: [ :pragma | pragma arguments first , String cr , String cr ]
					ifNone: [ '' ].
			text := separator
					join: ((separator split: text)
							reject: [ :each | (self killList detect: [ :kill | each beginsWith: kill ] ifNone: [ nil ]) notNil ]).
			script nextPutAll: text ].
	scriptText := script contents.	"Strip out formatting using * and `"
	regexStrings
		do: [ :re | 
			| regex |
			regex := re asRegex.
			scriptText := regex
					copy: scriptText
					translatingMatchesUsing: [ :each | regex subexpression: 2 ] ].
	^ scriptText
]

{ #category : #utility }
PrioritySlideshow >> slideDeckPage [
	| page |
	page := LePage named: self class name.
	LeDatabase new addPage: page.
	self slideDictionary
		do: [ :assoc | assoc value slideSnippets do: [ :each | page addSnippet: each ] ].
	^ page
]

{ #category : #accessing }
PrioritySlideshow >> slideDictionary [
	"A dictionary mapping slides to the methods that produce them."

	| methods |
	methods := self slideMethods select: [ :each | each isCompiledMethod ].
	^ (methods
		collect: [ :each |
		(self scalableSlide:(self perform: each selector withArguments: {GtProtoLiveSlide new}) )
			-> each 
		])
		asOrderedDictionary
]

{ #category : #utility }
PrioritySlideshow >> slideFor: selector [
	^ self
		scalableSlide: (self perform: selector withArguments: {GtProtoLiveSlide new})
]

{ #category : #accessing }
PrioritySlideshow >> slideMethods [
	^ self slidePriorities
		collect: [ :each | self class methodDict at: each ifAbsent: [ each -> nil ] ]
]

{ #category : #utility }
PrioritySlideshow >> slidePageFor: aSlideMethod [
	| page |
	page := LePage named: self class name.
	LeDatabase new addPage: page.
	aSlideMethod slideSnippets do: [ :each | page addSnippet: each ].
	^ page
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
PrioritySlideshow >> slides [
	^ self slideDictionary keys
]

{ #category : #text }
PrioritySlideshow >> subtitleSize [
	^ 40
]

{ #category : #utility }
PrioritySlideshow >> textForSlide: aSelector [
	"Extract the argument to the <text: ..> pragma, if it exists."
	| pragmas |
	(self class includesSelector: aSelector) ifFalse: [ ^ '' ].
	pragmas := (self class compiledMethodAt: aSelector) pragmas
			select: [ :p | p selector = #text: ].
	^ pragmas ifEmpty: [ '' ] ifNotEmpty: [ pragmas first arguments first ]
]

{ #category : #constant }
PrioritySlideshow >> titleSize [
	^ 60
]

{ #category : #accessing }
PrioritySlideshow >> wordsPerMinute [
	"Override in subclasses, if desired."

	^ 140
]
