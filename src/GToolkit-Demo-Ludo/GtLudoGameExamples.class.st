Class {
	#name : #GtLudoGameExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #accessing }
GtLudoGameExamples >> bEntersAndPlaysWithAahead [
	"Example for 4. Landing on another player's token. (Send other token to start.)"
	<gtExample>
	| game |
	game := self playerBentersWithTokenAahead.
	game roll: 6.
	game moveTokenNamed: 'B'.
	game roll: 1.
	game moveTokenNamed: 'B'.
	self assert: (game positionOfTokenNamed: 'B') equals: 12.
	self assert: game currentPlayer name equals: 'C'.
	self assert: (game tokenNamed: 'A') isInStartState.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> bEntersPlayWithAonStartSquare [
	"Test for 1. Entering play when there is a token of another player on the start square. (Send other token to start state.)"
	<gtExample>
	| game |
	game := self bToPlayWithAonStartSquare.
	self assert: (game tokenNamed: 'A') isInPlay.
	game roll: 6.
	game moveTokenNamed: 'B'.
	self assert: (game positionOfTokenNamed: 'B') equals: 11.
	self assert: game currentPlayer name equals: 'B'.
	self assert: (game tokenNamed: 'A') isInStartState.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> bToPlayWithAonStartSquare [
	"Setup for 1. Entering play when there is a token of another player on the start square. (Send other token to start state.)"
	<gtExample>
	| game |
	game := self playerAentersTokenA.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 4.
	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 11.
	self assert: game currentPlayer name equals: 'B'.
	^ game
]

{ #category : #example }
GtLudoGameExamples >> emptyGame [

	<gtExample>
	| game |
	game := self gameClass new.
	self assert: game isOver not.
	self assert: game winner equals: 'No one'.
	self assert: game currentPlayer name equals: 'A'.
	self assert: game playerToRoll.
	self assert: game playerToMove not.
	^ game
]

{ #category : #example }
GtLudoGameExamples >> gameClass [
	^ GtLudoGame
]

{ #category : #accessing }
GtLudoGameExamples >> playerAarrivesCloseToGoal [

	"Setup for 6. Landing on the first goal square, unoccupied and 7. Landing on the unoccupied second goal square."

	<gtExample>
	| game |
	game := self playerAenterAndLandsOnTokenA.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 1.
	self assert: (game positionOfTokenNamed: 'a') equals: 2.
	game roll: 6.
	game moveTokenNamed: 'a'.
	game roll: 6.
	game moveTokenNamed: 'a'.
	game roll: 6.
	game moveTokenNamed: 'a'.
	game roll: 6.
	game moveTokenNamed: 'a'.
	game roll: 6.
	game moveTokenNamed: 'a'.
	game roll: 6.
	game moveTokenNamed: 'a'.
	self assert: (game positionOfTokenNamed: 'a') equals: 38.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAenterAndLandsOnTokenA [
	"Example for 2. Entering play when there is a token of the same player on the start square (ie after rolling a 6 twice)."
	<gtExample>
	| game |
	game := self playerAentersTokenA.
	self assert: (game positionOfTokenNamed: 'A') equals: 1.
	game roll: 6.
	game moveTokenNamed: 'a'.
	self assert: (game positionOfTokenNamed: 'A') equals: 1.
	self assert: (game positionOfTokenNamed: 'a') equals: 2.
	self assert: game currentPlayer name equals: 'A'.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAentersAndLandsOnA [
	<gtExample>
	| game |
	game := self playerAmovesTokenA.
	game roll: 1.
	game roll: 1.
	game roll: 1.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 6.
	game roll: 6.
	game moveTokenNamed: 'a'.
	self assert: (game positionOfTokenNamed: 'a') equals: 1.
	game roll: 5.
	game moveTokenNamed: 'a'.
	self assert: (game positionOfTokenNamed: 'A') equals: 6.
	self assert: (game positionOfTokenNamed: 'a') equals: 7.
	^ game

]

{ #category : #accessing }
GtLudoGameExamples >> playerAentersTokenA [
	"Setup for 2. Entering play when there is a token of the same player on the start square (ie after rolling a 6 twice)."
	<gtExample>
	| game |
	game := self playerArolls6.
	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 1.
	self assert: game currentPlayer name equals: 'A'.
	self assert: game playerToRoll.
	self assert: game playerToMove not.
	self assert: (game tokensToMove collect: #name) asSet equals: Set new.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAlandsOnFirstGoalSquare [

	"Example for 6. Landing on the first goal square, unoccupied."

	<gtExample>
	| game |
	game := self playerAarrivesCloseToGoal.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'a') equals: 38.
	game roll: 3.
	game moveTokenNamed: 'a'.
	self assert: (game tokenNamed: 'a') isInGoalState.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAlandsOnOccupiedGoalSquare [

	"Example for 9. Landing on the first occupied goal square. (Land on next goal square.)"

	<gtExample>
	| game |
	game := self playerAsecondTokenCloseToGoal.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 37.
	game roll: 4.
	game moveTokenNamed: 'A'.
	self assert: (game tokenNamed: 'A') isInGoalState.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAlandsOnOccupiedSecondGoalSquare [

	"Example for 10. Landing on the occupied second goal square. (Fail to move.)"

	<gtExample>
	| game |
	game := self playerAsecondTokenCloseToSecondOccupiedGoal.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 37.
	game roll: 5.
	game moveTokenNamed: 'A'.
	self assert: (game tokenNamed: 'A') isInPlay.
	self assert: (game positionOfTokenNamed: 'A') equals: 37.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAlandsOnSecondGoalSquare [
	"Example for 7. Landing on the unoccupied second goal square."
	<gtExample>
	| game |
	game := self playerAarrivesCloseToGoal.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'a') equals: 38.
	game roll: 4.
	game moveTokenNamed: 'a'.
	self assert: (game tokenNamed: 'a') isInGoalState.
	^ game

]

{ #category : #accessing }
GtLudoGameExamples >> playerAmovesTokenA [
	<gtExample>
	| game |
	game := self playerAentersTokenA.

	game roll: 5.
	self
		assert: (game tokensToMove collect: #name) asSet
		equals: { 'A' } asSet.

	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 6.

	self assert: game currentPlayer name equals: 'B'.
	self assert: game playerToRoll.
	self assert: game playerToMove not.

	self assert: (game tokensToMove collect: #name) asSet equals: Set new.

	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAmovesTwiceAndLandsOnA [
	"Example for: 3. Landing on a square with the same player's token. (Land on next square.)"
	<gtExample>
	| game |
	game := self playerAenterAndLandsOnTokenA.
	self assert: game currentPlayer name equals: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'a') equals: 2.
	self assert: (game positionOfTokenNamed: 'A') equals: 7.
	game roll: 5.
	game moveTokenNamed: 'a'.
	self assert: (game positionOfTokenNamed: 'a') equals: 8.
	self assert: game currentPlayer name equals: 'B'.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAovershootsGoal [

	"Example for 8. Overshooting the goal sqares. (Fail to move.)"

	<gtExample>
	| game |
	game := self playerAarrivesCloseToGoal.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'a') equals: 38.
	game roll: 5.
	game moveTokenNamed: 'a'.
	self assert: (game tokenNamed: 'a') isInPlay.
	self assert: (game positionOfTokenNamed: 'a') equals: 38.
	^ game
]

{ #category : #example }
GtLudoGameExamples >> playerArolls6 [
	<gtExample>
	| game |
	game := self emptyGame.
	game roll: 6.
	self assert: game currentPlayer name equals: 'A'.
	self assert: game playerToRoll not.
	self assert: game playerToMove.
	self
		assert: (game tokensToMove collect: #name) asSet
		equals: { 'A'. 'a' } asSet.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAsecondTokenCloseToGoal [

	"Setup for 9. Landing on the first occupied goal square. (Land on next goal square.)"

	<gtExample>
	| game |
	game := self playerAlandsOnFirstGoalSquare.
	self assert: game currentPlayer name equals: 'B'.
	game roll: 1.
	game roll: 1.
	game roll: 1.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 1.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 37.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAsecondTokenCloseToSecondOccupiedGoal [

	"Setup for 10. Landing on the occupied second goal square. (Fail to move.)"

	<gtExample>
	| game |
	game := self playerAlandsOnSecondGoalSquare.
	self assert: game currentPlayer name equals: 'B'.
	game roll: 1.
	game roll: 1.
	game roll: 1.
	self assert: game currentPlayer name equals: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 1.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 37.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerBentersWithTokenAahead [
	"Setup for 4. Landing on another player's token. (Send other token to start.)"
	<gtExample>
	| game |
	game := self playerAenterAndLandsOnTokenA.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 5.
	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 12.
	self assert: game currentPlayer name equals: 'B'.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerBplaysWithTokensBandAahead [
	"Example for 5. Landing on a square with the same play's token, followed by a square with a token of another player. (Land on next square, sending the token there to start.)"
	<gtExample>
	| game |
	game := self playerBtoPlayWithTokensBandAahead.
	self assert: game currentPlayer name equals: 'B'.
	self assert: (game positionOfTokenNamed: 'b') equals: 12.
	self assert: (game positionOfTokenNamed: 'B') equals: 17.
	self assert: (game positionOfTokenNamed: 'A') equals: 18.
	game roll: 5.
	game moveTokenNamed: 'b'.
	self assert: (game positionOfTokenNamed: 'B') equals: 17.
	self assert: (game positionOfTokenNamed: 'b') equals: 18.
	self assert: (game tokenNamed: 'A') isInStartState.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerBtoPlayWithTokensBandAahead [
	"Setup for 5. Landing on a square with the same play's token, followed by a square with a token of another player. (Land on next square, sending the token there to start.)"
	<gtExample>
	| game |
	game := self playerAentersTokenA.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 6.
	game moveTokenNamed: 'A'.
	game roll: 5.
	game moveTokenNamed: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 18.
	self assert: game currentPlayer name equals: 'B'.
	game roll: 6.
	game moveTokenNamed: 'B'.	
	game roll: 6.
	game moveTokenNamed: 'b'.
	game roll: 6.
	game moveTokenNamed: 'B'.
	self assert: (game positionOfTokenNamed: 'B') equals: 17.
	^ game
]
