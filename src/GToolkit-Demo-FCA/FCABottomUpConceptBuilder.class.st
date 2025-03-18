Class {
	#name : #FCABottomUpConceptBuilder,
	#superclass : #FCAConceptBuilder,
	#instVars : [
		'worklist'
	],
	#category : #'GToolkit-Demo-FCA-Algorithms'
}

{ #category : #computing }
FCABottomUpConceptBuilder >> atomicConcepts [
	| atomic |
	atomic := Set new.
	self context elements
		do: [ :anElement | 
			| concept |
			concept := self context closureFor: (self context bitSetFor: {anElement}).
			atomic add: concept ].
	^ atomic
]

{ #category : #computing }
FCABottomUpConceptBuilder >> buildLattice [
	"Simple, cubic algorithm. Encode the edges in the smaller and bigger sets.
	NB: We assume that the concepts start with empty smaller and bigger sets."

	concepts
		do: [ :c1 | 
			concepts
				do: [ :c2 | 
					c1 < c2
						ifTrue: [ concepts
								detect: [ :c3 | c1 < c3 and: [ c3 < c2 ] ]
								ifNone: [ c1 bigger add: c2.
									c2 smaller add: c1 ] ] ] ]
]

{ #category : #computing }
FCABottomUpConceptBuilder >> computeConcepts [
	concepts := {self bottom} asSet.
	concepts addAll: self atomicConcepts.
	self initializeWorklist.
	self processWorklist.
	self buildLattice.
	^ self concepts
]

{ #category : #view }
FCABottomUpConceptBuilder >> gtConceptsFor: aView [
	<gtView>
	^ aView list
		title: 'Concepts';
		priority: 10;
		items: [ self concepts asOrderedCollection ]
]

{ #category : #view }
FCABottomUpConceptBuilder >> gtWorklistFor: aView [
	<gtView>
	^ aView list
		title: 'Worklist';
		priority: 20;
		items: [ self worklist asOrderedCollection ]
]

{ #category : #computing }
FCABottomUpConceptBuilder >> initializeWorklist [
	| endIndex atomic |
	atomic := self atomicConcepts asOrderedCollection.
	worklist := OrderedCollection new.
	endIndex := atomic size.
	atomic withIndexDo: [ :c1 :i1 | 
			i1 < endIndex
				ifTrue: [ (atomic copyFrom: i1 + 1 to: endIndex)
						do: [ :c2 |  c1 <> c2 
							ifTrue: [ worklist add: {c1. c2} ] ] ] ].
	^ self worklist
]

{ #category : #computing }
FCABottomUpConceptBuilder >> processWorklist [
	[ worklist notEmpty ]
		whileTrue: [ | pair join |
			pair := worklist removeFirst.
			join := pair first join: pair second.
			(self concepts includes: join)
				ifFalse: [ self concepts add: join.
					(concepts select: [ :c | c <> join ])
						do: [ :c |  worklist addLast: {c. join} ] ] ]
]

{ #category : #accessing }
FCABottomUpConceptBuilder >> worklist [
	^ worklist ifNil: [ worklist := OrderedCollection new ]
]
