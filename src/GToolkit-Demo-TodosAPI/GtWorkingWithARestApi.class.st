Class {
	#name : #GtWorkingWithARestApi,
	#superclass : #GtLiveShow,
	#category : #'GToolkit-Demo-TodosAPI-Presentation'
}

{ #category : #accessing }
GtWorkingWithARestApi >> apiExamples [
	| bottomContainer firstExampleContainer secondExampleContainer thirdExampleContainer |
	
	firstExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 16) + (BrGlamorousLabelTooltipLook new text: 'https://jsonplaceholder.typicode.com/todos');
			label: 'https://jsonplaceholder.typicode.com/todos';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/todos']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			look: BrShadowLook;
			background: Color white;
			addChild: ((TDExamples new requestAllTodosRawExample gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).
	
	secondExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 16) + (BrGlamorousLabelTooltipLook new text: 'https://jsonplaceholder.typicode.com/posts?userId=4');
			label: 'https://jsonplaceholder.typicode.com/posts?userId=4';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/posts?userId=4']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			look: BrShadowLook;
			background: Color white;
			addChild: ((TDExamples new requestPostsForUserWithIdFourRawExample gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).
	
	thirdExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 16) + (BrGlamorousLabelTooltipLook new text: 'https://jsonplaceholder.typicode.com/todos/8');
			label: 'https://jsonplaceholder.typicode.com/todos/8';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/todos/8']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			look: BrShadowLook;
			background: Color white;
			addChild: ((TDExamples new requestTodoWithIdEightRawExample gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).
	
	bottomContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChildren: { firstExampleContainer. secondExampleContainer. thirdExampleContainer }.
	
	^ BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout vertical;
		margin: (BlInsets all: 5);
		addChild: (BrEditor new
			hMatchParent;
			vFitContent;
			look: BrEditorLook;
			text: self apiExplanationText;
			margin: (BlInsets top: 20 right: 5 bottom: 100 left: 5));
		addChild: bottomContainer.
]

{ #category : #accessing }
GtWorkingWithARestApi >> apiExamplesSlideFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: 6;
		element: [ self apiExamples ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> apiExplanationText [
	^ 'By using different links, like the ones presented below, we make requests to the api. The response we get is in the form of a JSON file containing the information we requested.' asRopedText
		glamorousRegularFont;
		fontSize: 16.
]

{ #category : #accessing }
GtWorkingWithARestApi >> clientExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: ('The Client' asRopedText bold; fontSize: 18);
		newTextWithFormat: self clientSlideText;
		element: [ BlElement new
			background: Color white;
			look: BrShadowLook;
			margin: (BlInsets right: 5);
			addChild: (GtClassCoder forClass: TDClient) asElement ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> clientSlideText [
	^ 'The client is the main component in this model. Using it we can make different requests to the API. The responses from the API, in the form of JSON files, are then parsed and stored inside corresponding objects so we can better visualize them.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> commentsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 19;
		newFadedText: 'And a request for a comment will return you that comment with everything you need to know about it.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getCommentWithId: 5.'};
			inspectSnippetAt: 1 ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> commentsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 18;
		newTextWithFormat: ('Comments' asRopedText bold; fontSize: 18);
		newTextWithFormat: self commentsSlideText;
		element: [ BlElement new
			background: Color white;
			look: BrShadowLook;
			margin: (BlInsets right: 5);
			addChild: (GtClassCoder forClass: TDComment) asElement ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> commentsSlideText [
	^ 'Finally, a comment is left by a user to a post. It can be identified by an id and it stores the text comment, the id of the post it was left on and the name and email of the user that left it.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> coreSlideText [
	^ 'To store the information we create a structure of classes where each class will represent a type of information that can be requested from the API. At the same time, each class has its default variant for usual cases and its null variant for instances where the requested information is not found.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> dataStructuresExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: ('Data Structures' asRopedText bold; fontSize: 18);
		newTextWithFormat: self coreSlideText;
		element: [ BlElement new
			background: Color white;
			look: BrShadowLook;
			margin: (BlInsets right: 5);
			addChild: (GtPackageTagCoder forPackageTag: ((GtClassCoder forClass: TDUser) packageTag)) asElement ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> getAllTodosMethodCoderWithExplanationTargets [
	| coder coderElement selectors literals variables |
	
	coder := GtMethodCoder forMethod: TDClient>>#getAllTodos.
	selectors := GtSelectorExplanationLinkStyler new.
	selectors
		addSelectors:
			{#requestForUrl: . #rawData:}.
	variables := GtVariableExplanationLinkStyler new.
	variables
		addVariables:
			{#dictionaries . #dict . #TDTodo . #TDTodosGroup}.
	literals := GtLiteralExplanationLinkStyler new.
	literals
		addLiteral: 'https://jsonplaceholder.typicode.com/todos' withIdentifier: #url.
	coder
		explanationLink:
			(GtCompositeExplanationLinkStyler
				forLinks:
					{selectors . variables . literals}).
	coderElement := (coder expanded: true) asElement.
	coderElement forceLayout.
	^ coderElement.
]

{ #category : #accessing }
GtWorkingWithARestApi >> getAllTodosMethodExplanation [
	| aScripter coderExpandedElement |
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Add Coder Element'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ self getAllTodosMethodCoderWithExplanationTargets ] ].
	aScripter
		substep: 'Wait'
		do: [ :aStep | 
			aStep wait forEmptySpaceTaskQueue ].
	aScripter
		substep: 'Expand first method inside coder'
		do: [ :aStep | 
			aStep click
				label: 'Click on expand adornment';
				onBreadthFirstChildOfClass: GtSourceCoderExpandedContentElement;
				onBreadthFirstChildOfClass: BrEditor;
				onChildAt: 4;
				onChildAt: 6.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter
		substep: 'Expand second method inside coder'
		do: [ :aStep | 
			aStep click
				label: 'Click on expand adornment';
				onBreadthFirstChildOfClass: GtSourceCoderExpandedContentElement;
				onBreadthFirstChildOfClass: BrEditor;
				onChildAt: 7;
				onChildAt: 7.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ (aScripter elementWithoutParent)
		vMatchParent;
		hMatchParent.
]

{ #category : #accessing }
GtWorkingWithARestApi >> getAllTodosMethodExplanationText [
	| text |
	text := 'This is how a request is implemented. First we send a GET ' asRopedText,
('request' asRopedText glamorousExplanationFor: #requestForUrl:),
' to the API using the specific ' asRopedText,
('url' asRopedText glamorousExplanationFor: #url),
' for it.
The response is transformed into a ' asRopedText,
('list of dictionaries' asRopedText glamorousExplanationFor: #dictionaries),
', where ' asRopedText,
('each dictionary' asRopedText glamorousExplanationFor: #dict),
' represents a certain todo. For each of them we ' asRopedText,
('save the information' asRopedText glamorousExplanationFor: #rawData:),
' in a ' asRopedText,
('todo' asRopedText glamorousExplanationFor: #TDTodo),
'object thus obtaining a ' asRopedText,
('group of todos' asRopedText glamorousExplanationFor: #TDTodosGroup),
'as a result.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 5;
		newTextWithFormat:
			('In this slideshow, we exemplify how we can understand and browse an existing REST API containing posts, todos and comments, made by different users.' asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
]

{ #category : #accessing }
GtWorkingWithARestApi >> modelDescriptionIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 7;
		newTextWithFormat: 
			('Now let''s see how we can implement a user interface for this model and also how to display the information resulted in a more easy way to understand.' asRopedText 
				glamorousRegularFont;
				fontSize: 18).
]

{ #category : #accessing }
GtWorkingWithARestApi >> postsSlideText [
	^ 'The simple post is the second type of post a user can make. It is similar to the todo. The difference is that the post has a body of text instead of the status. It also has a list of comments left by other users to the specific post.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> requestMethodExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 10;
		newFadedText: 'And here is how the result of that request looks like.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getAllTodos.'};
			inspectSnippetAt: 1 ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> requestMethodExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: (self getAllTodosMethodExplanationText);
		element: [ self getAllTodosMethodExplanation ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> requestSnippetsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 20;
		newFadedText: 'You can play around with the snippets below to better see the model at work';
		element: [ GtPlaygroundSlide new
			snippets: {
				'TDClient new getCommentWithId: 6'.
				'TDClient new getPostWithId: 3'. 
				'TDClient new getTodoWithId: 4'. 
				'TDClient new getUserWithId: 5'. 
				'TDClient new getAllPosts'.
				'TDClient new getAllTodos' };
			asElement ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> simplePostsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 17;
		newFadedText: 'Similar with todos, a request for a post will return you that post.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getPostWithId: 3.'};
			inspectSnippetAt: 1 ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> simplePostsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 16;
		newTextWithFormat: ('Simple Posts' asRopedText bold; fontSize: 18);
		newTextWithFormat: self postsSlideText;
		element: [ BlElement new
			background: Color white;
			look: BrShadowLook;
			margin: (BlInsets right: 5);
			addChild: (GtClassCoder forClass: TDPost) asElement ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Working with a REST API' asRopedText
			fontSize: 70;
			glamorousRegularFont).
]

{ #category : #accessing }
GtWorkingWithARestApi >> todosExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 15;
		newFadedText: 'A request for a todo will return you that todo with all the information stored about it.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getTodoWithId: 8.'};
			inspectSnippetAt: 1 ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> todosExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 14;
		newTextWithFormat: ('Todos' asRopedText bold; fontSize: 18);
		newTextWithFormat: self todosSlideText;
		element: [ BlElement new
			background: Color white;
			look: BrShadowLook;
			margin: (BlInsets right: 5);
			addChild: (GtClassCoder forClass: TDTodo) asElement ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> todosSlideText [
	^ 'Then we have a todo, that is a type of post a user can make. It holds the following information: the user it is associated with, an id, a title and a status, specifically if it was completed or not.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> userExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 13;
		newFadedText: 'Requesting a user will return that user with its information and the lists of posts and todos made by him.';
		element: [ GtPlaygroundLiveSlide new
			snippets: {'TDClient new getUserWithId: 4.'};
			inspectSnippetAt: 1 ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> userExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 12;
		newTextWithFormat: ('Users' asRopedText bold; fontSize: 18);
		newTextWithFormat: self userSlideText;
		element: [ BlElement new
			background: Color white;
			look: BrShadowLook;
			margin: (BlInsets right: 5);
			addChild: (GtClassCoder forClass: TDUser) asElement ].
]

{ #category : #accessing }
GtWorkingWithARestApi >> userSlideText [
	^ 'The first type of data is a user, that can be identified by an id. He also has a list of posts and a list of todos, associated with him. The two lists are are obtained through two separate requests to the API, after the user has been requested.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]
