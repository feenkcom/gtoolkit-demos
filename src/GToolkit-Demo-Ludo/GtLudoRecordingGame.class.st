"
I treat moves as first classs entities, and record them as they occur for playback and animation.
"
Class {
	#name : #GtLudoRecordingGame,
	#superclass : #GtLudoGame,
	#instVars : [
		'moves'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoRecordingGame >> gtMovesFor: aView [
	<gtView>
	
	^ (aView columnedList)
		title: 'Moves';
		priority: 40;
		items: [ self moves ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Roll' text: [ :move | move roll ];
		column: 'Player' text: [ :move | move player ];
		column: 'Token' text: [ :move | move token ];
		updateWhen: GtLudoMoveRecorded in: self announcer
]

{ #category : #accessing }
GtLudoRecordingGame >> gtTokensFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Tokens';
		priority: 40;
		items: [ self players flatCollect: #tokens ];
		column: 'Token' text: [:t | t name ];
		column: 'State' text: [:t | t state ]
]

{ #category : #accessing }
GtLudoRecordingGame >> initialize [
	super initialize.
	moves := OrderedCollection new
]

{ #category : #playing }
GtLudoRecordingGame >> lastPlayer [
	^ self playerQueue last
]

{ #category : #accessing }
GtLudoRecordingGame >> moveToken: aToken [

	| move |
	"move := self startNewMove."
	move := self moves last.
	move token: aToken.
	self notifyMoveRecorded.
	^ move move
]

{ #category : #accessing }
GtLudoRecordingGame >> moves [
	^ moves
]

{ #category : #announcements }
GtLudoRecordingGame >> notifyMoveRecorded [
	announcer announce: GtLudoMoveRecorded new 
]

{ #category : #playing }
GtLudoRecordingGame >> playMoves: aMoveCollection [
	aMoveCollection do: #playMove
]

{ #category : #playing }
GtLudoRecordingGame >> startNewMove [

	"Start a new move with the currently rolled die."

	| player |
	self playerToMove
		ifTrue: [ player := self currentPlayer ]
		ifFalse: [ player := self lastPlayer ].


	moves addLast: (GtLudoGameMove new
			 roll: self die topFace;
			 player: player;
			 yourself).
	self notifyMoveRecorded
]

{ #category : #printing }
GtLudoRecordingGame >> storeOn: aStream [
	aStream
		nextPutAll: '(';
		nextPutAll: self class name;
		nextPutAll: ' new'.
	self moves
		do:
			[ :move | 
			aStream
				nextPutAll: ' roll: ';
				nextPutAll: move roll asString;
				nextPutAll: ';'.
			aStream
				nextPutAll: ' moveTokenNamed: ''';
				nextPutAll: move token name;
				nextPutAll: ''';' ].
	aStream nextPutAll: ' yourself)'
]

{ #category : #playing }
GtLudoRecordingGame >> updateOnRoll [
	super updateOnRoll.
	self startNewMove
]
