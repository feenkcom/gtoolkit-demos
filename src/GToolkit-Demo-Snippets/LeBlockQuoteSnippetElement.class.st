Class {
	#name : #LeBlockQuoteSnippetElement,
	#superclass : #LeStringSnippetElement,
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #initialization }
LeBlockQuoteSnippetElement >> initializeContentElement [
	contentElement := BrFrame new
			hMatchParent;
			vFitContent;
			addChild: editorElement
]

{ #category : #initialization }
LeBlockQuoteSnippetElement >> initializeEditorElement [
	super initializeEditorElement.
	editorElement
		background: Color veryVeryLightGray
]

{ #category : #'api - view' }
LeBlockQuoteSnippetElement >> snippetToolbar [
	"Return an element that represents a toolbar of the snippet. A toolbar usually appears below the snippet content.
	The embedder is responsible for placing #snippetToolbar in the right place within snippet element depending on the
	View Model properties and derived look.
	If returned #snippetToolbar is nil, no toolbar will be added"
	<return: #BlElement or: nil>

	^ nil
]
