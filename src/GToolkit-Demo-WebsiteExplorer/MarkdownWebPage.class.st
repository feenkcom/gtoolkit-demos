"
To be refactored as a peer instead of a subclass of PillarWebPage.
"
Class {
	#name : #MarkdownWebPage,
	#superclass : #AWebPage,
	#instVars : [
		'yaml'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #testing }
MarkdownWebPage >> isRoot [
"If the page's file has a YAML header, we can tell which page is the root."
	^ self permalink = '/'
]

{ #category : #accessing }
MarkdownWebPage >> permalink [
	^ self yaml at: 'permalink' ifAbsent: [ self path removeSuffix: '.md' ]
]

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
	^ title ifNil: [ self yaml at: 'title' ifAbsent: [ 'MISSING TITLE' ] ]
]

{ #category : #accessing }
MarkdownWebPage >> url [
	^ self website url , self permalink 
]

{ #category : #parsing }
MarkdownWebPage >> yaml [
	"I return the YAML header (if any) extended with a binding for the Markdown body."

	^ yaml ifNil: [ yaml := MDWebPageParser parse: self contents ]
]
