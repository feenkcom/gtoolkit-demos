"
I define the View for the {{gtClass:name=HelloWorldSnippet}}.
#Steps
• Define a subclass of {{gtClass:name=LeSnippetElement}} (or one of its subclasses).
• Define and initialize the snippet element. Implement `snippetContent` to return this element.
• Implement the required method `snippetToolbar` to return the element representing the toolbar to appear below the content. Return `nil` if this is not needed.
"
Class {
	#name : #HelloWorldSnippetElement,
	#superclass : #LeSnippetElement,
	#instVars : [
		'textElement'
	],
	#category : #'GToolkit-Demo-Snippets-HelloWorld'
}

{ #category : #initalization }
HelloWorldSnippetElement >> initialize [
	super initialize.
	self initializeElement
]

{ #category : #initalization }
HelloWorldSnippetElement >> initializeElement [
	| aString |
	aString := 'Hello World'.
	textElement := BlTextElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			yourself.
	textElement text: aString asRopedText glamorousCodeFont
]

{ #category : #'api - view' }
HelloWorldSnippetElement >> snippetContent [
	"Return an element that represents a content of the snippet.
	The embedder is responsible for placing #snippetContent in the right place
	within snippet element depending on the View Model properties and derived look"
	<return: #BlElement>
	^ self textElement
]

{ #category : #'api - view' }
HelloWorldSnippetElement >> snippetToolbar [
	"Return an element that represents a toolbar of the snippet. A toolbar usually appears below the snippet content.
	The embedder is responsible for placing #snippetToolbar in the right place within snippet element depending on the
	View Model properties and derived look.
	If returned #snippetToolbar is nil, no toolbar will be added"
	<return: #BlElement or: nil>

	^ nil
]

{ #category : #accessing }
HelloWorldSnippetElement >> textElement [
	^ textElement
]
