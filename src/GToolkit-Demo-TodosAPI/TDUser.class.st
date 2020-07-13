Class {
	#name : #TDUser,
	#superclass : #TDModel,
	#instVars : [
		'id',
		'posts',
		'todos'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDUser class >> empty [
	^ TDNullUser uniqueInstance.
]

{ #category : #accessing }
TDUser >> gtPostsListFor: aView [
	<gtView>
	(posts := self requestPostsFromThisUser) ifEmpty: [^ aView empty].
	^ aView explicit
		title: 'Posts' translated;
		priority: 5;
		stencil: [
			| mainContainer scrollableContainer topEditorElement tileContainer topTile bottomTile userButton |
			mainContainer := BlScrollableElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ].
			scrollableContainer := BlElement new
				layout: BlLinearLayout vertical;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ].
			self posts do: [ :each |			
				tileContainer := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c linear horizontal alignCenter.
						c vertical fitContent ];
					background: Color white;
					look: BrShadowLook;
					padding: (BlInsets all: 5);
					margin: (BlInsets all: 5);
					width: 300.
				topTile := BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				bottomTile := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				topEditorElement := BrEditor new
					look: (BrGlamorousRegularEditorLook new fontSize: 18);
					constraintsDo: [:c |
						c linear horizontal alignCenter ];
					margin: (BlInsets top: 0 right: 5 bottom: 0 left: 5);
					vFitContent;
					hMatchParent;
					beReadOnlyWithoutSelection;
					text: each title.
				topEditorElement
					when: BlClickEvent
					do: [:e | topEditorElement phlow spawnObject: each].
				userButton := BrEditor new
					"constraintsDo: [:c |
						c linear horizontal alignCenter ];"
					margin: (BlInsets top: 0 right: 5 bottom: 5 left: 9);
					text: 'Id ', each id asString;
					look: (BrGlamorousRegularEditorLook new fontSize: 14; foreground: Color gray);
					vFitContent;
					hFitContent;
					beReadOnlyWithoutSelection.

				topTile
					addChild: topEditorElement.
				bottomTile addChild: userButton.
				tileContainer 
					addChild: topTile;
					addChild: bottomTile.
				scrollableContainer addChild: tileContainer ].
			mainContainer addChild: scrollableContainer.
			mainContainer ].
]

{ #category : #accessing }
TDUser >> gtTodosListFor: aView [
	<gtView>
	(todos := self requestTodosFromThisUser) ifEmpty: [^ aView empty].
	^ aView explicit
		title: 'Todos' translated;
		priority: 5;
		stencil: [
			| mainContainer scrollableContainer topEditorElement iconContainer tileContainer topTile bottomTile userButton |
			mainContainer := BlScrollableElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ].
			scrollableContainer := BlElement new
				layout: BlLinearLayout vertical;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ].
			self todos do: [ :each |			
				tileContainer := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c linear horizontal alignCenter.
						c vertical fitContent ];
					background: Color white;
					look: BrShadowLook;
					padding: (BlInsets all: 5);
					margin: (BlInsets all: 5);
					width: 300.
				topTile := BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				bottomTile := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				iconContainer := BrButton new
					border: (BlBorder paint: Color black width: 1);
					margin: (BlInsets top: 10 right: 10 bottom: 0 left: 10);
					size: 16@16.
				(each completed) 
					ifTrue: [ 
						iconContainer icon: BrGlamorousVectorIcons accept.
						iconContainer look: BrGlamorousButtonIconLook ].	
				topEditorElement := BrEditor new
					look: (BrGlamorousRegularEditorLook new fontSize: 18);
					constraintsDo: [:c |
						c linear horizontal alignCenter ];
					margin: (BlInsets top: 0 right: 5 bottom: 0 left: 5);
					vFitContent;
					hMatchParent;
					beReadOnlyWithoutSelection;
					text: each title.
				topEditorElement
					when: BlClickEvent
					do: [:e | topEditorElement phlow spawnObject: each].
				userButton := BrEditor new
					"constraintsDo: [:c |
						c linear horizontal alignCenter ];"
					margin: (BlInsets top: 0 right: 5 bottom: 5 left: 42);
					text: 'Id ', each id asString;
					look: (BrGlamorousRegularEditorLook new fontSize: 14; foreground: Color gray);
					vFitContent;
					hFitContent;
					beReadOnlyWithoutSelection.

				topTile
					addChild: iconContainer;
					addChild: topEditorElement.
				bottomTile addChild: userButton.
				tileContainer 
					addChild: topTile;
					addChild: bottomTile.
				scrollableContainer addChild: tileContainer ].
			mainContainer addChild: scrollableContainer.
			mainContainer ].
]

{ #category : #accessing }
TDUser >> id [
	^ id.
]

{ #category : #accessing }
TDUser >> id: anInteger [
	id := anInteger.
]

{ #category : #accessing }
TDUser >> initialize [
	super initialize.
	id := 0.
]

{ #category : #accessing }
TDUser >> posts [
	^ posts.
]

{ #category : #accessing }
TDUser >> requestPostsFromThisUser [
	^ TDClient new request requestPostsForUserId: self id.
]

{ #category : #accessing }
TDUser >> requestTodosFromThisUser [
	^ TDClient new request requestTodosForUserId: self id.
]

{ #category : #accessing }
TDUser >> todos [
	^ todos.
]
