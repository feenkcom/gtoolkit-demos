Class {
	#name : #EsugWebLink,
	#superclass : #Object,
	#instVars : [
		'path',
		'website',
		'pages',
		'status'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

{ #category : #accessing }
EsugWebLink class >> for: aPath in: aWebsite [
	^ self new
		path: aPath;
		website: aWebsite;
		yourself
]

{ #category : #accessing }
EsugWebLink >> addPage: aPage [
	self pages add: aPage
]

{ #category : #accessing }
EsugWebLink >> checkHttpStatus [
	[ ZnClient new
		enforceHttpSuccess;
		timeout: 1;
		head: self path;
		response.
	self status: self httpOkStatus ] onErrorDo: [ :ex | self status: ex printString ]
]

{ #category : #accessing }
EsugWebLink >> checkPageStatus [
	self isEmail ifTrue: [ ^ self status: self okEmailStatus ].
	(self website hasPageNamed: self path)
		ifTrue: [ ^ self status: self okPageStatus ].
	(self website repoDir / (self path copyWithRegex: '^/' matchesReplacedWith: ''))
		exists ifTrue: [ ^ self status: self okFileStatus ].
	^ self status: self missingStatus
]

{ #category : #accessing }
EsugWebLink >> checkStatus [
	self isHttp ifTrue: [ self checkHttpStatus ] ifFalse: [ self checkPageStatus ]
]

{ #category : #accessing }
EsugWebLink >> gtActionCheckStatusFor: anAction [

	<gtAction>
	self status ifNotEmpty:  [ ^ anAction noAction ].

	^ anAction button
		  icon: BrGlamorousIcons accept;
		  tooltip: 'Check status';
		  action: [self checkStatus ]
]

{ #category : #accessing }
EsugWebLink >> gtOverviewFor: aView [
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
		actionUpdateButton
]

{ #category : #accessing }
EsugWebLink >> gtPagesFor: aView [
	<gtView>
	^ aView list
		title: 'Pages';
		priority: 20;
		items: [ self pages asOrderedCollection ];
		actionUpdateButton
]

{ #category : #constant }
EsugWebLink >> httpOkStatus [
	^ 'HTTP OK'
]

{ #category : #initialization }
EsugWebLink >> initialize [
	super initialize.
	self pages: Set new.
	self status: self noStatus
]

{ #category : #testing }
EsugWebLink >> isBroken [
	^ self isHttp
		and: [ self statusMissing not and: [ self status ~= self httpOkStatus ] ]
]

{ #category : #testing }
EsugWebLink >> isEmail [
	^ self path matchesRegex: EsugWebPage emailRegexString
]

{ #category : #testing }
EsugWebLink >> isHttp [
	^ self path beginsWith: 'http'
]

{ #category : #testing }
EsugWebLink >> isInternal [
	^ self isHttp not
]

{ #category : #testing }
EsugWebLink >> isMissing [
	^ self status = self missingStatus
]

{ #category : #constant }
EsugWebLink >> missingStatus [
	"There is no file at this path"

	^ 'missing'
]

{ #category : #constant }
EsugWebLink >> noStatus [
	^ ''
]

{ #category : #constant }
EsugWebLink >> okEmailStatus [
	"An email link -- we don't check these."

	^ 'ok (email)'
]

{ #category : #constant }
EsugWebLink >> okFileStatus [
	"There is a non-Pillar file at this path."

	^ 'ok (file)'
]

{ #category : #constant }
EsugWebLink >> okPageStatus [
	"There is a Pillar page at this path."

	^ 'ok'
]

{ #category : #accessing }
EsugWebLink >> pages [
	^ pages
]

{ #category : #accessing }
EsugWebLink >> pages: anObject [
	pages := anObject
]

{ #category : #accessing }
EsugWebLink >> path [
	^ path
]

{ #category : #accessing }
EsugWebLink >> path: aPath [
	path := aPath
]

{ #category : #accessing }
EsugWebLink >> printOn: aStream [
	self path printOn: aStream
]

{ #category : #accessing }
EsugWebLink >> status [
	^ status
]

{ #category : #initialization }
EsugWebLink >> status: aString [
	status := aString
]

{ #category : #testing }
EsugWebLink >> statusMissing [
	^ self status = self noStatus
]

{ #category : #accessing }
EsugWebLink >> website [
	^ website
]

{ #category : #accessing }
EsugWebLink >> website: aWebsite [
	website := aWebsite
]
