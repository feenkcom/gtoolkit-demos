Class {
	#name : #FCABottomUpConceptBuilder,
	#superclass : #FCAConceptBuilder,
	#category : #'GToolkit-Demo-FCA'
}

{ #category : #computing }
FCABottomUpConceptBuilder >> atomicConcepts [
	"We use a Set in case the same concept is added multiple times.
We don't need a BitSet here."

	| concepts |
	concepts := Set new.
	self context elements
		do: [ :anElement | 
			| concept |
			concept := self context closureFor: {anElement} asBitSet.
			concepts add: concept ].
	^ concepts
]
