"
We start as a subclass of {{gtClass:name=PillarWebsite}} and later will make it a peer with a common superclass.

"
Class {
	#name : #MarkdownWebsite,
	#superclass : #AWebsite,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

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

{ #category : #accessing }
MarkdownWebsite >> rootPath [
	"This needs to be configured ..."

	^ '/index.md'
]

{ #category : #constant }
MarkdownWebsite >> webLinkClass [
	^ MarkdownWebLink
]
