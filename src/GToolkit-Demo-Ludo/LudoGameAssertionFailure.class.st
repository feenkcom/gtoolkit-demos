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
	#name : #LudoGameAssertionFailure,
	#superclass : #Error,
	#instVars : [
		'game'
	],
	#category : #'GToolkit-Demo-Ludo-Exceptions'
}

{ #category : #'instance creation' }
LudoGameAssertionFailure class >> forGame: aLudoGame [
	^ self new
		game: aLudoGame;
		yourself
]

{ #category : #accessing }
LudoGameAssertionFailure >> game: aLudoGame [
	game := aLudoGame
]

{ #category : #accessing }
LudoGameAssertionFailure >> gtGameViewFor: aView [ 
	<gtView>
	<gtExceptionDebuggingView>
	
	^ aView forward 
		title: 'Diff';
		priority: 1;
		object: [	
			game ];
		view: #gtPositionsFor:
]
