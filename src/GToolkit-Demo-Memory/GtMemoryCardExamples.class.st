Class {
	#name : #GtMemoryCardExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Memory-Examples'
}

{ #category : #accessing }
GtMemoryCardExamples >> cardWithSymbol7 [
	<gtExample>
	| aCard |
	aCard := GtMemoryCard new symbol: 7.
	self assert: aCard isFlipped not.
	self assert: aCard symbol = 7.
	^ aCard
]

{ #category : #accessing }
GtMemoryCardExamples >> cardWithSymbolA [
	<gtExample>
	| aCard |
	aCard := GtMemoryCard new symbol: $A.
	self assert: aCard isFlipped not.
	^ aCard
]

{ #category : #accessing }
GtMemoryCardExamples >> flippedCardIsFlipped [
	<gtExample>
	| aCard |
	aCard := self cardWithSymbolA.
	aCard flip.
	self assert: aCard isFlipped.
	^ aCard

]
