Class {
	#name : #TDClient,
	#superclass : #Object,
	#instVars : [
		'serverUrl',
		'posts',
		'signalProgress',
		'rawJSON',
		'todos'
	],
	#category : #'GToolkit-Demo-TodosAPI-Client'
}

{ #category : #accessing }
TDClient >> getAllPosts [
	<return: #Array of: #TDSimplePost>
	serverUrl := 'https://jsonplaceholder.typicode.com/posts'.
	posts := TDDownloadPostsListCommand new
		client: self;
		signalProgress: self signalProgress;
		execute;
		list.
]

{ #category : #accessing }
TDClient >> getAllPostsFromUserWithId: anInteger [
	serverUrl := 'https://jsonplaceholder.typicode.com/posts?userId=', anInteger asString.
	posts := TDDownloadPostsListCommand new
		client: self;
		signalProgress: self signalProgress;
		execute;
		list.
]

{ #category : #accessing }
TDClient >> getAllTodos [
	serverUrl := 'https://jsonplaceholder.typicode.com/todos'.
	todos := TDDownloadTodosListCommand new
		client: self;
		signalProgress: self signalProgress;
		execute;
		list.
]

{ #category : #accessing }
TDClient >> getAllTodosFromUserWithId: anInteger [
	serverUrl := 'https://jsonplaceholder.typicode.com/todos?userId=', anInteger asString.
	todos := TDDownloadTodosListCommand new
		client: self;
		signalProgress: self signalProgress;
		execute;
		list.
]

{ #category : #accessing }
TDClient >> getPostWithId: anInteger [
	serverUrl := 'https://jsonplaceholder.typicode.com/posts/', anInteger asString.
	posts add: (TDDownloadPostCommand new
		client: self;
		signalProgress: self signalProgress;
		execute;
		post).
]

{ #category : #accessing }
TDClient >> getTodoWithId: anInteger [
	serverUrl := 'https://jsonplaceholder.typicode.com/todos/', anInteger asString.
	todos add: (TDDownloadTodoCommand new
		client: self;
		signalProgress: self signalProgress;
		execute;
		toDo).
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
			| mainContainer scrollableContainer editorElement container text |
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
				container := BlElement new
					layout: BlLinearLayout horizontal;
					background: Color white;
					look: BrShadowLook;
					padding: (BlInsets all: 5);
					margin: (BlInsets all: 5);
					constraintsDo: [:c |
						c vertical fitContent.
						c horizontal matchParent].
			
	text := 'Id: ' asRopedText, each id asRopedText, String cr asRopedText, 'User Id: ' asRopedText, each userId asRopedText, String cr asRopedText, 'Title: ' asRopedText, each title asRopedText, String cr asRopedText, 'Completed: ' asRopedText, each completed asRopedText.
				"text := 'Id: ' asRopedText, each id asRopedText, String cr asRopedText, 'Title: ' asRopedText, each title asRopedText."
	
				editorElement := BrEditor new
					look: (BrGlamorousRegularEditorLook new fontSize: 14);
					vFitContent;
					hMatchParent;
					text: text.		
		
				container addChild: editorElement.
				scrollableContainer addChild: container ].
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
	serverUrl := ''.
	posts := OrderedCollection new.
	todos := OrderedCollection new.
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
TDClient >> serverUrl [
	^ serverUrl.
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
