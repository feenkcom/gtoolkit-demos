Class {
	#name : #LeBlockQuoteSnippetElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'textElement'
	],
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #initialization }
LeBlockQuoteSnippetElement >> initialize [
	super initialize.
	self initializeTextElement
]

{ #category : #initialization }
LeBlockQuoteSnippetElement >> initializeTextElement [
	| aString |
	aString := 'Hello World'.
	textElement := BlTextElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			yourself.
	textElement text: aString asRopedText glamorousCodeFont.
	textElement
		background: Color veryVeryLightGray
]

{ #category : #'api - view' }
LeBlockQuoteSnippetElement >> snippetContent [
	"Return an element that represents a content of the snippet.
	The embedder is responsible for placing #snippetContent in the right place
	within snippet element depending on the View Model properties and derived look"
	<return: #BlElement>
	^ self textElement
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

{ #category : #accessing }
LeBlockQuoteSnippetElement >> textElement [
	^ textElement
]
