Class {
	#name : #LeBlockQuoteSnippetViewModel,
	#superclass : #LeStringSnippetViewModel,
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

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
