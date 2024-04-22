Class {
	#name : #GtMemoryGameExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Memory-Examples'
}

{ #category : #accessing }
GtMemoryGameExamples >> afterSomeMoves [
	<gtExample>
	| game |
	game := self chooseMisMatchingPair.
	self assert: game visibleCards size equals: 16.
	game chooseCard: (game availableCards at: 6) .
	game chooseCard: (game availableCards at: 11) .
	self assert: game visibleCards size equals: 14.
	game chooseCard: (game availableCards at: 5) .
	game chooseCard: (game availableCards at: 9) .
	self assert: game visibleCards size equals: 12.
	game chooseCard: (game availableCards at: 3) .
	game chooseCard: (game availableCards at: 14) .
	self assert: game visibleCards size equals: 12.
	self assert: game isOver not.
	^ game
]

{ #category : #accessing }
GtMemoryGameExamples >> chooseMatchingPair [
	<gtExample>
	| game |
	game := self fixedGame.
	game chooseCard: (game availableCards at: 6) .
	game chooseCard: (game availableCards at: 11) .
	self assert: game visibleCards size equals: 14.
	self assert: game isOver not.
	^ game
]

{ #category : #accessing }
GtMemoryGameExamples >> chooseMisMatchingPair [
	<gtExample>
	| game |
	game := self fixedGame.
	game chooseCard: (game availableCards at: 5) .
	game chooseCard: (game availableCards at: 11) .
	self assert: game visibleCards size equals: game cardsCount.
	self assert: game isOver not.
	^ game
]

{ #category : #accessing }
GtMemoryGameExamples >> fixedGame [
	<gtExample>
	| game |
	game := GtMemoryGame new setSymbols: '4753628368271451'.
	self assert: game cardsCount equals: 16.
	self assert: game visibleCards size equals: game cardsCount.
	^ game
]

{ #category : #accessing }
GtMemoryGameExamples >> playToEnd [
	<gtExample>
	| game |
	game := self chooseMatchingPair.
	self assert: game visibleCards size equals: 14.
	game chooseCard: (game availableCards at: 1) .
	game chooseCard: (game availableCards at: 14) .
	self assert: game visibleCards size equals: 12.
	game chooseCard: (game availableCards at: 2) .
	game chooseCard: (game availableCards at: 12) .
	self assert: game visibleCards size equals: 10.
	game chooseCard: (game availableCards at: 3) .
	game chooseCard: (game availableCards at: 15) .
	self assert: game visibleCards size equals: 8.
	game chooseCard: (game availableCards at: 4) .
	game chooseCard: (game availableCards at: 8) .
	self assert: game visibleCards size equals: 6.
	game chooseCard: (game availableCards at: 5) .
	game chooseCard: (game availableCards at: 9) .
	self assert: game visibleCards size equals: 4.
	game chooseCard: (game availableCards at: 7) .
	game chooseCard: (game availableCards at: 10) .
	self assert: game visibleCards size equals: 2.
	game chooseCard: (game availableCards at: 13) .
	game chooseCard: (game availableCards at: 16) .
	self assert: game isOver.
	^ game
]
