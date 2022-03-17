"
I am a (model of a) memory game (for the Memory game tutorial in the GT book).
I hold a matrix of cards. Each card has a twin. 
The player can flip two cards. If the two cards are the same, they disappear.
If they are not the same, after clicking on a third card, the first two are flipped back.
The goal is to remember where the cards are, and make them all disappear.

You can play the game as follows:

```
GtMemoryGameElement new game: GtMemoryGame numbers
```

"
Class {
	#name : #GtMemoryGame,
	#superclass : #Object,
	#instVars : [
		'availableCards',
		'chosenCards'
	],
	#category : #'GToolkit-Demo-Memory-Model'
}

{ #category : #'instance creation' }
GtMemoryGame class >> chinese [
	self error: 'Currently not working. Something is wrong with character encoding.'.
	^ self new initializeForSymbols: '为从公家里地个时'
]

{ #category : #'instance creation' }
GtMemoryGame class >> emoji [
	self error: 'Currently not working. Something is wrong with character encoding.'.
	^ self new initializeForSymbols: '💰🏡🎅🍪🍕🚀😸🙈'
]

{ #category : #'instance creation' }
GtMemoryGame class >> numbers [
	<gtExample>
	^ self new initializeForSymbols: '12345678'
]

{ #category : #accessing }
GtMemoryGame >> availableCards [
	^ availableCards
]

{ #category : #accessing }
GtMemoryGame >> availableCards: aCollectionOfCharacters [

	"For creating test examples only.
	Use #initializeForSymbols: to initialize a game witha shuffled deck of cards.
	Caveat: Does not check that each card appears #matchesCount times."

	self
		assert: aCollectionOfCharacters size = self cardsCount
		description: 'Expected ' , self cardsCount printString
			, ' characters, but only found '
			, aCollectionOfCharacters size printString.
	availableCards := aCollectionOfCharacters asArray collect: [ :char | 
		                  GtMemoryCard new symbol: char ]
]

{ #category : #configuration }
GtMemoryGame >> cardsCount [
	^ self gridSize * self gridSize
]

{ #category : #actions }
GtMemoryGame >> chooseCard: aCard [
	(self chosenCards includes: aCard) 
		ifTrue: [ ^ self ].
	self chosenCards add: aCard.
	aCard flip.
	self shouldCompleteStep
		ifTrue: [ ^ self completeStep ].
	self shouldResetStep
		ifTrue: [ self resetStep ]
]

{ #category : #testing }
GtMemoryGame >> chosenCardMatch [
	| firstCard |
	firstCard := self chosenCards first.
	^ self chosenCards allSatisfy: [ :aCard | 
		aCard isFlipped and: [ firstCard symbol = aCard symbol ] ]
]

{ #category : #accessing }
GtMemoryGame >> chosenCards [
	^ chosenCards
]

{ #category : #private }
GtMemoryGame >> completeStep [
	self chosenCards 
		do: [ :aCard | aCard disappear ];
		removeAll.
]

{ #category : #configuration }
GtMemoryGame >> gridSize [
	^ 4
]

{ #category : #accessing }
GtMemoryGame >> gtAvailableCardsFor: aView [

	<gtView>
	self availableCards ifNil: [ ^ aView empty ].
	^ aView columnedList
		  title: 'Cards';
		  items: [ self availableCards ];
		  column: 'Card' text: [ :rowObject :rowIndex :columnIndex | 
			  | aComputedItem |
			  aComputedItem := [ :aCard | aCard ]
				                   phlowValue: rowObject
				                   withEnoughArguments: { 
						                   rowObject.
						                   rowIndex.
						                   columnIndex }.
			  [ :aCard | 
			  aCard isFlipped
				  ifFalse: [ aCard printString asRopedText foreground: Color gray ]
				  ifTrue: [ aCard printString asRopedText ] ]
				  phlowValue: aComputedItem
				  withEnoughArguments: { 
						  aComputedItem.
						  rowIndex.
						  columnIndex } ]
]

{ #category : #initialization }
GtMemoryGame >> initialize [
	super initialize.
	availableCards := OrderedCollection new.
	chosenCards := OrderedCollection new
]

{ #category : #initialization }
GtMemoryGame >> initializeForSymbols: aCollectionOfCharacters [

	self
		assert: [ 
			aCollectionOfCharacters size
			= (self cardsCount / self matchesCount) ]
		description: [ 
			'Expected ' , (self cardsCount / self matchesCount) printString
			, ' characters, but only found '
			, aCollectionOfCharacters size printString ].
	availableCards := (aCollectionOfCharacters asArray collect: [ 
		                   :aSymbol | 
		                   (1 to: self matchesCount) collect: [ :i | 
			                   GtMemoryCard new symbol: aSymbol ] ]) flattened
		                  shuffled asOrderedCollection
]

{ #category : #configuration }
GtMemoryGame >> matchesCount [
	^ 2
]

{ #category : #private }
GtMemoryGame >> resetStep [
	| lastCard |
	lastCard := self chosenCards last.
	self chosenCards 
		allButLastDo: [ :aCard | aCard flip ];
		removeAll;
		add: lastCard
]

{ #category : #testing }
GtMemoryGame >> shouldCompleteStep [
	^ self chosenCards size = self matchesCount
		and: [ self chosenCardMatch ]
]

{ #category : #testing }
GtMemoryGame >> shouldResetStep [ 
	^ self chosenCards size > self matchesCount
]
