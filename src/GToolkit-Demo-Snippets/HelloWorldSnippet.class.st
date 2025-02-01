"
I am a minimal demo of how to define a new Snippet class.

I define the Model for a “Hello World” snippet that simply displays the text “Hello World”.

My intent is to show all the steps needed to define a new kind of snippet, even one that does virtually nothing of interest.
# Steps
• Define a subclass of {{gtClass:name=LeSnippet}} (or one of its subclasses).
• Define and initialize any needed state (in this case we define `contentString` and initialize it to “`Hello world!`”.
• Override `storeOn:` to generate Smalltalk code which, when evaluated, creates a copy of this snippet.
• Override the *class* methods `leJsonV4AttributeMapping` and `leJsonV4Name` to specify what state should be mapped to the JSON representation.
*NB:* Be sure to run `LeJsonV4 cleanUniqueInstance` to update the JSON writer to include the new mapping.
• Implement the boilerplate *class* methods `contextMenuItemSpecification` and `description` to include this snippet type in the contextual menu for Lepiter pages.
• Implement `canMoveToAnotherDatabase` to return `true` if there are no dependencies to files in the database.
• Implement required factory method `empty` to return a basic instance.
• Define the View Model class — in this case {{gtClass:name=HelloWorldSnippetViewModel}} — and use it to implement `asSnippetViewModel` to return an instance of the view model holding all the state needed to create the view.
• Add an example page containing the snippet to {{gtClass:name=MovingPagesExamples}} for testing
"
Class {
	#name : #HelloWorldSnippet,
	#superclass : #LeSnippet,
	#instVars : [
		'contentString'
	],
	#category : #'GToolkit-Demo-Snippets-HelloWorld'
}

{ #category : #'api - accessing' }
HelloWorldSnippet class >> contextMenuItemSpecification [
	"Specify the menu text for creating this snippet within a page."
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: self description
]

{ #category : #factory }
HelloWorldSnippet class >> description [
	"Text for the context menu"
	^ 'Hello World!'
]

{ #category : #factory }
HelloWorldSnippet class >> empty [
	"Return a content (page or block) with empty values (title or text).
	Required by ${method:LeContent>>#addBlockOfClass:after:}$"
	^ self new
]

{ #category : #jsonV4 }
HelloWorldSnippet class >> leJsonV4AttributeMapping [
	"Answer the Array of attribute to store keys.
	Subclasses should override this with their attributes.
	This is an array as it is normally cached."
	^ super leJsonV4AttributeMapping
		add: #contentString -> #contentString;
		yourself
]

{ #category : #'lepiter-store' }
HelloWorldSnippet class >> leJsonV4Name [
	^ #helloWorldSnippet
]

{ #category : #converting }
HelloWorldSnippet >> asSnippetViewModel [
	"The view model for this class, holding all model state for the UI view."
	<return: #LeSnippetViewModel>
	^ HelloWorldSnippetViewModel new snippetModel: self
]

{ #category : #testing }
HelloWorldSnippet >> canMoveToAnotherDatabase [
	"For the moment, if a snippet has links to attachments in the database or is somehow tied to other files, it cannot be moved.
	Each snippet class should implement this as true or false, or implement the corresponding logic."
	^ true
]

{ #category : #accessing }
HelloWorldSnippet >> contentString [
	^ contentString
]

{ #category : #accessing }
HelloWorldSnippet >> contentString: aString [
	contentString := aString
]

{ #category : #initialization }
HelloWorldSnippet >> defaultContentString [
	^ 'Hello world!'
]

{ #category : #initialization }
HelloWorldSnippet >> initialize [
	super initialize.
	self contentString: self defaultContentString
]

{ #category : #printing }
HelloWorldSnippet >> storeOn: aStream [
	"Generate a Smalltalk string which, when evaluated, regenerates this object."
	aStream
		nextPut: $(;
		nextPutAll: self className;
		nextPutAll: ' new contentString:'.
	self contentString storeOn: aStream.
	aStream nextPutAll: '; yourself)'
]
