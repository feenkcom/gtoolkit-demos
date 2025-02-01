Class {
	#name : #LeBlockQuoteSnippet,
	#superclass : #LeStringSnippet,
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
	^ 'Block Quote'
]

{ #category : #'lepiter-store' }
LeBlockQuoteSnippet class >> leJsonV4Name [
	^ #blockQuoteSnippet
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
	^ self code
]

{ #category : #accessing }
LeBlockQuoteSnippet >> contentString [
	^ self code
]

{ #category : #accessing }
LeBlockQuoteSnippet >> contentString: aString [
	self code: aString
]

{ #category : #printing }
LeBlockQuoteSnippet >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self className;
		nextPutAll: ' new code: '.
	self code storeOn: aStream.
	aStream nextPutAll: '; yourself)'
]
