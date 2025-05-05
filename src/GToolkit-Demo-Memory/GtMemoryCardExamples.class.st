Class {
	#name : #GtMemoryCardExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Memory-Examples'
}

{ #category : #accessing }
GtMemoryCardExamples >> cardWithSymbol7 [
	<gtExample>
	<return: #GtMemoryCard>
	| aCard |
	aCard := GtMemoryCard new symbol: 7.
	self assert: aCard isFlipped not.
	self assert: aCard isVisible.
	self assert: aCard symbol = 7.
	^ aCard
]

{ #category : #accessing }
GtMemoryCardExamples >> cardWithSymbolA [
	<gtExample>
	<return: #GtMemoryCard>
	| aCard |
	aCard := GtMemoryCard new symbol: $A.
	self assert: aCard isFlipped not.
	self assert: aCard isVisible.
	^ aCard
]

{ #category : #accessing }
GtMemoryCardExamples >> disappearedCardIsNotVisible [
	<gtExample>
	<return: #GtMemoryCard>
	| aCard |
	aCard := self flippedCardIsFlipped.
	self assert: aCard isVisible.
	aCard disappear.
	self assert: aCard isVisible not.
	^ aCard
]

{ #category : #accessing }
GtMemoryCardExamples >> flippedCardIsFlipped [
	<gtExample>
	<return: #GtMemoryCard>
	| aCard |
	aCard := self cardWithSymbolA.
	aCard flip.
	self assert: aCard isFlipped.
	^ aCard
]
