"
!Queries

!!What are queries?

Using queries we can interogate the code about itself. They are a small piece of code we can use to get information about a package, a class, a method or an object that satisfies one or more conditions.

For example, we can search for all the methods that use the #gtView pragma.

${example:GtWorkWithQueriesHowToGuide>>#searchForGtViewPragmaMethods|previewExpanded}$

Or we can search for all the methods that have a reference to #gtExample

${example:GtWorkWithQueriesHowToGuide>>#searchForGtExampleReferences|previewExpanded}$

But what happens when we want to search for multiple conditions? Well, queries can be composed using & or | messages.

Let's search for all the methods that use the #gtView pragma and implement a tree view.

${example:GtWorkWithQueriesHowToGuide>>#searchForGtViewTreeMethods|previewExpanded}$

Or, on top of all those methods above, let's search for those that implement a columnedTree as well.

${example:GtWorkWithQueriesHowToGuide>>#searchForGtViewTreeAndColumnedTreeMethods|previewExpanded}$

Many times, these queries will contain filters.

!!What are filters? 


"
Class {
	#name : #GtWorkWithQueriesHowToGuide,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'as yet unclassified' }
GtWorkWithQueriesHowToGuide >> searchForGtExampleReferences [
	<gtExample>
	
	^ #gtExample gtReferences.
]

{ #category : #'as yet unclassified' }
GtWorkWithQueriesHowToGuide >> searchForGtViewPragmaMethods [
	<gtExample>
	
	^ #gtView gtPragmas.
]

{ #category : #'as yet unclassified' }
GtWorkWithQueriesHowToGuide >> searchForGtViewTreeAndColumnedTreeMethods [
	<gtExample>
	
	^ #gtView gtPragmas & (#tree gtReferences | #columnedTree gtReferences).
]

{ #category : #'as yet unclassified' }
GtWorkWithQueriesHowToGuide >> searchForGtViewTreeMethods [
	<gtExample>
	
	^ #gtView gtPragmas & #tree gtReferences.
]
