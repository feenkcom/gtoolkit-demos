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
	"The name for this type of snippet in the JSON representation."
	^ #blockQuoteSnippet
]

{ #category : #'private - asserting' }
LeBlockQuoteSnippet >> appendText: aText source: anObject [
	"Adapted from LeTextSnippet>>#appendText:source:"
	aText ifEmpty: [ ^ self ].
	self assertText: aText.
	self text append: aText.
	self updateEditTimeAndEmail.
	self announceTextChangedBy: anObject
]

{ #category : #'api - editing' }
LeBlockQuoteSnippet >> asElement [
	"Not strictly needed; just for  debugging."
	^ self asPreviewElement children first
]

{ #category : #converting }
LeBlockQuoteSnippet >> asPhlowTool [
	^ GtPhlowCompositeTool new
		addTool: (LeIsolatedSnippetPhlowTool snippet: self);
		addTool: (GtPhlowTool default object: self)
]

{ #category : #converting }
LeBlockQuoteSnippet >> asPreviewElement [
	<return: #BlElement>
	| snippetViewModel |
	snippetViewModel := self asSnippetViewModel.
	^ snippetViewModel snippetView asElement
		snippetViewModel: snippetViewModel;
		yourself
]

{ #category : #converting }
LeBlockQuoteSnippet >> asSnippetViewModel [
	"The view model for this class, holding all model state for the UI view."
	<return: #LeSnippetViewModel>
	^ LeBlockQuoteSnippetViewModel new snippetModel: self
]

{ #category : #converting }
LeBlockQuoteSnippet >> asToolElement [
	<return: #BlElement>
	^ self asPreviewElement
]

{ #category : #'private - asserting' }
LeBlockQuoteSnippet >> assertText: aText [
	"From LeTextSnippet>>#assertText:"
	self 
		assert: [ aText isNotNil ] 
		description: [ 'Block text must be non-nil' ]. 
	self 
		assert: [ aText isKindOf: BlText ] 
		description: [ 'Block text must be a ', BlText name, ' instance' ]. 
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
	"Generate Smalltalk code which, when evaluated, creates a copy of this snippet."
	aStream
		nextPut: $(;
		nextPutAll: self className;
		nextPutAll: ' new string: '.
	self string storeOn: aStream.
	aStream nextPutAll: '; yourself)'
]

{ #category : #accessing }
LeBlockQuoteSnippet >> string: aString [
	"Initialize text from a plain String."
	self text: aString asRopedText
]

{ #category : #accessing }
LeBlockQuoteSnippet >> text [ 
	"Lazily initialized getter."
	<return: #BlText>
	^ text ifNil: [ text := '' asRopedText ]
]

{ #category : #accessing }
LeBlockQuoteSnippet >> text: aBlText [
	"Setter from a Roped text instance."
	text := aBlText
]

{ #category : #'private - asserting' }
LeBlockQuoteSnippet >> updateText: aText source: anObject [
	"Adapted from LeTextSnippet>>#updateText:source:"
	self assertText: aText.
	self text characters = aText characters ifTrue: [ ^ self ].	"self updater string: aText."
	self announceTextChangedBy: anObject
]
