"
I define the ViewModel for the {{gtClass:name=HelloWorldSnippet}}.
I hold all the information needed to display the corresponding View (which in this case is virtually nothing).
# Steps
• Define a subclass of {{gtClass:name=LeSnippetViewModel}}(or one of its subclasses).
• Define accessors for any state needed to maintain the view.
• If needed, subscribe to the snippet model instance, and implement any methods needed to update the view model. (In this case there is nothing to do.)
• Implement `snippetElementClass` to return the class of the GUI element class for this snippet.
"
Class {
	#name : #HelloWorldSnippetViewModel,
	#superclass : #LeSnippetViewModel,
	#category : #'GToolkit-Demo-Snippets-HellowWorld'
}

{ #category : #'api - snippet models' }
HelloWorldSnippetViewModel >> contentString [
	^ self snippetModel contentString 
]

{ #category : #'api - snippet models' }
HelloWorldSnippetViewModel >> contentString: aString [
	^ self snippetModel contentString: aString
]

{ #category : #'api - accessing' }
HelloWorldSnippetViewModel >> snippetElementClass [
	^ HelloWorldSnippetElement
]
