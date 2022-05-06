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
GtLudoRecordingGame >> moveTokenNamed: aTokenName [

	| move |
	move := GtLudoGameMove new
		        roll: self die topFace;
		        token: (self tokenNamed: aTokenName);
		        yourself.
	moves addLast: move.
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
GtLudoRecordingGame >> recordMove: aTokenName [
	| move |
	move := (GtLudoGameMove new)
		roll: self die topFace;
		token: (self tokenNamed: aTokenName);
		yourself.
	moves addLast: move.
	self notifyMoveRecorded.
	^ move
]
