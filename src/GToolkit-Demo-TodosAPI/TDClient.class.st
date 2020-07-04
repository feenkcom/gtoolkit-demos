Class {
	#name : #TDClient,
	#superclass : #Object,
	#instVars : [
		'posts',
		'signalProgress',
		'rawJSON',
		'todos',
		'comments'
	],
	#category : #'GToolkit-Demo-TodosAPI-Client'
}

{ #category : #accessing }
TDClient >> comments [
	^ comments.
]

{ #category : #accessing }
TDClient >> getAllComments [
	comments := self request
		requestAllComments
		execute.
]

{ #category : #accessing }
TDClient >> getAllCommentsForPostId: anInteger [
	comments := self request
		requestCommentsForPostId: anInteger;
		execute.
]

{ #category : #accessing }
TDClient >> getAllPosts [
	posts := self request
		requestAllPosts;
		execute.
]

{ #category : #accessing }
TDClient >> getAllPostsForUserId: anInteger [
	posts := self request
		requestPostsForUserId: anInteger;
		execute.
]

{ #category : #accessing }
TDClient >> getAllTodos [
	todos := self request
		requestAllTodos;
		execute.
]

{ #category : #accessing }
TDClient >> getAllTodosForUserId: anInteger [
	todos := self request
		requestTodosForUserId: anInteger;
		execute.
]

{ #category : #accessing }
TDClient >> getCommentWithId: anInteger [
	comments add: (self request
		requestCommentWithId: anInteger;
		execute).
]

{ #category : #accessing }
TDClient >> getPostWithId: anInteger [
	posts add: (self request
		requestPostWithId: anInteger;
		execute).
]

{ #category : #accessing }
TDClient >> getTodoWithId: anInteger [
	todos add: (self request
		requestTodoWithId: anInteger;
		execute).
]

{ #category : #accessing }
TDClient >> gtCommentsListFor: aView [
	<gtView>
	self comments ifEmpty: [^ aView empty].
	^ aView columnedList
		title: 'Comments' translated;
		priority: 5;
		items: [ self comments ];
		column: 'Id' translated do: [ :aColumn | 
			aColumn item: [ :aComment | aComment id ] ];
		column: 'Name' translated do: [ :aColumn | 
			aColumn item: [ :aComment | aComment name ] ].
]

{ #category : #accessing }
TDClient >> gtCompletedTodosFor: aView [
	<gtView>
	(self todos size < 2) ifTrue: [ ^ aView empty ].
	^ aView columnedList
		title: 'Completed' translated;
		priority: 10;
		items: [ self todos select: [ :aToDo |
			aToDo completed ] ];
		column: 'Id' translated do: [ :aColumn | 
			aColumn item: [ :aToDo | aToDo id ] ];
		column: 'Title' translated do: [ :aColumn | 
			aColumn item: [ :aToDo | aToDo title ] ].
]

{ #category : #accessing }
TDClient >> gtJSONFor: aView [
	<gtView>
	self rawJSON ifNil: [^ aView empty].
	^ aView explicit
		title: 'Raw JSON' translated;
		priority: 10;
		actionButtonIcon: BrGlamorousIcons tree asElement 
			action: [ :aButton | aButton phlow spawnObject: (STONJSON fromString: self rawJSON) ];
		stencil: [ | editorElement textEditor text |
			textEditor := BrTextEditor new.
			textEditor styler: JSONParser gtStyler.
			editorElement := BrEditorElement new.
			editorElement editor: textEditor.
			text := (STONJSON toStringPretty: (STONJSON fromString: self rawJSON)) asRopedText.
			text glamorousCodeFontDo: #beNotOverwritableByStyler; glamorousCodeSizeDo: #beNotOverwritableByStyler.
			textEditor text: text.
			editorElement
				padding: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			editorElement ]
]

{ #category : #accessing }
TDClient >> gtNotCompletedTodosFor: aView [
	<gtView>
	(self todos size < 2) ifTrue: [ ^ aView empty ].
	^ aView columnedList
		title: 'Not Completed' translated;
		priority: 10;
		items: [ self todos select: [ :aToDo |
			aToDo completed not ] ];
		column: 'Id' translated do: [ :aColumn | 
			aColumn item: [ :aToDo | aToDo id ] ];
		column: 'Title' translated do: [ :aColumn | 
			aColumn item: [ :aToDo | aToDo title ] ].
]

{ #category : #accessing }
TDClient >> gtPostsListFor: aView [
	<gtView>
	self posts ifEmpty: [^ aView empty].
	^ aView columnedList
		title: 'Posts' translated;
		priority: 5;
		items: [ self posts ];
		column: 'Id' translated do: [ :aColumn | 
			aColumn item: [ :aPost | aPost id ] ];
		column: 'Title' translated do: [ :aColumn | 
			aColumn item: [ :aPost | aPost title ] ].
]

{ #category : #accessing }
TDClient >> gtTodoTilesFor: aView [
	<gtView>
	self todos ifEmpty: [^ aView empty].
	^ aView explicit
		title: 'Todo Tiles' translated;
		priority: 5;
		stencil: [
			| mainContainer scrollableContainer topEditorElement iconContainer tileContainer topTile bottomTile labelLook userButton |
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
				labelLook := BrTextLabelLook new
					glamorousRegularFont;
					fontSize: 14;
					foreground: Color gray.
				userButton := BrButton new
					margin: (BlInsets top: 0 right: 5 bottom: 5 left: 47);
					label: 'User ', each userId asString;
					look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 12);
					action: [ :aButton |
						aButton phlow spawnObject: (each user)].

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
TDClient >> gtTodosListFor: aView [
	<gtView>
	self todos ifEmpty: [^ aView empty].
	^ aView columnedList
		title: 'Todos' translated;
		priority: 5;
		items: [ self todos ];
		column: 'Id' translated do: [ :aColumn | 
			aColumn item: [ :aToDo | aToDo id ] ];
		column: 'Title' translated do: [ :aColumn | 
			aColumn item: [ :aToDo | aToDo title ] ].
]

{ #category : #accessing }
TDClient >> initialize [
	super initialize.
	posts := OrderedCollection new.
	todos := OrderedCollection new.
	comments := OrderedCollection new.
	signalProgress := false.
]

{ #category : #accessing }
TDClient >> posts [
	^ posts.
]

{ #category : #accessing }
TDClient >> rawJSON [
	^ rawJSON.
]

{ #category : #accessing }
TDClient >> rawJSON: aString [
	rawJSON := aString.
]

{ #category : #accessing }
TDClient >> request [
	^ TDDownloadCommand new
		client: self;
		signalProgress: self signalProgress.
]

{ #category : #accessing }
TDClient >> signalProgress [
	^ signalProgress.
]

{ #category : #accessing }
TDClient >> signalProgress: aBoolean [
	signalProgress := aBoolean.
]

{ #category : #accessing }
TDClient >> todos [
	^ todos.
]
