"
I represent a link in a web page to either an internal or external (http) resource that may or may not exist.

My status reveals which I am. By default this is not checked, but must be requested by sending `checkStatus`.
Subclasses should implement: `suffix`

"
Class {
	#name : #WebLink,
	#superclass : #Object,
	#instVars : [
		'path',
		'website',
		'pages',
		'status',
		'announcer'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #accessing }
WebLink class >> for: aPath in: aWebsite [
	^ self new
		path: aPath;
		website: aWebsite;
		yourself
]

{ #category : #accessing }
WebLink >> addPage: aPage [
	self pages add: aPage
]

{ #category : #announcements }
WebLink >> announcer [
	^ announcer
]

{ #category : #announcements }
WebLink >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
WebLink >> checkHttpStatus [
	[ ZnClient new
		enforceHttpSuccess;
		timeout: 1;
		head: self path;
		response.
	self status: self httpOkStatus ] onErrorDo: [ :ex | self status: ex printString ]
]

{ #category : #accessing }
WebLink >> checkPageStatus [
	self isEmail ifTrue: [ ^ self status: self okEmailStatus ].
	(self website hasPageNamed: self path)
		ifTrue: [ ^ self status: self okPageStatus ].
	(self website contentDir / (self path copyWithRegex: '^/' matchesReplacedWith: ''))
		exists ifTrue: [ ^ self status: self okFileStatus ].
	^ self status: self missingStatus
]

{ #category : #accessing }
WebLink >> checkStatus [
	self isHttp ifTrue: [ self checkHttpStatus ] ifFalse: [ self checkPageStatus ]
]

{ #category : #action }
WebLink >> gtActionCheckStatusFor: anAction [
	<gtAction>
	self status ifNotEmpty: [ ^ anAction noAction ].
	^ anAction button
		tooltip: 'Check status';
		priority: 10;
		icon: BrGlamorousIcons accept;
		action: [ self checkStatus ]
]

{ #category : #action }
WebLink >> gtActionWebBrowseFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Open in browser';
		priority: 20;
		icon: BrGlamorousVectorIcons web;
		action: [ WebBrowser openOn: self url ]
]

{ #category : #accessing }
WebLink >> gtOverviewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Overview';
		priority: 10;
		items: [ {'Path' -> self path.
				'URL' -> self url.
				'# Pages' -> self pages size.
				'Status' -> self status} ];
		column: 'Attribute'
			text: [ :item | item key ]
			width: 100;
		column: 'Value'
			text: [ :item | item value ]
			width: 400;
		actionUpdateButton;
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #accessing }
WebLink >> gtPagesFor: aView [
	<gtView>
	^ aView list
		title: 'Pages';
		priority: 20;
		items: [ self pages asOrderedCollection ];
		actionUpdateButton
]

{ #category : #constant }
WebLink >> httpOkStatus [
	^ 'HTTP OK'
]

{ #category : #initialization }
WebLink >> initialize [
	super initialize.
	self announcer: Announcer new.
	self pages: Set new.
	self status: self noStatus.
]

{ #category : #testing }
WebLink >> isBroken [
	^ self isHttp
		and: [ self statusMissing not and: [ self status ~= self httpOkStatus ] ]
]

{ #category : #testing }
WebLink >> isEmail [
	^ self path matchesRegex: AWebPage emailRegexString
]

{ #category : #testing }
WebLink >> isHttp [
	^ self path beginsWith: 'http'
]

{ #category : #testing }
WebLink >> isInternal [
	^ self isHttp not
]

{ #category : #testing }
WebLink >> isMissing [
	self isHttp ifTrue: [ ^ false ].
	self statusMissing ifTrue: [ self checkPageStatus ].
	^ self status = self missingStatus
]

{ #category : #testing }
WebLink >> isPage [
	self isHttp ifTrue: [ ^ false ].
	self statusMissing ifTrue: [ self checkPageStatus ].
	^ self status = self okPageStatus
]

{ #category : #constant }
WebLink >> missingStatus [
	"There is no file at this path"

	^ 'missing'
]

{ #category : #constant }
WebLink >> noStatus [
	^ ''
]

{ #category : #announcements }
WebLink >> notifyStatusUpdate [
	self announcer announce: WebLinkStatusUpdated new.
	self website ifNotNil: [ self website notifyStatusUpdate ]
]

{ #category : #constant }
WebLink >> okEmailStatus [
	"An email link -- we don't check these."

	^ 'ok (email)'
]

{ #category : #constant }
WebLink >> okFileStatus [
	"There is a non-Pillar file at this path."

	^ 'ok (file)'
]

{ #category : #constant }
WebLink >> okPageStatus [
	"There is a Pillar page at this path."

	^ 'ok'
]

{ #category : #accessing }
WebLink >> page [
	self assert: self isPage.
	^ self website pageNamed: self path
]

{ #category : #accessing }
WebLink >> pages [
	^ pages
]

{ #category : #accessing }
WebLink >> pages: anObject [
	pages := anObject
]

{ #category : #accessing }
WebLink >> path [
	^ path
]

{ #category : #accessing }
WebLink >> path: aPath [
	path := aPath
]

{ #category : #accessing }
WebLink >> printOn: aStream [
	self path printOn: aStream
]

{ #category : #accessing }
WebLink >> status [
	^ status
]

{ #category : #initialization }
WebLink >> status: aString [
	status := aString.
	self notifyStatusUpdate
]

{ #category : #testing }
WebLink >> statusMissing [
	^ self status = self noStatus
]

{ #category : #constant }
WebLink >> suffix [
	"File suffix to be removed when generated the URL"

	self subclassResponsibility
]

{ #category : #accessing }
WebLink >> url [
	^ self isHttp
		ifTrue: [ self path ]
		ifFalse: [ self website url , self path removeSuffix: self suffix ]
]

{ #category : #accessing }
WebLink >> website [
	^ website
]

{ #category : #accessing }
WebLink >> website: aWebsite [
	website := aWebsite
]
