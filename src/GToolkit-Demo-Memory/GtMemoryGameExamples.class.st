Class {
	#name : #GtMemoryGameExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Memory-Examples'
}

{ #category : #accessing }
GtMemoryGameExamples >> chooseMatchingPair [
	<gtExample>
	| aGame |
	aGame := self fixedGame.
	self assert: aGame visibleCards size equals: 16.
	aGame chooseCard: (aGame availableCards at: 6) .
	aGame chooseCard: (aGame availableCards at: 11) .
	self assert: aGame visibleCards size equals: 14.
	self assert: aGame isOver not.
	^ aGame
]

{ #category : #accessing }
GtMemoryGameExamples >> chooseMisMatchingPair [
	<gtExample>
	| aGame |
	aGame := self chooseMatchingPair.
	self assert: aGame visibleCards size equals: 14.
	aGame chooseCard: (aGame availableCards at: 1) .
	aGame chooseCard: (aGame availableCards at: 2) .
	self assert: aGame visibleCards size equals: 14.
	self assert: aGame isOver not.
	^ aGame
]

{ #category : #accessing }
GtMemoryGameExamples >> fixedGame [
	<gtExample>
	| aGame |
	aGame := GtMemoryGame new setSymbols: '4753628368271451'.
	^ aGame
]

{ #category : #accessing }
GtMemoryGameExamples >> playToEnd [
	<gtExample>
	| aGame |
	aGame := self chooseMatchingPair.
	self assert: aGame visibleCards size equals: 14.
	aGame chooseCard: (aGame availableCards at: 1) .
	aGame chooseCard: (aGame availableCards at: 14) .
	self assert: aGame visibleCards size equals: 12.
	aGame chooseCard: (aGame availableCards at: 2) .
	aGame chooseCard: (aGame availableCards at: 12) .
	self assert: aGame visibleCards size equals: 10.
	aGame chooseCard: (aGame availableCards at: 3) .
	aGame chooseCard: (aGame availableCards at: 15) .
	self assert: aGame visibleCards size equals: 8.
	aGame chooseCard: (aGame availableCards at: 4) .
	aGame chooseCard: (aGame availableCards at: 8) .
	self assert: aGame visibleCards size equals: 6.
	aGame chooseCard: (aGame availableCards at: 5) .
	aGame chooseCard: (aGame availableCards at: 9) .
	self assert: aGame visibleCards size equals: 4.
	aGame chooseCard: (aGame availableCards at: 7) .
	aGame chooseCard: (aGame availableCards at: 10) .
	self assert: aGame visibleCards size equals: 2.
	aGame chooseCard: (aGame availableCards at: 13) .
	aGame chooseCard: (aGame availableCards at: 16) .
	self assert: aGame isOver.
	^ aGame
]
