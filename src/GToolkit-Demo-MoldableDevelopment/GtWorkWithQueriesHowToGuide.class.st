"
!Queries

!!What are queries?

Using queries we can interogate the code about itself. They are a small piece of code we can use to get information about a package, a class, a method or an object that satisfies one or more conditions.

For example, we can search for all the methods that use the #gtView pragma.

${example:GtWorkWithQueriesHowToGuide>>#searchForGtViewPragmaMethods|previewExpanded}$

Or we can search for all the methods that have a reference to #gtExample

${example:GtWorkWithQueriesHowToGuide>>#searchForGtExampleReferences|previewExpanded}$

But what happens when we want to search for multiple conditions? Well, queries can be composed using & and | messages.

Let's search for all the methods that use the #gtView pragma and implement a tree view.

${example:GtWorkWithQueriesHowToGuide>>#searchForGtViewTreeMethods|previewExpanded}$

Now let's search for those methods that implement a tree and a columnedTree view.

${example:GtWorkWithQueriesHowToGuide>>#searchForGtViewTreeAndColumnedTreeMethods|previewExpanded}$

Many times, these queries will contain filters.

!!What are filters? 

They are small methods that represent the conditions that need to be satisfied. They return the items that matched the respective condition.

For example, #gtPackageMatches is a filter. So we can check all the methods that reference #todo in a certain package 

${example:GtWorkWithQueriesHowToGuide>>#searchInCertainPackage|previewExpanded}$

The following piece of code, represents a more complex query that lets you see all the predefined filters in Gt.

${example:GtWorkWithQueriesHowToGuide>>#searchAllFilters|previewExpanded}$
"
Class {
	#name : #GtWorkWithQueriesHowToGuide,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'as yet unclassified' }
GtWorkWithQueriesHowToGuide >> searchAllFilters [
	<gtExample>
	| filters |
	filters := OrderedCollection new.
	
	GtSearchFilter allSubclassesDo: [:subclass |
		subclass gtReferences do: [:referenceMethod |
			(('Filter' gtSubstringMatch includesMethod: referenceMethod) &
				(referenceMethod sourceNode selector asString beginsWithEmpty: 'gt' caseSensitive: true))
					ifTrue: [filters add: referenceMethod]]].
		
	^ filters.
]

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

{ #category : #'as yet unclassified' }
GtWorkWithQueriesHowToGuide >> searchInCertainPackage [
	<gtExample>
	
	^ #todo gtReferences & 'Bloc' gtPackageMatches.
]
