"
I am a demo of a moldable exception. If I am signaled, then the debugger will show the game view with a message.

```
GtLudoRecordingGameExamples new bEntersAndPlaysWithAahead
	moveTokenNamed: 'B';
	yourself.
```

```
GtLudoRecordingGameExamples new bEntersAndPlaysWithAahead
	roll: 6;
	moveTokenNamed: 'B';
	yourself.
```

"
Class {
	#name : #LudoMoveAssertionFailure,
	#superclass : #Error,
	#instVars : [
		'move'
	],
	#category : #'GToolkit-Demo-Ludo-Exceptions'
}

{ #category : #'instance creation' }
LudoMoveAssertionFailure class >> forMove: aLudoMove [
	^ self new
		move: aLudoMove;
		yourself
]

{ #category : #view }
LudoMoveAssertionFailure >> gtGameViewFor: aView [
	<gtView>
	<gtExceptionDebuggingView>
	^ aView forward
		title: 'Game';
		priority: 10;
		object: [ move game ];
		view: #gtPositionsFor:
]

{ #category : #view }
LudoMoveAssertionFailure >> gtMovesViewFor: aView [
	<gtView>
	<gtExceptionDebuggingView>
	^ aView forward
		title: 'Moves';
		priority: 20;
		object: [ move game ];
		view: #gtMovesFor:
]

{ #category : #accessing }
LudoMoveAssertionFailure >> move: aLudoMove [
	move := aLudoMove
]
