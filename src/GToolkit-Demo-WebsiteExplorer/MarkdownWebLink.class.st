Class {
	#name : #MarkdownWebLink,
	#superclass : #WebLink,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #accessing }
MarkdownWebLink >> checkPageStatus [
	super checkPageStatus.
	self status = self missingStatus ifFalse: [ ^ self ].
	(self pageHeaderLinks includes: self headerName)
		ifTrue: [ ^ self status: self okPageStatus ].
	^ self
]

{ #category : #accessing }
MarkdownWebLink >> headerName [
	^ (self path copyFrom: (self path lastIndexOf: $/) + 1 to: self path size)
		trimLeft: [ :char | char = $# or: [ char = Character space ] ]
]

{ #category : #accessing }
MarkdownWebLink >> pageHeaderLinks [
	| joinedSet |
	joinedSet := Set new.
	(self pages collect: [ :page | page headerLinks ])
		do: [ :eachSet | joinedSet addAll: eachSet ].
	^ joinedSet
]

{ #category : #accessing }
MarkdownWebLink >> path [
^ super path replaceAllRegex: '\.md*#*(.*)' with: '.md'
]

{ #category : #constant }
MarkdownWebLink >> suffix [
	"File suffix to be removed when generated the URL"

	^ '.md'
]
