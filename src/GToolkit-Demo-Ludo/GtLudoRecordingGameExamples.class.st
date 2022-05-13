Class {
	#name : #GtLudoRecordingGameExamples,
	#superclass : #GtLudoGameExamples,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #example }
GtLudoRecordingGameExamples >> evaluatedStoreStringYieldsSameStorestring [
	<gtExample>
	| game storeString clonedGame |
	game := self playerAentersAndLandsOnA.
	storeString := game storeString.
	clonedGame := Smalltalk compiler evaluate: storeString.
	self assert: clonedGame storeString equals: storeString.
	^ game
]

{ #category : #example }
GtLudoRecordingGameExamples >> gameClass [
	^ GtLudoRecordingGame
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> playerAenterAndLandsOnTokenA [
	<gtExample>
	"workaround: the example snippet works with the class that defines the method instead of the target class"
	^ super playerAenterAndLandsOnTokenA
]

{ #category : #example }
GtLudoRecordingGameExamples >> playerAentersAndLandsOnA [
	<gtExample>
	| game |
	game := super playerAentersAndLandsOnA.
	self assert: game moves size equals: 7.
	self assert: game moves last tokensMoved equals: 2.
	game moves do: [ :move | 
		self assert: ((0 to: 2) includes: move tokensMoved) ].
	^ game
]
