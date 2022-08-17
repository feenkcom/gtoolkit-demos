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

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves1 [

	<gtExample>
	| game |
	game := GtLudoRecordingGame new
		  roll: 1;
		  roll: 1;
		  roll: 1;
		  roll: 6;
		  moveTokenNamed: 'D'.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves2 [

	<gtExample>
	| game |
	game := self gameShowingAllMoves1.
	game
		roll: 6;
		moveTokenNamed: 'D';
		yourself.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves3 [

	<gtExample>
	| game |
	game := self gameShowingAllMoves2.
	game
		roll: 5;
		moveTokenNamed: 'D';
		roll: 6;
		moveTokenNamed: 'a';
		roll: 6;
		moveTokenNamed: 'A'.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves4 [

	<gtExample>
	| game |
	game := self gameShowingAllMoves3.
	game
		roll: 1;
		moveTokenNamed: 'a'.
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves5 [

	<gtExample>
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
	^ game
]

{ #category : #examples }
GtLudoRecordingGameExamples >> gameShowingAllMoves6 [

	<gtExample>
	| game |
	game := self gameShowingAllMoves5.
	game
		roll: 5;
		moveTokenNamed: 'b'.
	^ game
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> landingOnOwnPlayerToken [
	<gtExample>
	
	| move |
	move := self playerAenterAndLandsOnTokenA moves last.
	^ move
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveImpossible [
	<gtExample>
	^ self gameShowingAllMoves5 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveInitial [
	<gtExample>
	^ self gameShowingAllMoves1 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveInitialJumpingAndCapturing [
	<gtExample>
	| move |
	move := self gameShowingAllMoves3 moves last.
	self assert: move tokenMoves last token name equals: 'D'.
	^ move
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveJumping [
	<gtExample>
	^ self gameShowingAllMoves4 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveSimple [
	<gtExample>
	^ self gameShowingAllMoves2 moves last
]

{ #category : #accessing }
GtLudoRecordingGameExamples >> moveToTheEnd [
	<gtExample>
	^ self gameShowingAllMoves6 moves last
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
