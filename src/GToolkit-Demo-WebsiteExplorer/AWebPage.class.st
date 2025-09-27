"
I am an abstract superclass of WebPage objects.

Subclasses should implement `rawLinks`, `title`.

Subclasses may want to override: `webPageGroupClass`, `url`, `overview`
"
Class {
	#name : #AWebPage,
	#superclass : #Object,
	#instVars : [
		'website',
		'path',
		'childrenPages',
		'title',
		'rawLinks',
		'webPageFile'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #path }
AWebPage class >> emailRegexString [
	"Regex to recognize email links."

	^ '^[\w._%+-]+@[\w_%+-]+\.[\w._%+-]+$'
]

{ #category : #creation }
AWebPage class >> for: aFileReference in: aWebsite [
	^ self new
		website: aWebsite;
		webPageFile: aFileReference;
		yourself
]

{ #category : #accessing }
AWebPage >> childrenPages [
	"Pages that can be reached directly from links on this page."

	^ childrenPages
		ifNil: [ childrenPages := (self links select: #isPage) collect: #page ]
]

{ #category : #accessing }
AWebPage >> contents [
	^ self webPageFile contents
]

{ #category : #action }
AWebPage >> gtActionWebBrowseFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Open in browser';
		priority: 10;
		icon: BrGlamorousVectorIcons web;
		action: [ WebBrowser openOn: self url ]
]

{ #category : #view }
AWebPage >> gtContentsFor: aView [
	<gtView>
	^ aView forward
		title: 'Contents';
		priority: 15;
		object: [ self webPageFile ];
		view: #gtContentsFor:
]

{ #category : #links }
AWebPage >> gtLinksFor: aView [
	<gtView>
	^ aView forward
		title: 'Links';
		priority: 30;
		object: [ self links ];
		view: #gtLinksFor:
]

{ #category : #view }
AWebPage >> gtMapFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Map';
		priority: 43;
		painting: [ :aMondrian | 
			self website
				mapFor: aMondrian
				from: self
				with: self reachable ]
]

{ #category : #view }
AWebPage >> gtOverviewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Overview';
		priority: 10;
		items: [ self overview ];
		column: 'Attribute'
			text: [ :item | item key ]
			width: 200;
		column: 'Value'
			text: [ :item | item value ]
			width: 400;
		actionUpdateButton
]

{ #category : #links }
AWebPage >> gtRawlinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Raw links';
		priority: 20;
		items: [ self rawLinks ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: '# Pages'
			text: [ :item | (self linkForPath: item  value) pages size ]
			width: 60;
		column: 'Text'
			text: [ :item | item key ]
			width: 200;
		column: 'Link'
			text: [ :item | item value ]
			width: 400;
		send: [ :item | self linkForPath: item value ];
		actionUpdateButton
]

{ #category : #links }
AWebPage >> gtReachablePagesFor: aView [
	<gtView>
	^ aView forward
		title: 'Reachable pages';
		priority: 40;
		object: [ self reachable ];
		view: #gtPagesFor:
]

{ #category : #links }
AWebPage >> linkForPath: aPath [
	^ self website linkForPath: (self normalize: aPath)
]

{ #category : #links }
AWebPage >> links [
	"Lookup the WebLink instances for each link."

	^ (self rawLinks collect: [ :assoc | self linkForPath: assoc value ])
		asWebLinkGroup
]

{ #category : #accessing }
AWebPage >> markdownLinks [
	^ MarkdownLinkParser new optimize parse: self contents
]

{ #category : #constant }
AWebPage >> missingTitle [
	^ '<no title>'
]

{ #category : #path }
AWebPage >> normalize: aPath [
	| path |
	path := aPath.
	(path beginsWith: 'http') ifTrue: [ ^ path ].
	(path beginsWith: '/') ifTrue: [ ^ path ].
	(path matchesRegex: self class emailRegexString) ifTrue: [ ^ path ].
	path := self pathPrefix , '/' , path.
	[ path matchesRegex: '.*/[^/]+/\.\./.*' ]
		whileTrue: [ path := path copyWithRegex: '/[^/]+/\.\./' matchesReplacedWith: '/' ].
	^ path
]

{ #category : #view }
AWebPage >> overview [
	"For the gtOverviewFor: view. Subclasse may want to extend or replace this."

	^ {'Title' -> self title.
		'Path' -> self path.
		'Url' -> self url.
		'# Links' -> self links size.
		'# Reachable pages' -> self reachable size}
]

{ #category : #accessing }
AWebPage >> path [
	"My path relative to the root of the repo."

	<return: #String>
	path ifNil: [ 
		| relativePath |
		relativePath := self webPageFile relativeTo: website contentDir.
		path := '/', relativePath fullName ].
		
	self 
		assert: (path beginsWith: '/')
		description: [ 'Path must begins with the slash character (/): {1}' format: { path } ].
	self 
		assert: (path includes: $\) not
		description: [ 'Path must NOT include backslash characters (\): {1}' format: { path } ].

	^ path
]

{ #category : #path }
AWebPage >> pathPrefix [
	^ self path copyUpToLast: $/
]

{ #category : #printing }
AWebPage >> printOn: aStream [
	aStream nextPutAll: self path
]

{ #category : #links }
AWebPage >> rawLinks [
	"These are the raw String links on this page, as Associations, to be converted to link objects.
	The result can be cached in the rawLinks slot."

	self subclassResponsibility
]

{ #category : #links }
AWebPage >> reachable [
	^ self webPageGroupClass withAll: (self reachableFrom: {self})
]

{ #category : #links }
AWebPage >> reachableFrom: rootPages [
	| reachable pagesToCheck |
	reachable := OrderedCollection new.
	pagesToCheck := OrderedCollection withAll: rootPages.
	[ pagesToCheck notEmpty ]
		whileTrue: [ | aPage |
			aPage := pagesToCheck removeFirst.
			reachable addLast: aPage.
			aPage childrenPages
				do: [ :each | 
					(reachable includes: each)
						ifFalse: [ (pagesToCheck includes: each) ifFalse: [ pagesToCheck addLast: each ] ] ] ].
	^ reachable
]

{ #category : #links }
AWebPage >> registerLinks [
	^ self links do: [ :link | link addPage: self ]
]

{ #category : #accessing }
AWebPage >> title [
	"Extract the title from the page content."

	self subclassResponsibility
]

{ #category : #links }
AWebPage >> tooltip [
	^ [ BrLabel new
		aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
		padding: (BlInsets all: 2);
		text: self path;
		alignCenter ] asStencil
]

{ #category : #accessing }
AWebPage >> url [
	"Probably should be refined by subclasses."

	^ self website url , self path
]

{ #category : #accessing }
AWebPage >> webPageFile [
	^ webPageFile
]

{ #category : #accessing }
AWebPage >> webPageFile: aFileReference [
	webPageFile := aFileReference
]

{ #category : #constant }
AWebPage >> webPageGroupClass [
	"Which class should be used to instantiate groups of web pages."

	^ WebPageGroup
]

{ #category : #accessing }
AWebPage >> website [
	^ website
]

{ #category : #accessing }
AWebPage >> website: aPillarWebsite [
	website := aPillarWebsite
]
