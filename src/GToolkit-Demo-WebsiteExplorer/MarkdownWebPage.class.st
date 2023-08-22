"
To be refactored as a peer instead of a subclass of PillarWebPage.
"
Class {
	#name : #MarkdownWebPage,
	#superclass : #AWebPage,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #accessing }
MarkdownWebPage >> rawLinks [
	^ rawLinks ifNil: [ rawLinks := self markdownLinks ]
]

{ #category : #links }
MarkdownWebPage >> reachable [
	^ WebPageGroup withAll: (self reachableFrom: {self})
]

{ #category : #accessing }
MarkdownWebPage >> title [
	^ title
		ifNil: [ | dict |
			dict := self titleParser parse: self contents.
			title := dict at: 'title' ifAbsent: ['MISSING TITLE']
			 ]
]

{ #category : #parsing }
MarkdownWebPage >> titleParser [
	^ MDWebPageParser
]
