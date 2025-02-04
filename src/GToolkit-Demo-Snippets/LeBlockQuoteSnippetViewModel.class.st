"
I am a ViewModel for a {{gtClass:name=LeBlockQuoteSnippet}}.
I hold the state needed to display the view.
"
Class {
	#name : #LeBlockQuoteSnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #'api - accessing' }
LeBlockQuoteSnippetViewModel >> snippetElementClass [
	^ LeBlockQuoteSnippetElement
]

{ #category : #acccessing }
LeBlockQuoteSnippetViewModel >> text [
	^ self snippetModel text
]
