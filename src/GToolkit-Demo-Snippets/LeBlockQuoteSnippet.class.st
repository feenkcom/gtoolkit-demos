"
I am a simple text snippet that displays literal text as a Markdown block quote.

I am also a small demo of how to define a new Snippet class.

"
Class {
	#name : #LeBlockQuoteSnippet,
	#superclass : #LeTextualSnippet,
	#instVars : [
		'text'
	],
	#category : #'GToolkit-Demo-Snippets-BlockQuote'
}

{ #category : #'api - accessing' }
LeBlockQuoteSnippet class >> contextMenuItemSpecification [
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

{ #category : #factory }
LeBlockQuoteSnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
]

{ #category : #'lepiter-store' }
LeBlockQuoteSnippet class >> leJsonV4AttributeMapping [
	"Answer the Array of attribute to store keys.
	Subclasses should override this with their attributes.
	This is an array as it is normally cached."
	^ super leJsonV4AttributeMapping
		add: #string -> #string;
		yourself
]

{ #category : #'lepiter-store' }
LeBlockQuoteSnippet class >> leJsonV4Name [
	^ #blockQuoteSnippet
]

{ #category : #accessing }
LeBlockQuoteSnippet >> asElement [
	"Not needed; just for  debugging."
	| snippetViewModel |
	snippetViewModel := self asSnippetViewModel.
	^ (snippetViewModel snippetView asElement
		snippetViewModel: snippetViewModel;
		yourself) children first
]

{ #category : #converting }
LeBlockQuoteSnippet >> asSnippetViewModel [
	"The view model for this class, holding all model state for the UI view."
	<return: #LeSnippetViewModel>
	^ LeBlockQuoteSnippetViewModel new snippetModel: self
]

{ #category : #testing }
LeBlockQuoteSnippet >> canMoveToAnotherDatabase [
	"For the moment, if a snippet has links to attachments in the database or is somehow tied to other files, it cannot be moved.
	Each snippet class should implement this as true or false, or implement the corresponding logic."
	^ true
]

{ #category : #accessing }
LeBlockQuoteSnippet >> contentAsString [
	"Used by LeSnippets>>#gtSnippetsFor:"
	^ self string
]

{ #category : #printing }
LeBlockQuoteSnippet >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self className;
		nextPutAll: ' new string: '.
	self string storeOn: aStream.
	aStream nextPutAll: '; yourself)'
]

{ #category : #accessing }
LeBlockQuoteSnippet >> string: aString [
	self text: aString asRopedText
]

{ #category : #accessing }
LeBlockQuoteSnippet >> text [ 
	<return: #BlText>
	^ text ifNil: [ text := '' asRopedText ]
]

{ #category : #accessing }
LeBlockQuoteSnippet >> text: aBlText [
	text := aBlText
]
