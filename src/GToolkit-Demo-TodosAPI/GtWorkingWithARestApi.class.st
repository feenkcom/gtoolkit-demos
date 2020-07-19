Class {
	#name : #GtWorkingWithARestApi,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-TodosAPI-Presentation'
}

{ #category : #accessing }
GtWorkingWithARestApi >> allTodosRequestJsonResultExplanation [
	| leftContainer rightContainer inspectorElement |
	leftContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		padding: (BlInsets all: 5);
		addChild: (BrEditor new
			look: BrGlamorousEditorLook;
			vExact: 200;
			text: self allTodosRequestJsonResultExplanationText;
			margin: (BlInsets all: 5));
		addChild: (BrButton new
			look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 16);
			label: 'https://jsonplaceholder.typicode.com/todos';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/todos'] ).
		
	inspectorElement := BlUseAsyncFeatures disableDuring: [
	(GtPhlowView empty composite
		views: {TDExamples new requestAllTodosRawExample gtJsonFor: GtPhlowView empty};
		labelled: 'a ZnResponse' asRopedText) asElementDo: [ :e | e ]].
	inspectorElement forceLayout.
	inspectorElement phlow firstChildWithView viewContentElement.

	rightContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: inspectorElement.
	
	^ BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		addChild: leftContainer;
		addChild: rightContainer.
]

{ #category : #accessing }
GtWorkingWithARestApi >> allTodosRequestJsonResultExplanationText [
	^ 'Or you can just request a list of all the todos in the system, using the link below.' asRopedText
		glamorousRegularFont;
		fontSize: 16.
]

{ #category : #accessing }
GtWorkingWithARestApi >> clientSlideText [
	^ 'The first step is to create the client. This is the component you interact with. Through it you can make different requests to the API.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> commentsSlideText [
	^ 'Finally, a comment is left by a user to a post. It can be identified by an id and it stores the text comment, the id of the post it was left on and the name and email of the user that left it.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> coreSlideText [
	^ 'The information obtained from parsing the JSON file needs to be stored somewhere. So we create a structure of classes to help us with that. Each class will have its default variant and its null variant for instances where the request information is not found.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> create [
	| slideshow |
	slideshow := GtSlideShow new.
	slideshow
		slides:
			{(GtTitleSlide new
				titleText: ('Working with a REST API' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
			(GtTextSlide new
				newTextWithFormat: ('In this slideshow, we exemplify how we can understand and browse an existing REST API containing posts, todos and comments, made by different users.' asRopedText glamorousRegularFont; fontSize: 18)).
			(GtElementSlide new
				element: [ self todoRequestJsonResultExplanation ]).
			(GtElementSlide new
				element: [ self postsRequestJsonResultExplanation ]).
			(GtElementSlide new
				element: [ self allTodosRequestJsonResultExplanation ]).
			(GtTextSlide new
				newTextWithFormat: ('Now let''s see how we can implement a user interface for this model and also how to display the information resulted in a more easy way to understand.' asRopedText glamorousRegularFont; fontSize: 18)).
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Client' asRopedText bold; fontSize: 18);
				newTextWithFormat: self clientSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtClassCoder forClass: TDClient) asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'For example, you can make a request for all the posts in the system, as it is presented below.';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestAllPosts);
					asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Requests' asRopedText bold; fontSize: 18);
				newTextWithFormat: self requestsSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtClassCoder forClass: TDDownloadCommand) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Parsing' asRopedText bold; fontSize: 18);
				newTextWithFormat: self parsingSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtClassCoder forClass: TDJsonMapping) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Data Structures' asRopedText bold; fontSize: 18);
				newTextWithFormat: self coreSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtPackageTagCoder forPackageTag: ((GtClassCoder forClass: TDUser) packageTag)) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Users' asRopedText bold; fontSize: 18);
				newTextWithFormat: self userSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtClassCoder forClass: TDUser) asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'Requesting a user will return that user with its information and the lists of posts and todos made by him.';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestUserWithIdFour);
					asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Todos' asRopedText bold; fontSize: 18);
				newTextWithFormat: self todosSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtClassCoder forClass: TDTodoPost) asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'A request for a todo will return you that todo with all the informations stored about it.';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestTodoWithIdEight);
					asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Simple Posts' asRopedText bold; fontSize: 18);
				newTextWithFormat: self postsSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtClassCoder forClass: TDSimplePost) asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'Similar with todos, a request for a post will return you that post.';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestPostWithIdThree);
					asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Comments' asRopedText bold; fontSize: 18);
				newTextWithFormat: self commentsSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					margin: (BlInsets right: 5);
					addChild: (GtClassCoder forClass: TDComment) asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'And a request for a comment will return you that comment with everything you need to know about it.';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestCommentWithIdFive);
					asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'You can play around with the snippets below to better see the model at work';
				element: [ GtPlaygroundSlide new
					snippets: {
						'TDClient new getCommentWithId: 6'.
						'TDClient new getPostWithId: 3'. 
						'TDClient new getTodoWithId: 4'. 
						'TDClient new getUserWithId: 5'. 
						'TDClient new getAllPosts'.
						'TDClient new getAllTodos' };
					asElement ]).
			}.
	^ slideshow makeArrowsVisible.
]

