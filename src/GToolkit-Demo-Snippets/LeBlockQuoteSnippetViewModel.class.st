"
I am a ViewModel for a {{gtClass:name=LeBlockQuoteSnippet}}.
I hold the state needed to display the view.
"
Class {
	#name : #LeBlockQuoteSnippetViewModel,
	#superclass : #LePlainTextCoderSnippetViewModel,
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #initialization }
LeBlockQuoteSnippetViewModel >> initializeTextCoderViewModel [
	"Initialize the state needed to keep the view and the model in sync.
	My parent handles the subscriptions and the updates."
	
	textCoder := GtTextCoder new.
	textCoderViewModel := textCoder asCoderViewModel.
]

{ #category : #'api - accessing' }
LeBlockQuoteSnippetViewModel >> snippetElementClass [
	^ LeBlockQuoteSnippetElement
]
