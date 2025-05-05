"
I provide numerous examples of the recording variant of the Ludo Game, which records the history of the moves.
As a subclass of GtLudoGameExamples, all the examples of the plain variant of the game work for the recording variant as well.
In addition, there are several new examples that return instances of GtLudoMove.
"
Class {
	#name : #GtLudoRecordingGameExamples,
	#superclass : #GtLudoGameExamples,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #examples }
GtLudoRecordingGameExamples >> emptyGame [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game |
	game := GtLudoRecordingGame new.
	self assert: game moves isEmpty.
	^ game
]

{ #category : #example }
GtLudoRecordingGameExamples >> evaluatedStoreStringYieldsSameStorestring [
	<gtExample>
	<return: #GtLudoRecordingGame>
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

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves1 [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game |
	game := self emptyGame.
	game
		roll: 1;
		roll: 1;
		roll: 1;
		roll: 6;
		moveTokenNamed: 'D'.
	self assert: game moves size = 4.
	self assert: game moves last numberOfTokensMoved = 1.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves2 [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game gameMoves |
	game := self gameShowingAllMoves1.
	gameMoves := game moves size.
	game
		roll: 6;
		moveTokenNamed: 'D'.
	self assert: game moves size - gameMoves = 1.
	self assert: game moves last numberOfTokensMoved = 1.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves3 [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game |
	game := self gameShowingAllMoves2.
	game
		roll: 5;
		moveTokenNamed: 'D';
		roll: 6;
		moveTokenNamed: 'a';
		roll: 6;
		moveTokenNamed: 'A'.
	self assert: game moves last numberOfTokensMoved = 3.
	self assert: game moves last tokenMoves first token name = 'A'.
	self assert: game moves last tokenMoves second token name = 'A'.
	self assert: game moves last tokenMoves third token name = 'D'.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves4 [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game |
	game := self gameShowingAllMoves3.
	game
		roll: 1;
		moveTokenNamed: 'a'.
	self assert: game moves last numberOfTokensMoved = 2.
	self assert: game moves last tokenMoves first token name = 'a'.
	self assert: game moves last tokenMoves second token name = 'a'.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves5 [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game |
	game := self gameShowingAllMoves4.
	game
		roll: 6;
		moveTokenNamed: 'b';
		roll: 6;
		moveTokenNamed: 'b';
		roll: 6;
		moveTokenNamed: 'b';
		roll: 6;
		moveTokenNamed: 'b';
		roll: 6;
		moveTokenNamed: 'b';
		roll: 6;
		moveTokenNamed: 'b';
		roll: 6;
		moveTokenNamed: 'b';
		roll: 6;
		moveTokenNamed: 'b'.
	self assert: game moves last numberOfTokensMoved = 1.
	self assert: game moves last tokenMoves first token name = 'b'.
	self
		assert: game moves last tokenMoves first fromSquare
				= game moves last tokenMoves first toSquare.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves6 [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game |
	game := self gameShowingAllMoves5.
	game
		roll: 5;
		moveTokenNamed: 'b'.
	self assert: game moves last numberOfTokensMoved = 1.
	self assert: game moves last tokenMoves first token name = 'b'.
	self assert: game moves last tokenMoves first toSquare isGoal.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMovesStart [
	^ GtLudoRecordingGame new
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> landingOnOwnPlayerToken [
	<gtExample>
	<return: #GtLudoMove>
	| move |
	move := self playerAentersAndLandsOnTokenA moves last.
	^ move
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveImpossible [
	<gtExample>
	<return: #GtLudoMove>
	^ self gameShowingAllMoves5 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveInitial [
	<gtExample>
	<return: #GtLudoMove>
	^ self gameShowingAllMoves1 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveInitialJumpingAndCapturing [
	<gtExample>
	<return: #GtLudoMove>
	| move |
	move := self gameShowingAllMoves3 moves last.
	self assert: move tokenMoves last token name equals: 'D'.
	^ move
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveJumping [
	<gtExample>
	<return: #GtLudoMove>
	^ self gameShowingAllMoves4 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveSimple [
	<gtExample>
	<return: #GtLudoMove>
	^ self gameShowingAllMoves2 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveToTheEnd [
	<gtExample>
	<return: #GtLudoMove>
	^ self gameShowingAllMoves6 moves last
]

{ #category : #example }
GtLudoRecordingGameExamples >> playerAentersAndLandsOnA [
	<gtExample>
	<return: #GtLudoRecordingGame>
	| game |
	game := super playerAentersAndLandsOnA.
	self assert: game moves size equals: 7.
	self assert: game moves last numberOfTokensMoved equals: 2.
	game moves
		do: [ :move | self assert: ((0 to: 2) includes: move numberOfTokensMoved) ].
	^ game
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> playerAentersAndLandsOnTokenA [
	"workaround: the example snippet works with the class that defines the method instead of the target class"

	<gtExample>
	<return: #GtLudoRecordingGame>
	^ super playerAentersAndLandsOnTokenA
]
