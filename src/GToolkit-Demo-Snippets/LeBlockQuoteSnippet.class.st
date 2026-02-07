"
I am a simple text snippet that displays literal text as a Markdown block quote.

I am also a small demo of how to define a new Snippet class.

"
Class {
	#name : #LeBlockQuoteSnippet,
	#superclass : #LePlainTextSnippet,
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #'api - accessing' }
LeBlockQuoteSnippet class >> contextMenuItemSpecification [
	"This method is required for every snippet class that should appear in the context menu of a page for adding new snippets."
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: self description
]

{ #category : #factory }
LeBlockQuoteSnippet class >> description [
	"Text for the context menu"
	^ 'Block quote'
]

{ #category : #'lepiter-store' }
LeBlockQuoteSnippet class >> leJsonV4Name [
	"The name for this type of snippet in the JSON representation."
	^ #blockQuoteSnippet
]

{ #category : #visiting }
LeBlockQuoteSnippet >> acceptVisitor: aVisitor [
	"NB: In case visitors need to do something special here, we need to introduce a new method visitBlockQuoteSnippet: and add it to TLeModelVisitor, the trait for all Lepiter model visitors."
	
	^ aVisitor visitBlockQuoteSnippet: self
]

{ #category : #converting }
LeBlockQuoteSnippet >> asSnippetViewModel [
	"The view model for this class, holding all model state for the UI view."
	<return: #LeSnippetViewModel>
	
	^ LeBlockQuoteSnippetViewModel new snippetModel: self
]

{ #category : #'api - editing' }
LeBlockQuoteSnippet >> text: aBlText [
	"Plain text, so we have no ougoing textual links."
	self assertText: aBlText.
	text := aBlText.
	"self updateOutgoingTextualLinks."
	self updateUnlinkedReferences.
]
