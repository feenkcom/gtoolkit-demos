"
Examples queries that exploit the Smalltalk metamodel.

	ReflectionQueries new inspectCollectionSuperSends.
	ReflectionQueries new inspectOtherSuperSends.
	ReflectionQueries new inspectSmalltalkSyntaxMethods.
"
Class {
	#name : #ReflectionQueryExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #queries }
ReflectionQueryExamples >> allMethods [
	"Not the same as CompiledMethod allInstances"

	<gtExample>
	<return: #OrderedCollection>
	^ Smalltalk globals allMethods
]

{ #category : #queries }
ReflectionQueryExamples >> collectionMethodSuperSends [
	<gtExample>
	<return: #OrderedCollection>
	^ (Collection withAllSubclasses flatCollect: #methodDict) select: #sendsToSuper
]

{ #category : #queries }
ReflectionQueryExamples >> methodsWithOtherSuperSends [
	"Find methods that perform a super send to a different method."

	<gtExample>
	<return: #OrderedCollection>
	^ (self allMethods select: #sendsToSuper)
		select: [ :m | 
			(m sendNodes
				select: [ :send | send isSuperSend and: [ m selector ~= send selector ] ])
				isNotEmpty ]
]

{ #category : #queries }
ReflectionQueryExamples >> smalltalkSyntaxMethods [
	"Find all Smalltalk methods with a selection of key syntax features."

	<gtExample>
	<return: #SortedCollection>
	^ (((((((((self allMethods select: #sendsToSuper)
		select: [ :m | m comment isNotNil ]) select: [ :m | m numArgs > 0 ])
		select: [ :m | m assignmentNodes isNotEmpty ])
		select: [ :m | m selfMessages isNotEmpty ])
		select: [ :m | (m sendNodes select: #isUnary) isNotEmpty ])
		select: [ :m | (m sendNodes select: #isBinary) isNotEmpty ])
		select: [ :m | (m sendNodes select: #isKeyword) isNotEmpty ])
		select: [ :m | (m sendNodes select: #isCascaded) isNotEmpty ])
		asSortedCollection: [ :x :y | x size < y size ]
]
