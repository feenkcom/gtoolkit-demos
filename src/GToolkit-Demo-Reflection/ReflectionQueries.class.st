"
Examples queries that exploit the Smalltalk metamodel.

	ReflectionQueries new inspectCollectionSuperSends.
	ReflectionQueries new inspectOtherSuperSends.
	ReflectionQueries new inspectSmalltalkSyntaxMethods.
"
Class {
	#name : #ReflectionQueries,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #queries }
ReflectionQueries >> inspectCollectionSuperSends [
	((Collection withAllSubclasses flatCollect: #methodDict)
  select: #sendsToSuper) inspect.
]

{ #category : #queries }
ReflectionQueries >> inspectOtherSuperSends [
	"Find and inspect methods that perform a super send to a different method."

	((
CompiledMethod allInstances

 select: #sendsToSuper)
		select: [ :m | 
			(m sendNodes select: [ :send | send isSuperSend and: [ m selector ~= send selector ] ])
				isNotEmpty ]) inspect
]

{ #category : #queries }
ReflectionQueries >> inspectSmalltalkSyntaxMethods [
	"Find and inspect all Smalltalk methods with a selection of key features"
(
	(((((((((SystemNavigation argoUML allMethods select: #sendsToSuper)
		select: [ :m | m comment isNotNil ]) select: [ :m | m numArgs > 0 ])
		select: [ :m | m assignmentNodes isNotEmpty ]) select: [ :m | m selfMessages isNotEmpty ])
		select: [ :m | (m sendNodes select: #isUnary) isNotEmpty ])
		select: [ :m | (m sendNodes select: #isBinary) isNotEmpty ])
		select: [ :m | (m sendNodes select: #isKeyword) isNotEmpty ])
		select: [ :m | (m sendNodes select: #isCascaded) isNotEmpty ])
		asSortedCollection: [ :x :y | x size < y size ]) inspect
]
