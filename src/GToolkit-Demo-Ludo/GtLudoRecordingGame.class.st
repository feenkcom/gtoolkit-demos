"
I treat moves as first class entities, and record them as they occur for playback and animation.
See {{gtClass:name=GtLudoRecordingGameExamples}}. 
"
Class {
	#name : #GtLudoRecordingGame,
	#superclass : #GtLudoGame,
	#instVars : [
		'moves'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #playing }
GtLudoRecordingGame >> autoPlay: numberOfMoves [

	"NB: For demo purposes we only implement autoPlay: in the GtLudoRecordingGame class, not in GtLudoGame."

	self assert: numberOfMoves > 0.
	(1 to: numberOfMoves) do: [ :n | 
		self isOver ifTrue: [ ^ self ].
		self playerToRoll
			ifTrue: [ self die roll ]
			ifFalse: [ self moveTokenNamed: self tokensToMove atRandom name ] ]
]

{ #category : #action }
GtLudoRecordingGame >> gtAutoplayAction: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Autoplay one move';
		priority: 20;
		icon: BrGlamorousVectorIcons play;
		action: [ :aButton | 
			self autoPlay: 1.
			aButton phlow spawnObject: self moves last ]
]

{ #category : #action }
GtLudoRecordingGame >> gtHistoryFor: aView [
	<gtView>
	^ aView list
		  title: 'History';
		  priority: 60;
		  itemStencil: [ 
			  BlScalableElement new
				  size: 200 @ 200;
				  margin: (BlInsets all: 10) ];
		  itemDataBinder: [ :eachElement :eachMove :eachIndex | 
			  eachElement addChild:
				  (eachMove replayGameToHere moves last asMoveAndBoardElement
					   when: BlClickEvent
					   do: [ :e | 
						   e consumed: true.
						   e target phlow spawnObject: eachMove ]) ];
		  items: self moves
]

{ #category : #view }
GtLudoRecordingGame >> gtMovesFor: aView [
	<gtView>
	
	^ (aView columnedList)
		title: 'Moves';
		priority: 50;
		items: [ self moves ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Roll' text: [ :move | move roll ];
		column: 'Player' text: [ :move | move player ];
		column: 'Token' text: [ :move | move token ];
		updateWhen: GtLudoMoveRecorded in: self announcer
]

{ #category : #view }
GtLudoRecordingGame >> gtStoreStringFor: aView [ 
	<gtView>
	^ aView explicit 
		title: 'Serialization';
		  priority: 120;
		stencil: [ 
			LePageToolContentTreeElement new 
				pageViewModel: (LePage unnamedPage addSnippet: (LePharoSnippet new code: self storeString; yourself);  yourself) asContentUIModel;
				matchParent  ] 
]

{ #category : #view }
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

{ #category : #accessing }
GtLudoRecordingGame >> replayingGameTo: aMove do: aBlock [

	| movesToPlay replayedGame |
	movesToPlay := self moves copyUpThrough: aMove.
	replayedGame := GtLudoRecordingGame new.
	movesToPlay do: [ :move | 
		replayedGame roll: move roll.
		move canMove ifTrue: [ replayedGame moveTokenNamed: move token name ].
		aBlock value: aMove ].
	^ replayedGame
]

{ #category : #playing }
GtLudoRecordingGame >> startNewMove [

	"Start a new move with the currently rolled die."

	| player |
	self playerToMove
		ifTrue: [ player := self currentPlayer ]
		ifFalse: [ player := self lastPlayer ].


	moves addLast: (GtLudoMove new
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
	self moves do: [ :move | 
		aStream
			nextPutAll: ' roll: ';
			nextPutAll: move roll asString;
			nextPutAll: ';'.
		move canMove ifTrue: [ 
			aStream
				nextPutAll: ' moveTokenNamed: ''';
				nextPutAll: move token name;
				nextPutAll: ''';' ] ].
	aStream nextPutAll: ' yourself)'
]

{ #category : #playing }
GtLudoRecordingGame >> updateOnRoll [
	super updateOnRoll.
	self startNewMove
]
