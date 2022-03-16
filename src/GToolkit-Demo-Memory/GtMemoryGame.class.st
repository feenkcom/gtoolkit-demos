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
	^ self new initializeForSymbols: '为从公家里地个时'
]

{ #category : #'instance creation' }
GtMemoryGame class >> emoji [
	^ self new initializeForSymbols: '💰🏡🎅🍪🍕🚀😸🙈'
]

{ #category : #'instance creation' }
GtMemoryGame class >> numbers [
	^ self new initializeForSymbols: '12345678'
]

{ #category : #accessing }
GtMemoryGame >> availableCards [
	^ availableCards
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
		assert: [ aCollectionOfCharacters size = (self cardsCount / self matchesCount) ]
		description: [ 'Amount of characters must be equal to possible all combinations' ].
	availableCards := (aCollectionOfCharacters asArray
			collect: [ :aSymbol | 
				(1 to: self matchesCount) collect: [ :i | 
					GtMemoryCard new symbol: aSymbol ] ] ) flattened shuffled asOrderedCollection
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
