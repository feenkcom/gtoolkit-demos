Class {
	#name : #GtLudoGameExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #accessing }
GtLudoGameExamples >> emptyGame [

	<gtExample>
	| game |
	game := GtLudoGame new.
	self assert: game isOver not.
	self assert: game winner equals: 'No one'.
	self assert: game currentPlayer name equals: 'A'.
	self assert: game playerToRoll.
	self assert: game playerToMove not.
	^ game
]
