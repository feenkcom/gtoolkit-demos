"
I am a ViewModel for a {{gtClass:name=LeBlockQuoteSnippet}}.
I hold the state needed to display the view.
"
Class {
	#name : #LeBlockQuoteSnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #'api - snippet models' }
LeBlockQuoteSnippetViewModel >> contentString [
	^ self snippetModel contentString 
]

{ #category : #'api - snippet models' }
LeBlockQuoteSnippetViewModel >> contentString: aString [
	^ self snippetModel contentString: aString
]

{ #category : #'api - accessing' }
LeBlockQuoteSnippetViewModel >> snippetElementClass [
	^ LeBlockQuoteSnippetElement
]

{ #category : #accessing }
LeBlockQuoteSnippetViewModel >> snippetView [
	<return: #LeSnippetView>
	^ super snippetView
		needsContentDecorationBar: false;
		beFullWidth
]
