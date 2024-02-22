Class {
	#name : #MarkdownWebLink,
	#superclass : #WebLink,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #accessing }
MarkdownWebLink >> path [
^ super path replaceAllRegex: '\.md*#*(.*)' with: '.md'
]

{ #category : #constant }
MarkdownWebLink >> suffix [
	"File suffix to be removed when generated the URL"

	^ '.md'
]
