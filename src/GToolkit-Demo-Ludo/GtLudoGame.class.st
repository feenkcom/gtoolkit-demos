"
I keep track of the Ludo game board, and manage the logic of the moves.
"
Class {
	#name : #GtLudoGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'squares',
		'startSquares',
		'goalSquares',
		'die',
		'announcer',
		'feedback',
		'winner',
		'needToRollDie',
		'lastDieRolled',
		'playerQueue',
		'routeCache',
		'allSquares'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #playing }
GtLudoGame class >> gtOpenInWorldActionFor: anAction [
	<gtAction>
	<gtClassAction>
	^ anAction button
		priority: 11;
		tooltip: 'Play slideshow in new window';
		icon: BrGlamorousVectorIcons play;
		action: [ :aButton | self openInWorld ]
]

{ #category : #playing }
GtLudoGame class >> openInWorld [
	BlSpace new
		addChild: self new asElement asScalableElement;
		show
]

{ #category : #comparing }
GtLudoGame >> = other [
	self == other ifTrue: [ ^ true ].
	self class = other class ifFalse: [ ^ false ].
	1
		to: self tokens size
		do: [ :index | 
			(self tokens at: index) state = (other tokens at: index) state ifFalse: [ ^ false ].
			(self positionOfToken: (self tokens at: index))
				= (other positionOfToken: (other tokens at: index)) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #announcements }
GtLudoGame >> announcer [
	^ announcer
]

{ #category : #'gt - extensions' }
GtLudoGame >> asElement [
	^ GtLudoGameElement for: self
]

{ #category : #comparing }
GtLudoGame >> assertEquals: other [
	"For debugging"

	self == other ifTrue: [ ^ true ].
	self class = other class ifFalse: [ AssertionFailure  signal].
	1
		to: self tokens size
		do: [ :index | 
			(self tokens at: index) state = (other tokens at: index) state
				ifFalse: [ AssertionFailure  signal ].
			(self positionOfToken: (self tokens at: index))
				= (other positionOfToken: (other tokens at: index)) ifFalse: [ AssertionFailure  signal ] ].
	^ true
]

{ #category : #accessing }
GtLudoGame >> autoPlay [
	self isOver ifTrue: [ ^ self ].
	self playerToRoll ifTrue: [ self die roll ].
	^ self playerToMove
		ifTrue: [ self moveTokenNamed: self tokensToMove atRandom name ]
]

{ #category : #'gt - extensions' }
GtLudoGame >> boardElement [
	^ GtLudoBoardElement for: self
]

{ #category : #playing }
GtLudoGame >> computeTargetFor: aToken [

	"Given a token to move, determine which square it should move to.
	There are 3 cases for the target square."

	| route targetIndex |
	route := self currentRoute.

	"(1) a token enters play on the first square of the route"
	(self die topFace = 6 and: [ aToken isInStartState ]) ifTrue: [ 
		aToken enterPlay.
		^ route first ].

	self
		assert: aToken isInPlay
		description: 'Token ' , aToken name , ' is not in play'.

	"(2) a token in play moves forward to another square on the route"
	targetIndex := (route indexOf: aToken square) + self die topFace.
	targetIndex <= route size ifTrue: [ ^ route at: targetIndex ].

	"(3) the roll would go past the end of the route (we stay where we are)"
	^ aToken square
]

{ #category : #accessing }
GtLudoGame >> currentPlayer [
	^ self playerQueue first
]

{ #category : #acccessing }
GtLudoGame >> currentRoute [
	^ self routeFor: self currentPlayer
]

{ #category : #accessing }
GtLudoGame >> die [
	^ die
]

{ #category : #moving }
GtLudoGame >> enterPlayTokenFor: aPlayer [

	"What should be the behavior if there are no tokens left to put into play?"

	"aPlayer startTokens isEmpty ifTrue: [ ^ nil ]."
	
	self assert: aPlayer startTokens notEmpty.

	^ aPlayer startTokens first enterPlayOnSquare:
		(self initialSquareFor: aPlayer)
]

{ #category : #feedback }
GtLudoGame >> feedback [
	^ feedback
]

{ #category : #feedback }
GtLudoGame >> feedback: aString [
	feedback := aString.
	self notifyFeedbackUpdated
]

{ #category : #playing }
GtLudoGame >> gameState [

	"Prepare feedback."

	self isOver ifTrue: [ 
		self setWinner.
		^ 'Player ' , self winner , ' has won!' ].

	self playerToMove ifTrue: [ 
		self tokensToMove notEmpty
			ifTrue: [ ^ 'Player ' , self currentPlayer name , ' to move.' ]
			ifFalse: [ 
				| player |
				player := self currentPlayer.
				self requireDieRoll.
				self nextPlayer.
				^ 'Player ' , player name , ' cannot move. Player '
				  , self currentPlayer name , ' to roll the die.' ] ].

	self playerToRoll ifTrue: [ 
		^ 'Player ' , self currentPlayer name , ' to roll the die.' ].

	^ 'Unknown game state!'
]

{ #category : #accessing }
GtLudoGame >> goalSquares [
	^ goalSquares
]

{ #category : #'gt - extensions' }
GtLudoGame >> gtPlayersFor: aView [
	<gtView>
	
	^ (aView columnedList)
		title: 'Players';
		priority: 20;
		items: [ self players ];
		column: 'Player' text: [ :player | player ];
		column: 'Token' text: [ :player | player tokens first ];
		column: 'State' text: [ :player | player tokens first state ];
		column: 'Token' text: [ :player | player tokens second ];
		column: 'State' text: [ :player | player tokens second state ];
		updateWhen: GtLudoGameUpdated in: self announcer
]

{ #category : #'gt - extensions' }
GtLudoGame >> gtPositionsFor: aView [
	<gtView>
	^ aView explicit
		  title: 'Board';
		  priority: 10;
		  stencil: [ self asElement asScalableElement ]
]

{ #category : #'gt - extensions' }
GtLudoGame >> gtSquaresFor: aView [
	<gtView>
	^ aView columnedList
		  title: 'Squares';
		  priority: 30;
		  items: [ self squares ];
		  column: 'Index'
		  text: [ :eachItem :eachIndex | 
			  eachIndex asRopedText foreground: Color gray ]
		  width: 45;
		  column: 'Token' text: [ :square | square token ];
		  column: 'State' text: [ :square | 
			  square notEmpty
				  ifTrue: [ square token state ]
				  ifFalse: [ '' ] ];
		updateWhen: GtLudoGameUpdated in: self announcer
]

{ #category : #comparing }
GtLudoGame >> hash [
	^ super hash
]

{ #category : #moving }
GtLudoGame >> initialSquareFor: aPlayer [
	^ (self routeFor: aPlayer) first
]

{ #category : #initialization }
GtLudoGame >> initialize [
	super initialize.
	announcer := Announcer new.
	feedback := ''.
	players := OrderedCollection new.
	($A to: $D) do: [ :player | players add: (GtLudoPlayer new name: player) ].
	self initializeSquares.
	players do: #initializeTokens.
	self initializeStartSquares.
	self initializeGoalSquares.
	allSquares := squares, startSquares, goalSquares.
	die := GtLudoDie new.
	routeCache := Dictionary new.
	
	"Initialization code from the Game class"
	
	self die announcer when: GtLudoDieRolled send: #onRolled to: self.
	lastDieRolled := self die topFace.
	self squares , self startSquares do: [ :square | 
		square announcer
			when: GtLudoSquareSignalTokenMove
			do: [ :announcement | self moveToken: announcement token ] ].
	playerQueue := self players copy.
	playerQueue do: [ :each | each game: self ].
	self requireDieRoll.
	self setWinner.
	self feedback: self gameState
]

{ #category : #initialization }
GtLudoGame >> initializeGoalSquares [
	goalSquares := OrderedCollection new.
	1
		to: 8
		do:
			[ :n | 
			goalSquares
				add:
					((GtLudoSquare for: self)
						kind: #goal;
						yourself) ]
]

{ #category : #initialization }
GtLudoGame >> initializeSquares [
	squares := OrderedCollection new.
	1
		to: self totalPlaySquares
		do:
			[ :n | 
			| square |
			square := GtLudoSquare for: self.
			n \\ 10 = 1 ifTrue: [ square kind: #initial ].
			squares add: square ]
]

{ #category : #initialization }
GtLudoGame >> initializeStartSquares [
	startSquares := OrderedCollection new.
	self tokens
		do:
			[ :token | 
			| square |
			square := (GtLudoSquare for: self)
				kind: #start;
				yourself.
			token goToSquare: square.
			startSquares add: square ]
]

{ #category : #testing }
GtLudoGame >> isOver [
	^ (self playerQueue select: #isFinished) isNotEmpty
]

{ #category : #playing }
GtLudoGame >> moveToken: aToken [
	| targetSquare |
	self assert: self playerToMove description: 'Roll the die first!'.
	self assert: aToken player = self currentPlayer description: 'Token ', aToken name, ' does not belong to current player ', self currentPlayer name.

	"We first compute the target square, and then decide what to do."
	targetSquare := self computeTargetFor: aToken.

	"If the target square is occupied, either:
	(a) if the token belongs to another player, that token is sent back to its start state and we land there
	(b) if the token belongs to the same player, then we try to land on the next square (again two cases).
	In case (b) we must iterate, and if no squares are left, we fall back to the current square."
	[ targetSquare notEmpty and: [ targetSquare ~= aToken square ] ] 
		whileTrue: [ 
			targetSquare token player = aToken player
				ifTrue: [ 
					| route targetIndex |
					route := self currentRoute.
					targetIndex := (route indexOf: targetSquare) + 1.
					targetIndex <= route size
						ifTrue: [ targetSquare := route at: targetIndex ]
						ifFalse: [ targetSquare := aToken square ] ]
				ifFalse: [ self sendToStart:targetSquare token  ] ].

	aToken goToSquare: targetSquare.

	"At the end, we switch to the next player unless we rolled a 6."

	self die topFace = 6 ifFalse: [ self nextPlayer ].
	self requireDieRoll.
	self feedback: self gameState.
	self notifyGameUpdated
]

{ #category : #playing }
GtLudoGame >> moveTokenNamed: aTokenName [
	^ self moveToken: (self tokenNamed: aTokenName)
]

{ #category : #accessing }
GtLudoGame >> nextPlayer [
	playerQueue addLast: playerQueue removeFirst.
	^ self currentPlayer
]

{ #category : #announcements }
GtLudoGame >> notifyFeedbackUpdated [
	self announcer announce: GtLudoBoardFeedbackUpdated new
]

{ #category : #playing }
GtLudoGame >> notifyGameUpdated [
	self announcer announce: GtLudoGameUpdated new
]

{ #category : #announcements }
GtLudoGame >> onRolled [
	self playerToRoll
		ifTrue: [ self updateOnRoll ]
		ifFalse: [ self die rollBack: lastDieRolled ]
]

{ #category : #accessing }
GtLudoGame >> playerNamed: aString [
	^ self playerQueue detect: [ :player | player name = aString ] ifNone: [ self error: 'Found no player named ' , aString ]
]

{ #category : #accessing }
GtLudoGame >> playerQueue [
	^ playerQueue
]

{ #category : #testing }
GtLudoGame >> playerToMove [
	^ self playerToRoll not
]

{ #category : #testing }
GtLudoGame >> playerToRoll [
	self assert: self isOver not.
	^  needToRollDie
]

{ #category : #accessing }
GtLudoGame >> players [
	^ players
]

{ #category : #accessing }
GtLudoGame >> positionOfToken: aToken [
	^ allSquares identityIndexOf: aToken square
]

{ #category : #testing }
GtLudoGame >> positionOfTokenNamed: aString [
	^ self positionOfToken: (self tokenNamed: aString)
]

{ #category : #playing }
GtLudoGame >> requireDieRoll [
	needToRollDie := true.
]

{ #category : #'test - support' }
GtLudoGame >> roll: aValue [
	"For testing and rollback only -- set the value rolled."
	self die roll: aValue
]

{ #category : #accessing }
GtLudoGame >> rollDie [
	^ self playerToRoll ifTrue: [ self die roll ]
]

{ #category : #accessing }
GtLudoGame >> rollDie: roll [
	^ self playerToRoll ifTrue: [ self die roll: roll ]
]

{ #category : #accessing }
GtLudoGame >> routeFor: aPlayer [

	"Each player's tokens take a differenr route through the board and goal squares.
	Compute this route and cache it to avoid recomputing it each time."
	
	| route playerNumber first |
	^ routeCache at: aPlayer ifAbsentPut: [ 
		  route := OrderedCollection new.
		  playerNumber := self players indexOf: aPlayer.
		  first := playerNumber - 1 * 10 + 1.
		  route addAll:
			  (self squares copyFrom: first to: self totalPlaySquares).
		  route addAll: (self squares copyFrom: 1 to: first - 1).
		  first := playerNumber - 1 * 2 + 1.
		  route addAll: (self goalSquares copyFrom: first to: first + 1).
		  route ]
]

{ #category : #playing }
GtLudoGame >> sendToStart: aToken [

	| targetSquare |
	targetSquare := (self startSquaresFor: aToken player) detect: #isEmpty.
	aToken goToSquare: targetSquare.
	^ targetSquare
]

{ #category : #playing }
GtLudoGame >> setWinner [
	winner := self playerQueue
		          detect: #isFinished
		          ifFound: [ :player | player name ]
		          ifNone: [ 'No one' ]
]

{ #category : #accessing }
GtLudoGame >> squares [
	^ squares
]

{ #category : #accessing }
GtLudoGame >> startSquares [
	^ startSquares
]

{ #category : #accessing }
GtLudoGame >> startSquaresFor: aPlayer [
	| index |
	index := self players indexOf: aPlayer.
	^ self startSquares copyFrom: index * 2 - 1 to: index * 2
]

{ #category : #accessing }
GtLudoGame >> tokenNamed: aString [
	^ self tokens
		  detect: [ :token | token name = aString ]
		  ifNone: [ self error: 'Found no token named ' , aString ]
]

{ #category : #accessing }
GtLudoGame >> tokens [
	^ players flatCollect: #tokens
]

{ #category : #playing }
GtLudoGame >> tokensToMove [

	<todo: 'Check if these tokens can actually be played!'>

	self isOver ifTrue: [ ^ Set new ].
	self playerToRoll ifTrue: [ ^ Set new ].
	self assert: self playerToMove.


	self die topFace = 6 ifTrue: [ 
		self currentPlayer startTokens notEmpty ifTrue: [ 
			^ self currentPlayer startTokens asSet ] ].

	"If we are close to the goal, but cannot reach it, what happens?"
			
	^ self currentPlayer playTokens
]

{ #category : #constants }
GtLudoGame >> totalPlaySquares [
	^ 40
]

{ #category : #playing }
GtLudoGame >> updateOnRoll [

	"This should only be called from onRolled"

	self assert: self playerToRoll description: 'Player must move first.'.
	lastDieRolled := self die topFace.
	needToRollDie := false.
	self feedback: self gameState
]

{ #category : #acccessing }
GtLudoGame >> winner [
	^ winner
]
