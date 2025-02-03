Class {
	#name : #LeBlockQuoteSnippetElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'editorElement'
	],
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #accessing }
LeBlockQuoteSnippetElement >> editor [
	"Do we need this?"
	<return: #BrTextEditorModel>
	^ self editorElement editor
]

{ #category : #accessing }
LeBlockQuoteSnippetElement >> editorElement [
	<return: #BrEditor>
	^ editorElement
]

{ #category : #initialization }
LeBlockQuoteSnippetElement >> initialize [
	super initialize.
	self initializeEditorElement
]

{ #category : #initialization }
LeBlockQuoteSnippetElement >> initializeEditorElement [
	"Should we use a GtSourceCoderEditorElement?"

	editorElement := BrEditor new
			hMatchParent;
			vFitContent;
			aptitude: BrGlamorousCodeEditorAptitude new;
			background: Color veryVeryLightGray;
			yourself
]

{ #category : #'api - snippet view model' }
LeBlockQuoteSnippetElement >> onSnippetViewModelChanged [
	super onSnippetViewModelChanged.

	self updateCoderViewModel
]

{ #category : #'api - view' }
LeBlockQuoteSnippetElement >> snippetContent [
	"Return an element that represents a content of the snippet.
	The embedder is responsible for placing #snippetContent in the right place
	within snippet element depending on the View Model properties and derived look"
	<return: #BlElement>
	^ editorElement
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

{ #category : #'api - snippet view model' }
LeBlockQuoteSnippetElement >> updateCoderViewModel [
	editorElement text: self snippetViewModel text
]
