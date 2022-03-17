Class {
	#name : #GtMemoryGameExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Memory-Examples'
}

{ #category : #accessing }
GtMemoryGameExamples >> fixedGame [
	<gtExample>
	| aGame |
	aGame := GtMemoryGame new setSymbols: '4753628368271451'.
	^ aGame
]
