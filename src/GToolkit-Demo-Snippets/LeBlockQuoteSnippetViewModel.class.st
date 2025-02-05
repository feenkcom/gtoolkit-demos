"
I am a ViewModel for a {{gtClass:name=LeBlockQuoteSnippet}}.
I hold the state needed to display the view.
"
Class {
	#name : #LeBlockQuoteSnippetViewModel,
	#superclass : #LeTextualSnippetViewModel,
	#instVars : [
		'textEditorModel'
	],
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #initialization }
LeBlockQuoteSnippetViewModel >> announceTextChanged [
	self snippetModel announceContentChanged
]

{ #category : #initialization }
LeBlockQuoteSnippetViewModel >> initialize [
	super initialize.
	self initializeTextEditorModel
]

{ #category : #initialization }
LeBlockQuoteSnippetViewModel >> initializeTextEditorModel [
	textEditorModel := BrTextEditorModel new.
	textEditorModel
		when: BrTextEditorTextReplacedEvent do: [ self announceTextChanged ];
		when: BrTextEditorModifiedEvent do: [ self announceTextChanged ]
]

{ #category : #'api - snippet' }
LeBlockQuoteSnippetViewModel >> moveCursorAt: aCursorPosition [
	"Move the cursor at the given position of the textual snippet"
	textEditorModel moveCursorTo: aCursorPosition
]

{ #category : #'api - accessing' }
LeBlockQuoteSnippetViewModel >> snippetElementClass [
	^ LeBlockQuoteSnippetElement
]

{ #category : #acccessing }
LeBlockQuoteSnippetViewModel >> text [
	^ self snippetModel text
]

{ #category : #accessing }
LeBlockQuoteSnippetViewModel >> textEditorModel [
	^ textEditorModel
]

{ #category : #accessing }
LeBlockQuoteSnippetViewModel >> textEditorModel: anObject [
	textEditorModel := anObject
]
