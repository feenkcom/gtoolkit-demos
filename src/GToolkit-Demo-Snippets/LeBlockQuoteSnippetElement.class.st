Class {
	#name : #LeBlockQuoteSnippetElement,
	#superclass : #LePlainTextCoderSnippetElement,
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #initialization }
LeBlockQuoteSnippetElement >> backgroundColor [
	"A color even lighter than Color veryVeryLightGray"
	| shade |
	shade := 0.95.
	^ Color r: shade g: shade b: shade alpha: 100.
]

{ #category : #initialization }
LeBlockQuoteSnippetElement >> initializeEditorElement [
	super initializeEditorElement.
	editorElement background: self backgroundColor
]
