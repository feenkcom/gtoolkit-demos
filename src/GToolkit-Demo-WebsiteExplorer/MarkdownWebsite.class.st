"
We start as a subclass of {{gtClass:name=PillarWebsite}} and later will make it a peer with a common superclass.

"
Class {
	#name : #MarkdownWebsite,
	#superclass : #PillarWebsite,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #view }
MarkdownWebsite >> gtPagesFor: aView [
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
		column: 'Markdown links'
			text: [ :item | 
				| size |
				size := item markdownLinks size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80
]

{ #category : #initialization }
MarkdownWebsite >> initializePages [
	"Probably we just want to search in specific directories.
The file suffix should be a parameter."

	^ pages := ((self repoDir allChildrenMatching: '*.md')
			collect: [ :each | MarkdownWebPage for: each in: self ])
			sort: [ :a :b | 
				(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
					or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
							and: [ a path < b path ] ] ]
]
