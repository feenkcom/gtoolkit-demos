"
I am an explorer for Markdown websites. I work with GitHup pages sites.
For some examples, see {{gtClass:name=DemoMarkdownWebsite}}. 
"
Class {
	#name : #MarkdownWebsite,
	#superclass : #AWebsite,
	#instVars : [
		'navigationMenuLinks'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #testing }
MarkdownWebsite >> hasPageNamed: aString [
	^ self pages
		detect: [ :page | page path = aString or: [ page permalink = (aString removeSuffix: '/') ] ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #initialization }
MarkdownWebsite >> initializePages [
	"Probably we just want to search in specific directories.
	The file suffix should be a parameter."

	^ pages := self webPageGroupClass
			withAll: (((self contentDir allChildrenMatching: '*.md')
					collect: [ :each | self webPageClass for: each in: self ])
					sort: [ :a :b | 
						(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
							or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
									and: [ a path < b path ] ] ])
]

{ #category : #accessing }
MarkdownWebsite >> navigationMenuLinks [
	^ navigationMenuLinks
]

{ #category : #accessing }
MarkdownWebsite >> navigationMenuLinks: aLinkNameCollection [
	"These can be used to identify additional roots for reachability analysis. Can be configured when the website is instantiated."

	navigationMenuLinks := aLinkNameCollection
]

{ #category : #accessing }
MarkdownWebsite >> navigationRoots [
	"Extract addition root pages from the navigation menu."
	^ (self navigationMenuLinks select: [ :each | self hasPageNamed: each ])
		collect: [ :each | self pageNamed: each ]
]

{ #category : #accessing }
MarkdownWebsite >> pageNamed: aString [
	^ self pages
		detect: [ :page | page path = aString or: [ page permalink = (aString removeSuffix: '/') ] ]
]

{ #category : #accessing }
MarkdownWebsite >> rootPath [
	"Possibly needs to be configured ..."

	^ '/'
]

{ #category : #constant }
MarkdownWebsite >> webLinkClass [
	^ MarkdownWebLink
]

{ #category : #constant }
MarkdownWebsite >> webPageClass [
	^ MarkdownWebPage
]
