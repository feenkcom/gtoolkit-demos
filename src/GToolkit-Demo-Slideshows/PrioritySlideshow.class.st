"
A convenience class for creating slideshows.

Instead of explicitly setting the priority for a given page, just list the names of the pages in a `pages` method, and then lookup the priority in that list by sending `setPriority`.

See, for example, {{gtMethod:name=SmalltalkIntroSlideshow>>#title:|expanded=true}}

There are also numerous convenience methods, such as `asTitle:`.

Methods that you should configure:
- `slidePriorities` — the list of slide pages in the order you want them to appear
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
	#superclass : #DatabaseHolder,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#instVars : [
		'announcer',
		'slideDimensions'
	],
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #action }
PrioritySlideshow class >> gtInspectSlideshowActionFor: anAction [
	<gtAction>
	<gtClassAction>
	^ anAction button
		tooltip: 'Inspect slideshow';
		priority: 10;
		id: GtPresenterPreviewShowButtonId;
		icon: BrGlamorousVectorIcons playinspect;
		action: [ :aButton | 
			aButton phlow
				spawnObject: ((self = PrioritySlideshow or: [ self inheritsFrom: PrioritySlideshow ])
						ifTrue: [ self new ]
						ifFalse: [ GtPresenterSlideShow create: self new ]) ]
]

{ #category : #view }
PrioritySlideshow class >> gtLiveSlideshowFor: aView [
	<gtView>
	<gtClassView>
	^ aView explicit 
		title: 'Slideshow';
		priority: 35;
		stencil: [ GtPresenterSlideShow create: self new ];
		actionUpdateButton
]

{ #category : #actions }
PrioritySlideshow class >> gtOpenSlideshowActionFor: anAction [
	<gtAction>
	<gtClassAction>
	(self methods select: [ :m | m hasPragmaNamed: #gtSlide ]) isEmpty
		ifTrue: [ ^ anAction noAction ].
	^ anAction button
		priority: 11;
		tooltip: 'Play slideshow in new window';
		icon: BrGlamorousVectorIcons play;
		action: [ :aButton | GtPresenterSlideShow openInSpace: self ]
]

{ #category : #view }
PrioritySlideshow class >> gtSlideDeckFor: aView [
	<gtClassView>
	^ aView forward
	title: 'Slide deck';
	priority: 32;
		object: [ self new ];
		view: #gtSlideDeckFor:
]

{ #category : #view }
PrioritySlideshow class >> gtSlideMethodsListViewFor: aView [
	<gtClassView>
	^ aView forward
	title: 'Slides';
	priority: 31;
		object: [ self new ];
		view: #gtSlideMethodsListViewFor:
]

{ #category : #utility }
PrioritySlideshow class >> show [
	"NB: this is a class-side method."
	GtPresenterSlideShow openInSpace: self
]

{ #category : #presentation }
PrioritySlideshow class >> show: aSelector [
	^ self new perform: aSelector with: GtLiveSlide new
]

{ #category : #utility }
PrioritySlideshow >> addItem: label inScenery: scenery [
	"Utility for rewriting Sceneries."
	^ scenery
		addItem: (GtSceneryItem new
				stencil: (GtSceneryTextStencil new
						text: (label asRopedText
								fontSize: 20;
								bold)))
]

{ #category : #'as yet unclassified' }
PrioritySlideshow >> announcer [
	^ announcer
]

{ #category : #accessing }
PrioritySlideshow >> announcer: anObject [
	announcer := anObject
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

{ #category : #exporting }
PrioritySlideshow >> defaultSlideDimensions [
	"Dimensions for exporting slide PNGs"

	^ 1600 @ 1200
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

{ #category : #exporting }
PrioritySlideshow >> exportHTML [
	self initHTMLDir.
	[ [ :job | 
	job title: 'Generating slide HTML ...'.
	LeHtmlPageExporter exportPage: self slideDeckPage to: self htmlDir ] asJob run ]
		fork.
	^ self htmlDir
]

{ #category : #exporting }
PrioritySlideshow >> exportSlide: slideMethod toFile: aFileReference [
	"NB: BlFileExporter>>#fileName: also  works
	with a FileReference instread of a String"

	| element |
	element := (BlScripter new element: slideMethod asScalableSlide asElement)
			element size: self slideDimensions.
	BlExporter png
		element: element;
		fileName: aFileReference;
		export.
	^ aFileReference
]

{ #category : #exporting }
PrioritySlideshow >> exportSlidePNGs [
	"This method will export a PNG for each slide. 
	To create a PDF from the slides, on a Mac,
	open all the images with Preview, and then simply print to PDF."

	| slideMethods file |
	slideMethods := self slideMethods.
	self initSlideDir.
	[ [ :job | 
	job title: 'Generating slide PNGs ...'.
	slideMethods
		withIndexDo: [ :slideMethod :index | 
			job
				progress: index / slideMethods size;
				title: 'Slide ' , index printString.
			file := self slideDir / ('slide' , (index printStringPadded: 3) , '.png').
			self exportSlide: slideMethod toFile: file ] ] asJob run ] fork.
	^ self slideDir
]

{ #category : #constants }
PrioritySlideshow >> gtBook [
	"Should deprecate this? Use instead: LeDatabase gtBook"

	<gtExample>
	<noTest>
	^ LeDatabase gtBook
]

{ #category : #view }
PrioritySlideshow >> gtDatabaseFor: aView [
	<gtView>
	self db pages ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Database';
		priority: 80;
		object: [ self db ];
		view: #gtLiveFor:;
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
]

{ #category : #view }
PrioritySlideshow >> gtDemoNotesFor: aView [
	<gtView>
	self hasDemoPragmas ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Demo notes';
		priority: 71;
		object: [ self demoPage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
]

{ #category : #actions }
PrioritySlideshow >> gtExportPngAction: anAction [
	<gtAction>
	self slideMethods ifEmpty: [ ^ anAction empty ].
	^ anAction button
		label: ' PNG';
		tooltip: 'Save PNGs to disk';
		priority: 20;
		icon: BrGlamorousIcons spawn;
		action: [ :aButton :aModel :anEvent | aButton phlow spawnObject: self exportSlidePNGs ]
]

{ #category : #actions }
PrioritySlideshow >> gtGitAction: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Go to repository';
		priority: 25;
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

{ #category : #actions }
PrioritySlideshow >> gtHTMLLocalExportActionFor: anAction [
	<gtAction>
	self slideMethods ifEmpty: [ ^ anAction empty ].
	^ anAction button
		label: 'HTML';
		tooltip: 'Export the slide deck to HTML and store locally';
		priority: 21;
		icon: BrGlamorousIcons spawn;
		action: [ :aButton | 
			| output |
			output := self exportHTML.
			aButton phlow spawnObject: output ]
]

{ #category : #view }
PrioritySlideshow >> gtLiveFor: aView [
	<gtView>
	^ aView empty
		"title: 'Live';
		priority: 10;
		object: [ self slideshow ];
		view: #gtLiveFor:;
		actionUpdateButton"
]

{ #category : #view }
PrioritySlideshow >> gtLiveSlideshowFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Slideshow';
		stencil: [ GtPresenterSlideShow create: self ];
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
]

{ #category : #view }
PrioritySlideshow >> gtMetricsFor: aView [
	<gtView>
	self hasTextPragmas ifFalse: [ ^ aView empty ].
	^ aView columnedList
		title: 'Metrics';
		priority: 75;
		items: [ self metrics ];
		column: 'Metric' text: #key;
		column: 'Value' text: [ :assoc | assoc value asString ];
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
]

{ #category : #actions }
PrioritySlideshow >> gtPlaySlideshowAction: anAction [
	<gtAction>
	^ anAction explicit
		priority: 10;
		stencil: [ | button |
			button := BrButton new
					id: GtInspectorInspectButtonId;
					aptitude: BrGlamorousButtonWithIconAptitude;
					icon: BrGlamorousVectorIcons play;
					label: 'Play slideshow';
					action: [ :aButton :aModel :anEvent | self class show ].
			button ]
]

{ #category : #view }
PrioritySlideshow >> gtScriptFor: aView [
	<gtView>
	self hasTextPragmas ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Script';
		priority: 70;
		object: [ self scriptPage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
]

{ #category : #view }
PrioritySlideshow >> gtSlideDeckFor: aView [
	<gtView>
	^ aView forward
		title: 'Slide deck';
		priority: 60;
		object: [ self slideDeckPage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
]

{ #category : #view }
PrioritySlideshow >> gtSlideMethodsListViewFor: aView [
	<gtView>
	^ aView columnedList
		priority: 30;
		title: 'Slides';
		items: [ self slideMethods collect: #asRingDefinition ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Methods'
			text: [ :each | each selector ]
			width: 200;
		column: 'Text' text: [ :each | self textForSlide: each selector ];
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
]

{ #category : #view }
PrioritySlideshow >> gtSlidePrioritiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Slide priorities';
		priority: 40;
		object: [ (self class >> #slidePriorities) asRingDefinition ];
		view: #gtSourceFor:;
		actionUpdateButton;
		updateWhen: SlideshowMethodUpdated in: self announcer
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

{ #category : #testing }
PrioritySlideshow >> hasDemoPragmas [
	^ self class methods
		detect: [ :m | m hasPragmaNamed: 'demo:' ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #testing }
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

{ #category : #exporting }
PrioritySlideshow >> htmlDir [
	"Where to save the HTML files."

	^ FileLocator imageDirectory / (self class name , '-HTML')
]

{ #category : #accessing }
PrioritySlideshow >> initHTMLDir [
	^ self htmlDir
		ensureDeleteAll;
		ensureCreateDirectory
]

{ #category : #accessing }
PrioritySlideshow >> initSlideDir [
	^ self slideDir
		ensureDeleteAll;
		ensureCreateDirectory
]

{ #category : #initialization }
PrioritySlideshow >> initialize [
	super initialize.
	announcer := Announcer new.
	self subscribeToSystem.
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

{ #category : #subscriptions }
PrioritySlideshow >> notifyMethodsUpdated [
	self announcer announce: SlideshowMethodUpdated new
]

{ #category : #subscriptions }
PrioritySlideshow >> onMethodAdded: aMethodAdded [
	self notifyMethodsUpdated
]

{ #category : #subscriptions }
PrioritySlideshow >> onMethodModified: aMethodModified [
	self notifyMethodsUpdated
]

{ #category : #subscriptions }
PrioritySlideshow >> onMethodRemoved: aMethodRemoved [
	self notifyMethodsUpdated
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
		ifAbsent: [ "self inform: 'Warning: Missing slide priority for ' , aSlideMethodSelector printString, ' in ', self class name, '#>>slidePriorities'."
			self slidePriorities size + 1 ]
]

{ #category : #utility }
PrioritySlideshow >> scalableSlide: aSlide [
	"No longer needed?"
	^ aSlide asScalableSlide
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
	"NB: this uses PrioritySlideshow>>#slideFor: in Element
	snippets to embed slides in a page."

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
	^ (methods collect: [ :each | each asSlide -> each ]) asOrderedDictionary
]

{ #category : #accessing }
PrioritySlideshow >> slideDimensions [
	^ slideDimensions ifNil: [ self defaultSlideDimensions ]
]

{ #category : #accessing }
PrioritySlideshow >> slideDimensions: aPoint [
	slideDimensions := aPoint
]

{ #category : #exporting }
PrioritySlideshow >> slideDir [
	"Where to save the PNG files."

	^ FileLocator imageDirectory / self class name
]

{ #category : #utility }
PrioritySlideshow >> slideFor: selector [
	"Used in PrioritySlideshow>>#slideDeckPage to embed slides in a Lepiter page."

	^ (self class >> selector) asScalableSlideWithBorder
]

{ #category : #accessing }
PrioritySlideshow >> slideMethods [
	"Return the <gtSlide> methods flagging those that are missing priorities, and those listed in priorities but not implemented."

	| methodDict slideMethods missingSlides missingPriority |
	methodDict := ((self class allMethods
			select: [ :m | m hasPragmaNamed: 'gtSlide' ])
			collect: [ :m | m selector -> m ]) asDictionary.
	slideMethods := OrderedCollection new.
	missingSlides := OrderedCollection new.

	self slidePriorities
		do: [ :selector | 
			methodDict
				at: selector
				ifPresent: [ :m | slideMethods addLast: m ]
				ifAbsent: [ missingSlides addLast: selector ] ].
	missingPriority := methodDict keys copyWithoutAll: self slidePriorities.

	missingPriority
		do: [ :selector | slideMethods addLast: (methodDict at: selector) ].

	"missingSlides
		ifNotEmpty: [ self
				inform: 'Missing <gtSlide> methods in ' , self class name , ' for: '
						, (' ' join: missingSlides) ].
	missingPriority
		ifNotEmpty: [ self
				inform: 'Missing slide priorities in ' , self class name , '>>#slidePriorities for: '
						, (' ' join: missingPriority) ]."
	^ slideMethods
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

{ #category : #subscriptions }
PrioritySlideshow >> subscribeToSystem [
	"Subscribe to method updates"
	self unsubscribeFromSystem.
	SystemAnnouncer uniqueInstance weak
		when: MethodAdded send: #onMethodAdded: to: self;
		when: MethodRemoved send: #onMethodRemoved: to: self;
		when: MethodModified send: #onMethodModified: to: self
]

{ #category : #text }
PrioritySlideshow >> subtitleSize [
	^ 40
]

{ #category : #accessing }
PrioritySlideshow >> summaryElementFor: slideSelectors [
	"Create an element holding 4 (more or less) slides in a grid to be used in a summary slide."

	| slides container |
	slides := slideSelectors
			collect: [ :selector | 
				| method slide |
				method := self class methodNamed: selector.
				slide := method asSlide asScalableSlideWithBorder asElement
						margin: (BlInsets all: 10);
						yourself ].
	container := BlElement new
			layout: (BlGridLayout new columnCount: 2);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			addChildren: slides;
			yourself.
	^ container
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

{ #category : #subscriptions }
PrioritySlideshow >> unsubscribeFromSystem [
	SystemAnnouncer uniqueInstance unsubscribe: self
]

{ #category : #accessing }
PrioritySlideshow >> wordsPerMinute [
	"Override in subclasses, if desired."

	^ 140
]
