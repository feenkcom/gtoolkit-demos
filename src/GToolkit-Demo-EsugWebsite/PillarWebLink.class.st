Class {
	#name : #PillarWebLink,
	#superclass : #Object,
	#instVars : [
		'path',
		'website',
		'pages',
		'status',
		'announcer'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

{ #category : #accessing }
PillarWebLink class >> for: aPath in: aWebsite [
	^ self new
		path: aPath;
		website: aWebsite;
		yourself
]

{ #category : #accessing }
PillarWebLink >> addPage: aPage [
	self pages add: aPage
]

{ #category : #announcements }
PillarWebLink >> announcer [
	^ announcer
]

{ #category : #announcements }
PillarWebLink >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
PillarWebLink >> checkHttpStatus [
	[ ZnClient new
		enforceHttpSuccess;
		timeout: 1;
		head: self path;
		response.
	self status: self httpOkStatus ] onErrorDo: [ :ex | self status: ex printString ]
]

{ #category : #accessing }
PillarWebLink >> checkPageStatus [
	self isEmail ifTrue: [ ^ self status: self okEmailStatus ].
	(self website hasPageNamed: self path)
		ifTrue: [ ^ self status: self okPageStatus ].
	(self website repoDir / (self path copyWithRegex: '^/' matchesReplacedWith: ''))
		exists ifTrue: [ ^ self status: self okFileStatus ].
	^ self status: self missingStatus
]

{ #category : #accessing }
PillarWebLink >> checkStatus [
	self isHttp ifTrue: [ self checkHttpStatus ] ifFalse: [ self checkPageStatus ]
]

{ #category : #accessing }
PillarWebLink >> gtActionCheckStatusFor: anAction [

	<gtAction>
	self status ifNotEmpty:  [ ^ anAction noAction ].

	^ anAction button
		  icon: BrGlamorousIcons accept;
		  tooltip: 'Check status';
		  action: [self checkStatus ]
]

{ #category : #accessing }
PillarWebLink >> gtOverviewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Overview';
		priority: 10;
		items: [ {'Path' -> self path.
				'# Pages' -> self pages size.
				'Status' -> self status} ];
		column: 'Attribute'
			text: [ :item | item key ]
			width: 100;
		column: 'Value'
			text: [ :item | item value ]
			width: 400;
		actionUpdateButton;
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #accessing }
PillarWebLink >> gtPagesFor: aView [
	<gtView>
	^ aView list
		title: 'Pages';
		priority: 20;
		items: [ self pages asOrderedCollection ];
		actionUpdateButton
]

{ #category : #constant }
PillarWebLink >> httpOkStatus [
	^ 'HTTP OK'
]

{ #category : #initialization }
PillarWebLink >> initialize [
	super initialize.
	self announcer: Announcer new.
	self pages: Set new.
	self status: self noStatus.
]

{ #category : #testing }
PillarWebLink >> isBroken [
	^ self isHttp
		and: [ self statusMissing not and: [ self status ~= self httpOkStatus ] ]
]

{ #category : #testing }
PillarWebLink >> isEmail [
	^ self path matchesRegex: EsugWebPage emailRegexString
]

{ #category : #testing }
PillarWebLink >> isHttp [
	^ self path beginsWith: 'http'
]

{ #category : #testing }
PillarWebLink >> isInternal [
	^ self isHttp not
]

{ #category : #testing }
PillarWebLink >> isMissing [
	^ self status = self missingStatus
]

{ #category : #constant }
PillarWebLink >> missingStatus [
	"There is no file at this path"

	^ 'missing'
]

{ #category : #constant }
PillarWebLink >> noStatus [
	^ ''
]

{ #category : #announcements }
PillarWebLink >> notifyStatusUpdate [
	self announcer announce: PillarWebLinkStatusUpdated new.
	self website ifNotNil: [ self website notifyStatusUpdate ]
]

{ #category : #constant }
PillarWebLink >> okEmailStatus [
	"An email link -- we don't check these."

	^ 'ok (email)'
]

{ #category : #constant }
PillarWebLink >> okFileStatus [
	"There is a non-Pillar file at this path."

	^ 'ok (file)'
]

{ #category : #constant }
PillarWebLink >> okPageStatus [
	"There is a Pillar page at this path."

	^ 'ok'
]

{ #category : #accessing }
PillarWebLink >> pages [
	^ pages
]

{ #category : #accessing }
PillarWebLink >> pages: anObject [
	pages := anObject
]

{ #category : #accessing }
PillarWebLink >> path [
	^ path
]

{ #category : #accessing }
PillarWebLink >> path: aPath [
	path := aPath
]

{ #category : #accessing }
PillarWebLink >> printOn: aStream [
	self path printOn: aStream
]

{ #category : #accessing }
PillarWebLink >> status [
	^ status
]

{ #category : #initialization }
PillarWebLink >> status: aString [
	status := aString.
	self notifyStatusUpdate
]

{ #category : #testing }
PillarWebLink >> statusMissing [
	^ self status = self noStatus
]

{ #category : #accessing }
PillarWebLink >> website [
	^ website
]

{ #category : #accessing }
PillarWebLink >> website: aWebsite [
	website := aWebsite
]
