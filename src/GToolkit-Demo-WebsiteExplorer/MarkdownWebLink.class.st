Class {
	#name : #MarkdownWebLink,
	#superclass : #WebLink,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #constant }
MarkdownWebLink >> suffix [
	"File suffix to be removed when generated the URL"

	^ '.md'
]
