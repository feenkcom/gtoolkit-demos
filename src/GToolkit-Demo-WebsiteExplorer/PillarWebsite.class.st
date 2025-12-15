"
This is a demo of a Pillar website explorer.

To load a demo, inspect

{{gtMethod:name=PillarWebsiteExamples>>#esug2014}}

To explore the full ESUG website (repo will be cloned), inspect the subclass  method: {{gtMethod:name=EsugWebsite class>>#instance}}  

"
Class {
	#name : #PillarWebsite,
	#superclass : #AWebsite,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #links }
PillarWebsite >> cleanJson: anJsonString [
	| badLine |
	badLine := '#''Describing the sites menu as title,url pair'': #comment,'.
	^ anJsonString copyReplaceAll: badLine with: ''
]

{ #category : #view }
PillarWebsite >> gtOverview [
	^ {{'# Pages'.
			self pages size.
			[ self pages ]}} , super gtOverview
]

{ #category : #view }
PillarWebsite >> gtPagesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pages';
		priority: 10;
		items: [ self pages ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Title'
			text: [ :item | item title ]
			width: 150;
		column: 'Path'
			text: [ :item | item path ]
			width: 300;
		column: 'Pillar links'
			text: [ :item | 
				| size |
				size := item rawLinks size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80;
		column: 'Markdown links'
			text: [ :item | 
				| size |
				size := item markdownLinks size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: self pages ]
]

{ #category : #initialization }
PillarWebsite >> initializePages [
	^ pages := self webPageGroupClass
			withAll: (((self contentDir allChildrenMatching: '*.pillar')
					collect: [ :each | PillarWebPage for: each in: self ])
					sort: [ :a :b | 
						(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
							or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
									and: [ a path < b path ] ] ])
]

{ #category : #accessing }
PillarWebsite >> navigationRoots [
	"Extract addition root pages from the navigation menu."

	| json urls |
	json := NeoJSONReader
			fromString: (self cleanJson: (self repoDir / 'pillar.conf') contents).
	urls := (((json at: 'menu') collect: [ :menu | menu at: 'url' ]) asSet
			union: (((json at: 'menu') flatCollect: [ :menu | menu at: 'submenu' ])
					collect: [ :submenu | submenu at: 'url' ]))
			collect: [ :html | html copyReplaceAll: '.html' with: '.pillar' ].
	^ (urls select: [ :each | self hasPageNamed: each ])
		collect: [ :each | self pageNamed: each ]
]

{ #category : #constant }
PillarWebsite >> rootPath [
	"Assume this is the root of any pillar website."

	^ '/index.pillar'
]

{ #category : #constant }
PillarWebsite >> webLinkClass [
	^ PillarWebLink
]