{ #category : #accessing }
GtWorkingWithARestApi >> parsingSlideText [
	^ 'While parsing the JSON file we choose what information to store for each type of data by mapping the information to methods named accordingly.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> postsRequestJsonResultExplanation [
	| leftContainer rightContainer inspectorElement |
	leftContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal fitContent ];
		padding: (BlInsets all: 5);
		addChild: (BrEditor new
			look: BrGlamorousEditorLook;
			vExact: 200;
			text: self postsRequestJsonResultExplanationText;
			margin: (BlInsets all: 5));
		addChild: (BrButton new
			look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 16);
			label: 'https://jsonplaceholder.typicode.com/posts?userId=4';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/posts?userId=4'] ).
		
	inspectorElement := BlUseAsyncFeatures disableDuring: [
	(GtPhlowView empty composite
		views: {TDExamples new requestPostsForUserWithIdFourRawExample gtJsonFor: GtPhlowView empty};
		labelled: 'a ZnResponse' asRopedText) asElementDo: [ :e | e ]].
	inspectorElement forceLayout.
	inspectorElement phlow firstChildWithView viewContentElement.

	rightContainer := BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		layout: BlLinearLayout horizontal;
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: inspectorElement.
	
	^ BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		addChild: leftContainer;
		addChild: rightContainer.
]

{ #category : #accessing }
GtWorkingWithARestApi >> postsRequestJsonResultExplanationText [
	^ 'Similarly, we can tell the API to return from all the posts, the one that has the user id equal to 4. This is done with the following url.' asRopedText
		glamorousRegularFont;
		fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> postsSlideText [
	^ 'The simple post is the second type of post a user can make. It is similar to the todo. The difference is that the post has a body of text instead of the status. It also has a list of comments left by other users to the specific post.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> requestsSlideText [
	^ 'After that, we work on the actual requests. Based on the information from the client, the specific URLs are created and the information is received from the API in the form of a JSON file. This file will then be sent to a parser to read and save the data we need from it, so we can display it in a more pleasent form.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> todoRequestJsonResultExplanation [
	| leftContainer rightContainer inspectorElement |
	leftContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal fitContent ];
		padding: (BlInsets all: 5);
		addChild: (BrEditor new
			vExact: 200;
			look: BrGlamorousEditorLook;
			text: self todoRequestJsonResultExplanationText;
			margin: (BlInsets all: 5));
		addChild: (BrButton new
			look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 16);
			label: 'https://jsonplaceholder.typicode.com/todos/8';
			action: [ :aButton | WebBrowser openOn: 'https://jsonplaceholder.typicode.com/todos/8'] ).
		
	inspectorElement := BlUseAsyncFeatures disableDuring: [
	(GtPhlowView empty composite
		views: {TDExamples new requestTodoWithIdEightRawExample gtJsonFor: GtPhlowView empty};
		labelled: 'a ZnResponse' asRopedText) asElementDo: [ :e | e ]].
	inspectorElement forceLayout.
	inspectorElement phlow firstChildWithView viewContentElement.

	rightContainer := BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		layout: BlLinearLayout horizontal;
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: inspectorElement.
	
	^ BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		addChild: leftContainer;
		addChild: rightContainer.
]

{ #category : #accessing }
GtWorkingWithARestApi >> todoRequestJsonResultExplanationText [
	^ 'For example, if you access the link below, you initiate a request that tells the API to return from all the todos, the one with id 8.' asRopedText
		glamorousRegularFont;
		fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> todosSlideText [
	^ 'Then we have a todo, that is a type of post a user can make. It holds the following informations: the user it is asscoated with, an id, a title and a status, specifically if it was completed or not.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]

{ #category : #accessing }
GtWorkingWithARestApi >> userSlideText [
	^ 'The first type of data is a user, that can be identified by an id. He also has a list of posts and a list of todos, associated with him. The two lists are are obtained through two separate requests to the API, after the user has been requested.' asRopedText
	glamorousRegularFont;
	fontSize: 18.
]
