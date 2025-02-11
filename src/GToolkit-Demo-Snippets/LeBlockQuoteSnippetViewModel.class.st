"
I am a ViewModel for a {{gtClass:name=LeBlockQuoteSnippet}}.
I hold the state needed to display the view.
"
Class {
	#name : #LeBlockQuoteSnippetViewModel,
	#superclass : #LePlainTextCoderSnippetViewModel,
	#instVars : [
		'textEditorModel'
	],
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #initialization }
LeBlockQuoteSnippetViewModel >> initializeTextCoderViewModel [
	textCoder := GtTextCoder new.
	textCoderViewModel := textCoder asCoderViewModel.
]

{ #category : #'api - accessing' }
LeBlockQuoteSnippetViewModel >> snippetElementClass [
	^ LeBlockQuoteSnippetElement
]
