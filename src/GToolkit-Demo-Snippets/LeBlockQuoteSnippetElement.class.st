Class {
	#name : #LeBlockQuoteSnippetElement,
	#superclass : #LeTextualSnippetElement,
	#instVars : [
		'editorElement'
	],
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #initialization }
LeBlockQuoteSnippetElement >> backgroundColor [
	"A color even lighter than Color veryVeryLightGray"
	| shade |
	shade := 0.95.
	^ Color r: shade g: shade b: shade alpha: 100.
]

{ #category : #accessing }
LeBlockQuoteSnippetElement >> editor [
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
	editorElement := BrEditor new
			hMatchParent;
			vFitContent;
			aptitude: BrGlamorousCodeEditorAptitude new;
			background: self backgroundColor;
			yourself.
	editorElement editor
		addEventHandler: (LeEditorReachedBorderEventHandler new snippetElement: self).
]

{ #category : #'api - snippet view model' }
LeBlockQuoteSnippetElement >> onSnippetViewModelChanged [
	super onSnippetViewModelChanged.
	self updateEditorElement
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
LeBlockQuoteSnippetElement >> updateEditorElement [
	editorElement editor: self snippetViewModel textEditorModel.
	editorElement text: self snippetViewModel text
]
